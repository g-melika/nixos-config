function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    cwd="$(cat "$tmp")"

    if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
        cd "$cwd"
    fi

    rm -f "$tmp"
}
