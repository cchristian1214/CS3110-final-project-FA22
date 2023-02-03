.PHONY: test check

build:
	dune build

code:
	-dune build
	code .
	! dune build --watch

play:
	OCAMLRUNPARAM=b dune exec bin/main.exe

doc:
	dune build @doc

zip:
	rm -f snakegame.zip
	zip -r snakegame.zip . 

test:
	OCAMLRUNPARAM=b dune exec test/test.exe
