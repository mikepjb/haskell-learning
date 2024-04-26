.PHONY: build

# would be awesome to also `nix-shell -p cabal-install ghc`
build:
	mkdir -p ./dist ./tmp
	ghc -outputdir ./tmp -o ./dist/hello ./hello.hs

clean:
	rm -rf ./dist ./tmp
