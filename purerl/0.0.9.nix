{ pkgs }:

import ./mkPurerlDerivation.nix {
  inherit pkgs;

  version = "v0.0.9";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v0.0.9/macos.tar.gz";
        sha256 = "1cp1b7f42r6vzzlslmsdda95ijs9c710q9wqvjijwb13hddi93bg";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v0.0.9/linux64.tar.gz";
        sha256 = "1rns4jgglz77kka8vhv1njqhs07vllzn7g8hk257pqqq1bj17mpf";
      };
}
