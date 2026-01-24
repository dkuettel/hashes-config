#!/usr/bin/env zsh
set -eu -o pipefail

h=${0:a:h:h}

(
    cd $h/dep
    echo data >> data
    git commit -m data -- data
    git push
    # nix build
    nix flake metadata --quiet --json
    # nix flake archive
    # nix flake check
    # nix flake show
    # nix flake lock
)

(
    cd $h/main
    nix flake update dep
    git commit -m lock -- flake.lock
    git push
)
