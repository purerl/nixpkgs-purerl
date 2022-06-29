{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.17";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "0mxhc4bg4pqzi342wf46lrmi9cff0psz7j1yxy8lm076p94l04wq";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "0mpq5110385icswv78kr1z377381ad50mybjqm1q78ysdm76j2ks";
      };
})
