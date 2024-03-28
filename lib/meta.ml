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
  "g++ flex bison libreadline-dev";
  (List.map (fun s -> Printf.sprintf "libsdl2%s-dev" s) [
    "";"-image";"-ttf";
    (* "-mixer";"-gfx";"-net" *)
  ] |> String.concat " ");
  "ocaml opam dune"
];;
close_out apt;;

let readme = open_out (meta ^ "/README.md");;

let ini = open_out (meta ^ "/lib/ini.ini");;
List.map (fun s -> Printf.fprintf ini "%s\n" s) [
  "# init script\n";
  "nop halt"
];;
close_out ini;;
