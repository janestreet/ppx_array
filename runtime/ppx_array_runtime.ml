type 'a t = 'a array

external length : 'a. ('a array[@local_opt]) -> int = "%array_length" [@@layout_poly]

external unsafe_set
  : 'a.
  ('a array[@local_opt]) -> (int[@local_opt]) -> 'a -> unit
  = "%array_unsafe_set"
[@@layout_poly]

external%template unsafe_get
  : 'a.
  ('a array[@local_opt]) -> (int[@local_opt]) -> 'a
  = "%array_unsafe_get"
[@@mode m = (uncontended, shared)] [@@layout_poly]

[%%template
  external create : len:int -> 'a -> 'a array = "caml_make_vect"
  [@@alloc __ = (heap, stack)]]

let create_local = create
let magic_create_uninitialized ~len = create ~len (Stdlib.Obj.magic 0)
