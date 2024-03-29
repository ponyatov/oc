(lang dune 2.0)
(name oc)

(authors     ["Dmitry Ponyatov <dponyatov@gmail.com>"])
(maintainers  "Dmitry Ponyatov <dponyatov@gmail.com>" )

(license MIT)

(generate_opam_files)

(homepage "https://github.com/ponyatov/oc")

(package
 (name oc)
 (synopsis "OCaml-hosted #compilib: Compiler Library")
 (description "")
 (depends ocaml core utop dune ocamlformat))
