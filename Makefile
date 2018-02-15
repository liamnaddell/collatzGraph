all:
	ghc --make main.hs

clean:
	rm -f main main.hi main.o
