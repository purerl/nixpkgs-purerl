with import <nixpkgs> {
  overlays = [
    (import ./.)
  ];
};

stdenv.mkDerivation {
  name = "example-build-shell";
  buildInputs = [
    pkgs.purerl.purerl-0-0-13
    pkgs.purescript
  ];
}

