MODULE = hello

M += $(wildcard src/*.ml)
D += $(wildcard dune*) $(wildcard src/dune*)

.PHONY: run format

run: $(M) $(D)
	dune build $(MODULE).exe
# dune exec $(MODULE)

format: tmp/format_ml
tmp/format_ml: $(M) $(D)
	dune fmt && touch $@
