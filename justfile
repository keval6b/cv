role := "general"
location := "malaysia"

compile role=role location=location:
    ./compile.sh {{role}} {{location}}

compile-all:
    #!/usr/bin/env bash
    set -euo pipefail
    for role in general cloud ai; do
        for location in malaysia uk; do
            ./compile.sh "$role" "$location"
        done
    done

docker role=role location=location:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive ./compile.sh {{role}} {{location}}

docker-all:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive bash -lc 'for role in general cloud ai; do for location in malaysia uk; do ./compile.sh "$role" "$location"; done; done'

watch:
    watchexec --exts tex --debounce 5s --restart -- just docker-all
