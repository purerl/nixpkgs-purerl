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

    erlang-22-0-1 = {
      erlang = (super.erlangR21.override {
        version = "22.0.1";
        sha256 = "09da7z44zk0nknzrb03mzfmzhczl5a4awf20bzrhgf7z169n40vi";

        prePatch = ''
              substituteInPlace make/configure.in --replace '`sw_vers -productVersion`' '10.10'
        '';
      }).overrideAttrs(prevAttrs: rec {
        # Force autoreconf to run on the make subdir
        autoreconfFlags = "make";
      });

      rebar3-9 = super.callPackage ./rebar3 {
        erlang = self.devPackages.erlang-22-0-1.erlang;
      };
    };

  };
}

