let about = "meta"

include Readme
include Makefile

(* open Printf;; *)

let meta = "meta"
let perm = 0o755
let dirs = [ ".vscode"; "bin"; "doc"; "lib"; "inc"; "src"; "tmp" ]
let dirs = [ meta ] @ List.map (fun s -> meta ^ "/" ^ s) dirs
let mk dir = if not (Sys.file_exists dir) then Sys.mkdir dir perm;;

List.map mk dirs;;
meta |> readme
