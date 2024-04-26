.PHONY: run

# would be awesome to also `nix-shell -p cabal-install ghc`
run:
	cabal run

clean:
	rm -rf ./dist ./tmp
