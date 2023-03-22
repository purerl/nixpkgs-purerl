{ pkgs, system ? pkgs.stdenv.hostPlatform.system }:

let
  version = "0.0.19";

  urls = {
    "x86_64-linux" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
      sha256 = "0lw1dgsdq5nbxwapq6y8fb7l2s9gp6429pyvbp24adcf4lniihjl";
    };
    "x86_64-darwin" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
      sha256 = "11ycay44lx0xyg2mmmbky1nvgan0yjqfklmpjkyn0qyh1qi80lwd";
    };
    "aarch64-linux" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/aarch64.tar.gz";
      sha256 = "0whmlhdg9yy33iby4g0ifg0km0g6iq4ds62a8sjf2df8dcxscqz1";
    };
    "aarch64-darwin" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/arm64.tar.gz";
      sha256 = "1difyf6wzdjm9hisc3kndpi7zyb1lavj0l6wyd82a05npvm16cvi";
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
