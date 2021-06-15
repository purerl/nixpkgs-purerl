{ pkgs }:

import ./mkPurerlDerivation.nix (rec {
  inherit pkgs;

  version = "0.0.8";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v{$version}/macos.tar.gz";
        sha256 = "0qjngyp4sma9rb8yc47ivng5dkvgq9rh7imgp480ysbzx4sj546p";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v{$version}/linux64.tar.gz";
        sha256 = "0g1gm2ykiixnf884k6xsgi0038lm0d6dr94k2ggxfmmiljdhj5cq";
      };
})
