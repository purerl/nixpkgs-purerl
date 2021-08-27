{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.12";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "0744hv1xv5lpckpbhaagjf3s87ch08z6ygbifc91hs5j418k2kx0";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "1gb3lkikiv6kqf7s5kqxb2s1g0ax6jyh15mb5a4395bgzsf08rnb";
      };
})