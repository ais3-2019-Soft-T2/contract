type tVersion = string
type tURL     = string

type storage =
  { owner          : address
  ; latestVersion  : tVersion
  ; latestURL      : tURL
  ; firmwareName   : string
  ; digiSig        : signature
  }

let%entry newVersion ( ver, url : (tVersion * tURL) ) s =
  (* check owner *)
  if not ( Current.sender () = s.owner ) then
    Current.failwith "Authentication error.";
  
  (* update *)
  let s = s.latestVersion <- ver in
  let s = s.latestURL <- url in
  ([]: operation list), s
