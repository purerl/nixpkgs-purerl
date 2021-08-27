self: super:
{
  purerl = (super.purerl or {}) // {
    purerl-0-0-1 = super.callPackage ./purerl/0.0.1.nix {};
    purerl-0-0-2 = super.callPackage ./purerl/0.0.2.nix {};
    # 0.0.3 reported the wrong version and should not be used, 0.0.4 is functionally the same
    purerl-0-0-4 = super.callPackage ./purerl/0.0.4.nix {};
    purerl-0-0-5 = super.callPackage ./purerl/0.0.5.nix {};
    purerl-0-0-6 = super.callPackage ./purerl/0.0.6.nix {};
    purerl-0-0-7 = super.callPackage ./purerl/0.0.7.nix {};
    purerl-0-0-8 = super.callPackage ./purerl/0.0.8.nix {};
    purerl-0-0-9 = super.callPackage ./purerl/0.0.9.nix {};
    purerl-0-0-10 = super.callPackage ./purerl/0.0.10.nix {};
    purerl-0-0-11 = super.callPackage ./purerl/0.0.11.nix {};
    purerl-0-0-12 = super.callPackage ./purerl/0.0.12.nix {};
  };
}


