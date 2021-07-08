{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.11";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "1wl0gpvf0kwjq587q3n0wpla8lj4r6lb267zy9v4n569d793x8wj";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "16lnwsryy19fz8n5iqhv3amkxv4p1k942qidrb2763k4wcs65mla";
      };
})