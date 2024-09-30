MODULE = hello

M += $(wildcard src/*.ml)

.PHONY: run format

run:
	dune exec $(MODULE)

$(MODULE): $(M)
	dune build

format: tmp/format_ml
tmp/format_ml: $(M)
	dune fmt && touch $@
