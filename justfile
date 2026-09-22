compile:
    make docker

watch:
    watchexec --exts tex --debounce 5s -- just compile
