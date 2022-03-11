{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.15";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}}/macos.tar.gz";
        sha256 = "0xa2wj9ayg8n2c1i8059r60byryz4j8sjj2aw1x5akb33wdd78i9";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}}/linux64.tar.gz";
        sha256 = "1pzhbjzxpmcbrqk2ffrd04sglsxzyqfh7ij2k5qlf7sh1ckh2bq2";
      };
})
