(* metaCompiler *)


let giti = List.map open_out (List.map (fun dir -> dir ^ "/.gitignore") dirs);;
List.map (fun ch -> fprintf ch "!.gitignore\n") giti;;
List.map (fun ch -> flush ch) giti;;

let apt = open_out (meta ^ "/apt.txt");;
List.map (fun s -> fprintf apt "%s\n" s) [
  "git make curl";
  "code meld doxygen clang-format";
  "g++ flex bison libreadline-dev";
  (List.map (fun s -> sprintf "libsdl2%s-dev" s) [
    "";"-image";"-ttf";
    (* "-mixer";"-gfx";"-net" *)
  ] |> String.concat " ");
  "ocaml opam dune"
];;
close_out apt;;

let ini = open_out (meta ^ "/lib/ini.ini");;
List.map (fun s -> fprintf ini "%s\n" s) [
  "# init script\n";
  "nop halt"
];;
close_out ini;;

let cf = open_out (meta ^ "/.clang-format");;
fprintf cf "BasedOnStyle: Google
IndentWidth:  4
TabWidth:     4
UseTab:       Never
ColumnLimit:  80
UseCRLF:      false

SortIncludes: false

AllowShortBlocksOnASingleLine: Always
AllowShortFunctionsOnASingleLine: All
";;
close_out cf;;

let mk = open_out (meta ^ "/Makefile");;
List.map (fun s -> fprintf mk "%s\n\n" s) [
  "# var\nMODULE = $(notdir $(CURDIR))";
  "# dir
CWD = $(CURDIR)
BIN = $(CWD)/bin
DOC = $(CWD)/doc
LIB = $(CWD)/lib
INC = $(CWD)/inc
SRC = $(CWD)/src
TMP = $(CWD)/tmp
GZ  = $(HOME)/gz";
  "# tool\nCURL = curl -L -o\nCF   = clang-format -style=file";
  "# src\nC += $(wildcard src/*.c*)\nH += $(wildcard inc/*.h*)";
  "# cfg\nCFLAGS += -I$(INC) -I$(SRC) -I$(TMP)";
  "# all\n.PHONY: all\nall: bin/$(MODULE) lib/ini.ini\n\t$^";
  "# format\n.PHONY: format\nformat: tmp/format_c\ntmp/format_c: $(C) $(H)\n\t$(CF) -i $? && touch $@";
  "# rule\nbin/$(MODULE): $(C) $(H) Makefile\n\t$(CXX) $(CFLAGS) -o $@ $(C) $(L)";
  "# doc\n.PHONY: doc\ndoc:";
  "# install\n.PHONY: install update gz\ninstall: doc gz
\t$(MAKE) update
update:
\tsudo apt update
\tsudo apt install -yu `cat apt.txt`
gz:";
];;
close_out mk;;

let cpp = open_out (meta ^ "/src/main.cpp");;
fprintf cpp "#include \"main.hpp\"

int main(int argc, char* argv[]) {
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
    }
    return 0;
}

void arg(int argc, char argv[]) {  //
    fprintf(stderr, \"argv[%%i] = <%%s>\\n\", argc, argv);
}";;
close_out cpp;;

let hpp = open_out (meta ^ "/inc/main.hpp");;
fprintf hpp "#pragma once

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

extern int main(int argc, char* argv[]);
extern void arg(int argc, char argv[]);
";;
close_out hpp;;
