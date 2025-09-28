{ pkgs ? import <nixpkgs> {} }:

let
  rust-overlay = import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz");
  nixpkgs = import <nixpkgs> { overlays = [ rust-overlay ]; config = { allowUnfree = true; }; };
  rust-toolchain = nixpkgs.rust-bin.stable.latest.default.override {
    extensions = [ "rust-src" ];
  };
in
nixpkgs.mkShell {
  buildInputs = with nixpkgs; [
    # Base dependencies from apt
    curl
    cacert
    gnupg
    lsb-release
    unzip

    # Docker tools
    docker
    docker-compose

    # Language runtimes & package managers
    bun
    go
    rust-toolchain
    nodejs # Includes npm
    python3

    # DevOps Tools
    ansible
    ansible-lint
    terraform
    kubectl
    gh
    act
    uv
  ];

  shellHook = ''
    echo "Nix shell for code-server development is ready."
    echo "Note: Docker requires the Docker daemon to be running on your host."
  '';
}