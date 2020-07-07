{ pkgs }:

import ./mkPurerlDerivation.nix {
  inherit pkgs;

  version = "v0.0.6";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v0.0.6/macos.tar.gz";
        sha256 = "1avrsywg8zimvzsvab6vq3jkznj731b84pmw8nnpqdmakcwnyq4c";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v0.0.6/linux64.tar.gz";
        sha256 = "0zv3vy91v5vwwdsmgncrlfzg788c5ppdmnvw1dm88n8lg5i7maf4";
      };
}

