role := "general"

compile role=role:
    ./compile.sh {{role}}

compile-all:
    ./compile.sh --all

docker role=role:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive ./compile.sh {{role}}

docker-all:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive ./compile.sh --all

watch:
    watchexec --exts tex --debounce 5s --restart -- just docker-all
