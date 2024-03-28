(* metaCompiler *)

let meta = "meta" ;;
let perm = 0o755 ;;
let dirs = [ "bin"; "doc"; "lib"; "inc"; "src"; "tmp" ] ;;
let dirs = [ meta ] @ List.map (fun s -> meta ^ "/" ^ s) dirs ;;
let mk dir = try Sys.mkdir dir perm with Sys_error _ -> () ;;

List.map mk dirs ;;

