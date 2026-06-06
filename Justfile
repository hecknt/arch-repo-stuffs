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
    set -uxeo pipefail

    cd {{pkg}}
    echo makepkg --syncdeps --clean {{ARGS}}
