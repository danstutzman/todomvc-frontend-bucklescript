class type _reactdom = object
  method render : 'a -> 'b -> unit
end [@bs]

type reactdom = _reactdom Js.t

external reactdom : reactdom = "react-dom" [@@bs.module]
