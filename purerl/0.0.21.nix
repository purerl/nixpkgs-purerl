{ pkgs, system ? pkgs.stdenv.hostPlatform.system }:

let
  version = "0.0.21";

  urls = {
    "x86_64-linux" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
      sha256 = "10f596hpn19q3viz2f2qbaayp4bzawl8knvx3k3h9kqqn44yl5ac";
    };
    "x86_64-darwin" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
      sha256 = "1za2ikfp59iddg4mx79aj2bd4d01wsg7r5bhqxnjcnpc5ylva73c";
    };
    # "aarch64-linux" = {
    #   url = "https://github.com/purerl/purerl/releases/download/v${version}/linux-aarch64.tar.gz";
    #   sha256 = "";
    # };
    # "aarch64-darwin" = {
    #   url = "https://github.com/purerl/purerl/releases/download/v${version}/macos-arm64.tar.gz";
    #   sha256 = "";
    # };
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
