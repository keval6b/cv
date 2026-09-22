compile:
    ./compile.sh

docker:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive ./compile.sh

watch:
    watchexec --exts tex --debounce 5s --restart -- just docker
