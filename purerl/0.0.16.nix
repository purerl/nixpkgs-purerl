{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.16";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "1b26xxk77smh7585ghi9a2m1w8bqpliv7gnn2pjdf04ms56a7lcy";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "155ih9i8g9w4bmx37mmadjd1z8jz7q824c0ri635rzqiy1qipclb";
      };
})
