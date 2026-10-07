compile role:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive ./compile.sh {{role}}

compile-all:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive ./compile.sh --all

watch:
    watchexec --exts tex --debounce 5s --restart -- just compile-all
