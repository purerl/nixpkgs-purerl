self: super:
{
  purerl = (super.purerl or {}) // {
    purerl-0-0-1 = super.callPackage ./purerl/0.0.1.nix {};
  };
}


