{ pkgs }:

let
  version = "v0.13.2-erl1";

  src = pkgs.fetchurl {
    url = "https://github.com/purerl/purescript/releases/download/v0.13.2-erl1/linux64.tar.gz";
    sha256 = "1lr8g54a5jqcvwzq8bm9lwa1vg4qd8awv8svxwb83b2p1cv4lh5a";
  };

in
import ./mkPursDerivation.nix {
  inherit pkgs version src;
}

