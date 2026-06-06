pkgs-json:
    #!/usr/bin/env bash

    # echos the package list as a json
    pkgs=()
    for f in $(find pkgs -mindepth 1 -maxdepth 1 -type d); do
        pkgs+=("$f")
    done

    jq -n '$ARGS.positional' -r -c -M --args "${pkgs[@]}"

build-pkg pkg *ARGS:
    #!/usr/bin/env bash
    set -xeo pipefail

    if [ -z "${MAKEFLAGS}" ]; then
        export MAKEFLAGS=j$(nproc)
    fi

    cd {{pkg}}
    makepkg --syncdeps --clean {{ARGS}}
