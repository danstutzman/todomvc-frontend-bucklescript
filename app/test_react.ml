type document

external document : document = "document" [@@bs.val]

type element

external getElementById : document -> string -> element = "getElementById"
[@@bs.send];;

let a   = React.a in
let h1  = React.h1 in
let h2  = React.h2 in
let div = React.div in
let li  = React.li in
let ul  = React.ul in
let rootElement = React.strip_child (div [|
  h1 [|
    ul [|
      li [|
        h2 ~className: "red" [| React.String "James Nelson" |],
        a ~href:"mailto:james@jamesknelson.com" [|
          React.String "james@jamesknelson.com"
        |]
      |],
      li [|
        h2 [| React.String "Joe Citizen" |],
        a ~href:"mailto:joe@example.com" [|
          React.String "joe@example.com"
        |]
      |]
    |]
  |]
|]) in
Reactdom.reactdom##render rootElement (getElementById document "react-app")
