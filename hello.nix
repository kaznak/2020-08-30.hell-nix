with (import <nixpkgs> {});
let drv = rec {
  name = "hello";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  buildInputs = [ gnutar gzip gnumake gcc binutils coreutils gawk gnused gnugrep ];
  gcc = clang;
  binutils = clang.bintools.bintools_bin;
  src = ./hello-2.10.tar.gz;
  system = builtins.currentSystem;
};
in derivation drv
