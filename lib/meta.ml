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
List.map (fun s -> Printf.fprintf mk "%s\n\n" s) [
  "MODULE = $(notdir #(CURDIR))";
  "# all\n.PHONY: all\nall: bin/$(MODULE) lib/$(MODULE)\n\t$^";
  "# format\n.PHONY: format\nformat:";
  "# rule\nbin/$(MODULE): $(C) $(H)\n\t$(CXX) $(CFLAGS) -o $@ $(C) $(L)";
  "# doc\n.PHONY: doc\ndoc:";
  "# install\n.PHONY: install update gz\ninstall:\nupdate:\ngz:";
];;
close_out mk;;

let apt = open_out (meta ^ "/apt.txt");;
List.map (fun s -> Printf.fprintf apt "%s\n" s) [
  "git make curl";
  "code meld doxygen clang-format";
  "g++ flex bison libreadline-dev"
];;
close_out apt;;

let readme = open_out (meta ^ "/README.md");;
