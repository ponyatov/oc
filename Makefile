MODULE = hello

M += $(wildcard *.ml)

.PHONY: run format

run: $(MODULE)
	./$^

$(MODULE): $(M)
	dune build

format: tmp/format_ml
tmp/format_ml: $(M)
	dune fmt && touch $@
