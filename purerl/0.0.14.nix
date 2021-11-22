{ pkgs }:

import ./mkPurerlDerivation.nix ( rec{
  inherit pkgs;

  version = "0.0.14";

  src =
    if pkgs.stdenv.isDarwin then
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
        sha256 = "1nz1kpvrbvwgvd6yazdl6s4vq8ls0di7p368ywn5fslqh0lwmfmp";
      }
    else
      pkgs.fetchurl {
        url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
        sha256 = "01h83f9d4nqi5pwsri3kkk4l97sp4myi920ibdpr4chl1f877nwh";
      };
})