all:
	ghc --make main.hs -o collatzGraph

clean:
	rm -f collatzGraph main.hi main.o Lib.hi Lib/Lib.hi Lib/Lib.o
