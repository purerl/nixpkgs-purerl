{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; overlays = [ (import ./purerl-overlay.nix) ]; };
      in rec {
        packages = pkgs.purerl;
        devShells = {
          purerl-0-0-1 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-1 ]; };
          purerl-0-0-2 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-2 ]; };
          # 0-0-3 reported the wrong version and should not be used, 0-0-4 is functionally the same
          purerl-0-0-4 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-4 ]; };
          purerl-0-0-5 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-5 ]; };
          purerl-0-0-6 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-6 ]; };
          purerl-0-0-7 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-7 ]; };
          purerl-0-0-8 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-8 ]; };
          purerl-0-0-9 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-9 ]; };
          purerl-0-0-10 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-10 ]; };
          purerl-0-0-11 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-11 ]; };
          purerl-0-0-12 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-12 ]; };
          purerl-0-0-13 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-13 ]; };
          purerl-0-0-14 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-14 ]; };
          purerl-0-0-15 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-15 ]; };
          purerl-0-0-16 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-16 ]; };
          purerl-0-0-17 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-17 ]; };
          purerl-0-0-18 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-18 ]; };
          purerl-0-0-19 = pkgs.mkShell { buildInputs = [ packages.purerl-0-0-19 ]; };
        };
      });
}
