{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.18";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "0xa1y534g7364n05ix6ni2n67hhr2vh2nps55d2x6lwjn53i1lfx";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "1kglcqcl6s9dnli9m3m88q7hwwzsccipfcna1f2in9crnm9x4jw2";
      };
})
