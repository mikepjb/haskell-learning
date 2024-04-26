let
  myNixPkgs = import <nixpkgs> {};
in
myNixPkgs.mkShell rec {
  nativeBuildInputs = with myNixPkgs; [
    cabal-install # terminal app cabal
    ghc # Haskell compiler
    haskell-language-server # Haskell LSP
    zlib
    haskellPackages.zlib
    zstd
    haskellPackages.zstd
    lzma
    bzip2
    haskellPackages.bz2
  ];

  LD_LIBRARY_PATH = myNixPkgs.lib.makeLibraryPath nativeBuildInputs;
}
