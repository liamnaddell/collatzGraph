import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util

main :: IO ()
main = shakeArgs shakeOptions{shakeFiles="_build"} $ do
    want ["_build/collatzGraph" <.> exe]

    phony "clean" $ do
        putNormal "Cleaning files in _build"
        removeFilesAfter "_build" ["//*"]
        cmd "rm -f Main.hi Lib/Lib.hi"

    "_build/collatzGraph" <.> exe %> \out -> do
        need ["_build/Lib.o","_build/Main.o"]
        cmd "ghc _build/Lib.o _build/Main.o -o _build/collatzGraph"

    "_build/Lib.o" %> \out -> do
        need ["Lib/Lib.hs"]
        cmd "ghc -c Lib/Lib.hs -o _build/Lib.o"

    "_build/Main.o" %> \out -> do
        need ["_build/Lib.o"]
        cmd "ghc  Main.hs -c -o _build/Main.o"
