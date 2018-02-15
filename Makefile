all:
	ghc --make main.hs
clean:
    rm -f main.hi main.o
