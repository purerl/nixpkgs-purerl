{ pkgs }:

import ./mkPursDerivation.nix {
  inherit pkgs;

  version = "v0.13.5-erl1";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purescript/releases/download/v0.13.5-erl1/macos.tar.gz";
        sha256 = "1kwl7cwd62rldqzgsigrm3h9michfsicfddddhiwhy7nd20vxdss";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purescript/releases/download/v0.13.5-erl1/linux64.tar.gz";
        sha256 = "0fckyhawrafzg6jbji8xy5jharimk1mwyijcw6v4jzl532m9kgvb";
      };
}

