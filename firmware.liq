type tVersion = string
type tURL     = string

type storage =
  { owner    : address
  ; version  : tVersion
  ; prevAddr : address
  ; url      : tURL
  ; digiSig  : signature
  }

let%entry main ( _ : unit ) s =
  ([]: operation list), s
