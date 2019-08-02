type tVersion = string
type tURL     = string

type storage =
  { owner        : address
  ; lastVersion  : tVersion
  ; lastURL      : tURL
  (* next *)
  ; firmwareName : string
  }

let%entry newVersion ( ver, url : (tVersion * tURL) ) s =
  (* check owner *)
  if not ( Current.sender () = s.owner ) then
    Current.failwith "Authentication error.";
  
  (* update *)
  let s = s.lastVersion <- ver in
  let s = s.lastURL <- url in
  ([]: operation list), s
