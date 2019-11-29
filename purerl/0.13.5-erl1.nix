{ pkgs }:

let
  version = "v0.13.5-erl1";

  src = pkgs.fetchurl {
    url = "https://github.com/purerl/purescript/releases/download/v0.13.5-erl1/linux64.tar.gz";
    sha256 = "0fckyhawrafzg6jbji8xy5jharimk1mwyijcw6v4jzl532m9kgvb";
  };

in
import ./mkPursDerivation.nix {
  inherit pkgs version src;
}

