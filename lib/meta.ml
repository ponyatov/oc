(* metaCompiler *)

let meta = "meta"
let perm = 0o755;;

try Sys.mkdir meta perm with Sys_error _ -> ()
