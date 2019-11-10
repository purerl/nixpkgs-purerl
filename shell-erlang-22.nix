with import <nixpkgs> {
  overlays = [
    (import ./.)
  ];
};

stdenv.mkDerivation {
  name = "example-build-shell";
  buildInputs = [
    pkgs.devPackages.erlang-22-0-1.erlang
    pkgs.devPackages.erlang-22-0-1.rebar3-11
  ];
}

