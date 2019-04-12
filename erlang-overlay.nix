self: super:
{
  devPackages = (super.devPackages or {}) // {
    erlang-21-2-4 = {
      erlang = (super.erlangR21.override {
        version = "21.2.4";
        sha256 = "00cg8i2nqx6vad4k0024mg178kibgvn1hz9srj1b9vjbxg47xn6j";
      });

      rebar3-9 = super.callPackage ./rebar3 {
        erlang = self.devPackages.erlang-21-2-4.erlang;
      };
    };
  };
}

