with import <nixpkgs> {
  overlays = [
    (import ./.)
  ];
};

stdenv.mkDerivation {
  name = "example-build-shell";
  buildInputs = [
    pkgs.devPackages.erlang-21-2-4.erlang
    pkgs.devPackages.erlang-21-2-4.rebar3-11
  ];
}

