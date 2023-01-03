{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.19";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "11ycay44lx0xyg2mmmbky1nvgan0yjqfklmpjkyn0qyh1qi80lwd";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "0lw1dgsdq5nbxwapq6y8fb7l2s9gp6429pyvbp24adcf4lniihjl";
      };
})
