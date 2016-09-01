type element;;
type child = Element of element | String of string;;

(*let lose_type x = [%bs.raw{| arguments[0] |}]*)

let strip_child child = match child with
  | Element element -> [%bs.raw{| child[0] |}]
  | String string   -> [%bs.raw{| child[0] |}]

class type _dom = object
  method a   : 'a -> 'b array -> element
  method div : 'a -> 'b array -> element
  method h1  : 'a -> 'b array -> element
  method h2  : 'a -> 'b array -> element
  method li  : 'a -> 'b array -> element
  method ul  : 'a -> 'b array -> element
end [@bs]

type dom = _dom Js.t

class type _react = object
  method a : 'a -> unit
end [@bs]

type react = _react Js.t

external react : react = "react" [@@bs.module]
external dot_dom_of : react -> dom = "DOM" [@@bs.get]
let react_dot_dom = dot_dom_of react;;

let a ~href ?b children = Element (react_dot_dom##a [%bs.obj {
  href = href;
}] children)

let div children = Element (react_dot_dom##div [%bs.obj { style = Js.undefined }] children)
let h1 children = Element (react_dot_dom##h1 [%bs.obj { style = Js.undefined }] children)
let h2 ?className children = Element (react_dot_dom##h2 [%bs.obj {
  className = match className with Some x -> Js.Undefined.return x
                                 | None -> Js.Undefined.empty;
}] children)
let li children = Element (react_dot_dom##li [%bs.obj { style = Js.undefined }] children)
let ul children = Element (react_dot_dom##ul [%bs.obj { style = Js.undefined }] children)
