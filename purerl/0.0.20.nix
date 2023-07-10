{ pkgs, system ? pkgs.stdenv.hostPlatform.system }:

let
  version = "0.0.20";

  urls = {
    "x86_64-linux" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
      sha256 = "0h6nl82v9zj4g6h6ikmj9xkkr0i739l80pm5v0928qgs8ndc2dc1";
    };
    "x86_64-darwin" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
      sha256 = "128ly5wr64mxzzdlyniahkrardx7lv9sssdv8hdnz1vvqiqyj0y7";
    };
    "aarch64-linux" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/linux-aarch64.tar.gz";
      sha256 = "0d8xrxb1b0dvabl3ivq22an9r11i8mghj9hmhw8qd4s1qsyscjc2";
    };
    "aarch64-darwin" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/macos-arm64.tar.gz";
      sha256 = "0yla20vz1s51gc212cplywkh02bw2x7hxlwv4cldzba2qsgkcvdx";
    };
  };

  src =
    if builtins.hasAttr system urls then
      (pkgs.fetchurl urls.${system})
    else
      throw "Architecture not supported: ${system}";

in
import ./mkPurerlDerivation.nix {
  inherit pkgs version src;
}
