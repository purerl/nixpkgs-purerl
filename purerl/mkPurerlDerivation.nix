{ pkgs, version, src }:

let
  _version = version;

  _src = src;

  dynamic-linker = pkgs.stdenv.cc.bintools.dynamicLinker;

  patchelf = libPath: if pkgs.stdenv.isDarwin
    then ""
    else ''
          chmod u+w $PURERL
          patchelf --interpreter ${dynamic-linker} --set-rpath ${libPath} $PURERL
          chmod u-w $PURERL
        '';

in pkgs.stdenv.mkDerivation rec {
  name = "purescript";

  version = _version;

  src = _src;

  buildInputs = [ pkgs.zlib pkgs.gmp pkgs.ncurses5 ];

  libPath = pkgs.lib.makeLibraryPath buildInputs;

  dontStrip = true;

  installPhase = ''
    mkdir -p $out/bin
    PURERL="$out/bin/purerl"
    install -D -m555 -T purerl $PURERL
    ${patchelf libPath}
    mkdir -p $out/etc/bash_completion.d/
    $PURERL --bash-completion-script $PURERL > $out/etc/bash_completion.d/purerl-completion.bash
  '';
}
