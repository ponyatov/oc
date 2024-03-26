# var
MODULE  = $(notdir $(CURDIR))

# dir
CWD   = $(CURDIR)
BIN   = $(CWD)/bin
INC   = $(CWD)/inc
SRC   = $(CWD)/src
TMP   = $(CWD)/tmp
REF   = $(CWD)/ref
GZ    = $(HOME)/gz

# tool
CURL = curl -L -o
CF   = clang-format

# src
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)
M += $(wildcard bin/*.ml)
M += $(wildcard lib/parser/*.ml)
M += $(wildcard lib/ast/*.ml)

# all
.PHONY: all
all: $(M) Makefile dune-project
	dune build && _build/default/bin/main.exe

# format
format: tmp/format_c tmp/format_ml
tmp/format_c: $(C) $(H)
	$(CF) -style=file -i $? && touch $@
tmp/format_ml: $(M)
	ocamlformat -i $? && touch $@

# rule
bin/$(MODULE): $(C) $(H) Makefile
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)

# doc
.PHONY: doc
doc:

# install
.PHONY: install update gz ref
install: doc gz
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`
	opam install -y . --deps-only
gz:
