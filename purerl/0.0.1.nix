{ pkgs }:

import ./mkPurerlDerivation.nix {
  inherit pkgs;

  version = "v0.0.1";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v0.0.1/macos.tar.gz";
        sha256 = "0vfsp4b23id2hl5b9gf4466znqxn403mq77ck5yy3fl08z17b2ki";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v0.0.1/linux64.tar.gz";
        sha256 = "1wf55rrzi79ljw0pm8v2jspcq4a6bccrabql7l09bjhdv32xzhbh";
      };
}

