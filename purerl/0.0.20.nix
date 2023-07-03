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
      url = "https://github.com/purerl/purerl/releases/download/v${version}/aarch64.tar.gz";
      sha256 = "05y2m05kp5r8b1k9075r21mqclihgrlikw94a08bc4i3qcgv1lx4";
    };
    "aarch64-darwin" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/arm64.tar.gz";
      sha256 = "1mrdlilzi665qbw994kbfgwyrbylhvxh8jmcldcrnb5s128cdb4d";
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
