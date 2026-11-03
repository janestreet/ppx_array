type nonrec 'a array = 'a array
type nonrec 'a iarray = 'a array

external length : 'a. ('a array[@local_opt]) -> int = "%array_length" [@@layout_poly]

external unsafe_set
  : 'a.
  ('a array[@local_opt]) -> (int[@local_opt]) -> 'a -> unit
  = "%array_unsafe_set"
[@@layout_poly]

external unsafe_get
  : 'a.
  ('a array[@local_opt]) -> (int[@local_opt]) -> 'a
  = "%array_unsafe_get"
[@@layout_poly]

external unsafe_to_array__promise_no_mutation
  : 'a.
  ('a iarray[@local_opt]) -> ('a array[@local_opt])
  = "%identity"
[@@layout_poly]

external unsafe_of_array__promise_no_mutation
  : 'a.
  ('a array[@local_opt]) -> ('a iarray[@local_opt])
  = "%identity"
[@@layout_poly]

external create : len:int -> 'a -> 'a array = "caml_make_vect"

let create_local = create
let magic_create_uninitialized ~len = create ~len (Stdlib.Obj.magic 0)
