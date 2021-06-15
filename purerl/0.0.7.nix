{ pkgs }:

import ./mkPurerlDerivation.nix (rec {
  inherit pkgs;

  version = "0.0.7";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "0jscimq7nksdbj5bnnhjkl265wwb2nzxsjz2gbvyn53141bljhda";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "1nl9gnvk9sacpcs51m8w97nm5sw1n00rr3fyzqp3dbw1056ing4s";
      };
})
