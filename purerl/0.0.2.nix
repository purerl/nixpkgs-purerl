{ pkgs }:

import ./mkPurerlDerivation.nix (rec {
  inherit pkgs;

  version = "0.0.2";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "1dmqp3x0rikzsay5x45hlbchgjvkrly3n7mnflq9bdy439022k30";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "13srp8bwkcamrlb87axl642mwy8bf1qy2q089vdghnr1yl9l0vqs";
      };
})
