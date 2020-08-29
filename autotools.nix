pkgs: attrs:
  with pkgs;
  let defaultAttrs = rec {
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    buildInputs = [ gnutar gzip gnumake gcc binutils coreutils gawk gnused gnugrep ];
    gcc = if system == "x86_64-darwin" then clang else gcc;
    binutils = if system == "x86_64-darwin" then clang.bintools.bintools_bin else binutils-unwrapped;
    system = builtins.currentSystem;
  };
  in
  derivation (defaultAttrs // attrs)

