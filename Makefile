GHC=ghc
EXE="_build/collatzGraph"
all: _build/Lib.o _build/Main.o 
	$(GHC) $^ -o $(EXE)

.PHONY: clean
clean:
	rm -f Main.hi Lib/Lib.hi _build/Lib.o _build/Main.o _build/collatzGraph

_build/Lib.o: Lib/Lib.hs
	ghc -c $< -o $@

_build/Main.o: Main.hs
	ghc -c $< -o $@	
