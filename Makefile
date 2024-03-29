# var
MODULE = $(notdir $(CURDIR))

# dir
CWD = $(CURDIR)
BIN = $(CWD)/bin
DOC = $(CWD)/doc
LIB = $(CWD)/lib
INC = $(CWD)/inc
SRC = $(CWD)/src
TMP = $(CWD)/tmp
GZ  = $(HOME)/gz

# tool
CURL = curl -L -o
CF   = clang-format -style=file

# src
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)
M += $(wildcard bin/*.ml)
M += $(wildcard lib/*.ml)
M += $(wildcard lib/parser/*.ml)
M += $(wildcard lib/ast/*.ml)

# cfg
CFLAGS += -I$(INC) -I$(SRC) -I$(TMP)

# all
.PHONY: all
all:
	dune build
# all: bin/$(MODULE) lib/ini.ini
# 	$^

# format
.PHONY: format
format: tmp/format_c tmp/format_ml
tmp/format_c: $(C) $(H)
	$(CF) -i $? && touch $@
tmp/format_ml: $(M) .ocamlformat
	ocamlformat -i $(M) && touch $@

# rule
bin/$(MODULE): $(C) $(H) Makefile
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)

# doc
.PHONY: doc
doc:

# install
.PHONY: install update gz
install: doc gz
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`
	opam install -y . --deps-only
gz:

