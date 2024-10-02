# var
MODULE = $(notdir $(CURDIR))

# src
M += $(wildcard src/*.ml)
D += $(wildcard dune*) $(wildcard src/dune*)

# all
.PHONY: run format

run: $(M) $(D)
# dune build src/$(MODULE).exe
	dune exec src/$(MODULE).exe

# format
format: tmp/format_ml
tmp/format_ml: $(M) $(D) .ocamlformat
	dune fmt ; touch $@

.ocamlformat:
	echo "version=`ocamlformat --version`" > $@
	echo "profile=default"                >> $@

# install
.PHONY: install update
install:
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
	opam update
	opam install -y . --deps-only
