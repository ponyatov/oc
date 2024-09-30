M += $(wildcard *.ml)

.PHONY: run format

run: hello
	./$^

hello: $(M)
	dune build

format: $(M)
	dune fmt
