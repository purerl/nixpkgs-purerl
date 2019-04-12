with import <nixpkgs> {};

let
  specificErlang = callPackage ./erlang {};
  specificRebar3 = callPackage ./rebar3 { erlang = specificErlang; };
in
stdenv.mkDerivation {
  name = "example-build-shell";

  # The packages in the `buildInputs` list will be added to the PATH in our shell
  buildInputs = [
    specificErlang
    specificRebar3
  ];
}

