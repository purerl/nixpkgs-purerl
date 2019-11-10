# Nixpkgs overlay which aggregates overlays, stolen from Mozilla
self: super:

with super.lib;

let
  overlays =
    [
      ./erlang-overlay.nix
      ./purerl-overlay.nix
    ];
in
  (foldl' (flip extends) (_: super) (map import overlays)) self

