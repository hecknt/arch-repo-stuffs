pkgs-json:
    #!/usr/bin/env bash

    # echos the package list as a json
    pkgs=()
    for f in $(find pkgs -mindepth 1 -maxdepth 1 -type d); do
        pkgs+=("$f")
    done

    jq -n '$ARGS.positional' -r -c -M --args "${pkgs[@]}"

build-pkg pkg:
    #!/usr/bin/env bash

    cd {{pkg}}
    makepkg -sc
