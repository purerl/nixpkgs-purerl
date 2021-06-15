{ pkgs }:

import ./mkPurerlDerivation.nix (rec {
  inherit pkgs;

  version = "0.0.4";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v{$version}/macos.tar.gz";
        sha256 = "11y4fyg1yc40wj26vgisabhv1ci7xdd24y4cpwgyd8qzw4pv46dk";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v{$version}/linux64.tar.gz";
        sha256 = "1yp51czxqk3bp8fslpns7haz45q3fz791hjfx9vl9amwp790zmfq";
      };
})

