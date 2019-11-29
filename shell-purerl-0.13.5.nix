with import <nixpkgs> {
  overlays = [
    (import ./.)
  ];
};

stdenv.mkDerivation {
  name = "example-build-shell";
  buildInputs = [
    pkgs.devPackages.purerl-0-13-5
    pkgs.psc-package
  ];
}

