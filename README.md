# Nix overlays for purerl

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
