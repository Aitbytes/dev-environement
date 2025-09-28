# Development Environment

This repository contains a `shell.nix` file that defines a reproducible development environment using [Nix](https://nixos.org/).

## Prerequisites

- [Nix](https://nixos.org/download.html) installed on your system.

## Usage

To enter the development environment, navigate to the root of this repository and run the following command:

```bash
nix-shell
```

This will download and install all the dependencies defined in `shell.nix` and drop you into a shell with all the tools available.

## Included Tools

The `shell.nix` file includes the following tools:

- **Base dependencies**: `curl`, `cacert`, `gnupg`, `lsb-release`, `unzip`
- **Docker tools**: `docker`, `docker-compose`
- **Language runtimes & package managers**: `bun`, `go`, `rust`, `nodejs`, `python3`
- **DevOps Tools**: `ansible`, `ansible-lint`, `terraform`, `kubectl`, `gh`, `act`, `uv`

## GitHub Actions

This repository is configured with a GitHub Actions workflow that tests the `shell.nix` file on every push and pull request to the `main` branch. The workflow ensures that the Nix shell can be built successfully.
