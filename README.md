# Nix overlays for [purerl](https://github.com/purerl/purerl)

To add the overlays to your nixpkgs, add `default.nix` to the overlay path like:

```console
$ ln -s $(pwd)/default.nix $HOME/.config/nixpkgs/overlays/purerl.nix
```

And to install a purerl package, run:

```console
$ nix-env -iA nixpkgs.purerl.purerl-0-0-7
```

Then `purerl` command should be ready as:

```console
$ purerl --version
0.0.7
```

### Use via flakes

To run directly from github:

```console
$ nix run github:purerl/nixpkgs-purerl#purerl-0-0-19 -- --version
0.0.19
```

Or to enter a shell:

```console
$ nix develop github:purerl/nixpkgs-purerl#purerl-0-0-19
$ purerl --version
0.0.19
```

Or to use as an input to another flake:

```nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    nixpkgs-purerl.url = "github:purerl/nixpkgs-purerl";
    nixpkgs-purerl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-purerl,
  }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
        purerl = nixpkgs-purerl.packages.x86_64-linux.purerl-0-0-19;
    in rec {
      devShells.x86_64-linux.purerl = pkgs.mkShell {
        buildInputs = [ purerl ];
      };
    };
}
```
```console
$ nix develop .#purerl
$ purerl --version
0.0.19
```
