(* metaCompiler *)

let meta = "meta" ;;
let perm = 0o755 ;;
let dirs = [ ".vscode" ; "bin"; "doc"; "lib"; "inc"; "src"; "tmp" ] ;;
let dirs = [ meta ] @ List.map (fun s -> meta ^ "/" ^ s) dirs ;;
let mk dir = if not (Sys.file_exists dir ) then Sys.mkdir dir perm ;;

List.map mk dirs ;;

let giti = List.map open_out (List.map (fun dir -> dir ^ "/.gitignore") dirs);;
List.map (fun ch -> Printf.fprintf ch "!.gitignore\n") giti;;
List.map (fun ch -> flush ch) giti;;

let mk = open_out (meta ^ "/Makefile");;

let apt = open_out (meta ^ "/apt.txt");;

let readme = open_out (meta ^ "/README.md");;

