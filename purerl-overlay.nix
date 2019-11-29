self: super:
{
  purerl = (super.purerl or {}) // {
    purerl-0-13-2 = super.callPackage ./purerl/0.13.2-erl1.nix {};
    purerl-0-13-5 = super.callPackage ./purerl/0.13.5-erl1.nix {};
  };
}


