{ pkgs }:

import ./mkPurerlDerivation.nix (rec {
  inherit pkgs;

  version = "0.0.5";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "13a5zdmdn0wrhb3ih8jy1c6d7kkh9vf986rgpj9l3dvnicnymcdv";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "0w9z20h31r8cb0kihwrl63szmd4x85yv9paw9bprz0wz5z1lg36k";
      };
})

