MODULE = hello

M += $(wildcard src/*.ml)
D += $(wildcard dune*) $(wildcard src/dune*)

.PHONY: run format

run: $(M) $(D)
# dune build src/$(MODULE).exe
	dune exec src/$(MODULE).exe

format: tmp/format_ml
tmp/format_ml: $(M) $(D) .ocamlformat
	dune fmt && touch $@

.PHONY: install update
install: .ocamlformat
update:
	dune build ; opam install -y . --deps-only

.ocamlformat:
	echo "version=`ocamlformat --version`" > $@
	echo "profile=default"                >> $@
