role := "general"
location := "malaysia"

compile role=role location=location:
    ./compile.sh {{role}} {{location}}

compile-all:
    ./compile.sh --all

docker role=role location=location:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive ./compile.sh {{role}} {{location}}

docker-all:
    docker run --rm -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive ./compile.sh --all

watch:
    watchexec --exts tex --debounce 5s --restart -- just docker-all
