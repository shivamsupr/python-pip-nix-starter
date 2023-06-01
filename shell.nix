{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs { }
}:

with pkgs;
let
  inherit (lib) optional optionals;
  basePackages = [
    (import ./nix/default.nix { inherit pkgs; })
    pkgs.niv
  ];

  inputs = basePackages ++ lib.optionals stdenv.isLinux [ inotify-tools ]
    ++ lib.optionals stdenv.isDarwin
    (with darwin.apple_sdk.frameworks; [ CoreFoundation CoreServices ]);

  hooks = ''
    export LANG=C.UTF-8
    export PATH=$(pwd -P)/bin:$PATH
    export PATH=${pkgs.python3Packages.pip}/bin:$PATH
    export PATH=${pkgs.python3Packages.virtualenv}/bin:$PATH

    python3 -m venv .venv
    source .venv/bin/activate
  '';

in
mkShell {
  buildInputs = inputs;
  shellHook = hooks;

  LOCALE_ARCHIVE = if pkgs.stdenv.isLinux then "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
}