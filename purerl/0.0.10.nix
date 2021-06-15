{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.10";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "1qjshxyyjkz582la4mnvlgsj2x9isn6znsin521i1zfaknrjkyn8";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "02milnbygmpfpiwcwiawlgvmwydqf5why4bvsm6sn4nhm9ks2wn9";
      };
})