{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.13";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "0k52hqlpig3j0nls4ijadvj3s3lb7bf0q1k7lcizwvjd3y6k308c";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "024jy5fdj8i4c4kb2klkf2scvhmj99xpxfxcmbj7ar0nrsr2iz0c";
      };
})