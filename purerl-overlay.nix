self: super:
{
  purerl = (super.purerl or {}) // {
    purerl-0-0-1 = super.callPackage ./purerl/0.0.1.nix {};
    purerl-0-0-2 = super.callPackage ./purerl/0.0.2.nix {};
    # 0.0.3 reported the wrong version and should not be used, 0.0.4 is functionally the same
    purerl-0-0-4 = super.callPackage ./purerl/0.0.4.nix {};
    purerl-0-0-5 = super.callPackage ./purerl/0.0.5.nix {};
  };
}


