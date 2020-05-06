#! /usr/bin/env bash
# Copyright (C) 2020 Sebastian Pipping <sebastian@pipping.org>
# Licensed under the MIT license

PS4='# '

set -e
cd "$(dirname "$0")"

animate() {
    local family="$1"
    shift

    for i in ${family}-{checked,unchecked,indeterminate}.png; do
        ( set -x; convert "${i}" "${i}".gif )
    done

    local args=(
        --delay=80
        --loop
        "$@"
        ${family}-{unchecked,checked,indeterminate}.png.gif
    )
    ( set -x ; gifsicle "${args[@]}" > ${family}-animated.gif )

    ( set -x ; rm ${family}-*.png.gif )
}

animate chromium-linux
animate firefox-linux-adapta --colors 256
