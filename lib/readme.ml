open Printf

let readme meta =
  let file = open_out (meta ^ "/README.md") in
  List.map
    (fun s -> fprintf file "%s\n" s)
    [ "# `oc`"; "## OCaml-hosted #compilib: Compiler Library" ]
  |> ignore;
  close_out file;
  meta
;;
