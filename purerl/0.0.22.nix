{ pkgs, system ? pkgs.stdenv.hostPlatform.system }:

let
  version = "0.0.22";

  urls = {
    "x86_64-linux" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/linux64.tar.gz";
      sha256 = "1jbpvqnrwns46s3kv0v9d0xxx8zbvhb0cphv5big8mqlk22qddcq";
    };
    "x86_64-darwin" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/macos.tar.gz";
      sha256 = "11740nja4b87f0yzdscnaxbsdjkdyq4d0b83294l6kl0psfa7vfx";
    };
    "aarch64-linux" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/linux-aarch64.tar.gz";
      sha256 = "1aycv23h51w3zkdgcb58f81swskbsqhj4nhjgk1wd6fr9hmai99h";
    };
    "aarch64-darwin" = {
      url = "https://github.com/purerl/purerl/releases/download/v${version}/macos-arm64.tar.gz";
      sha256 = "02vvmbhrnn9lxj277zlbjr893bf4rihw95s48hkwsrbc5sapx83s";
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
