#!/usr/bin/env bash
# Generate a Windows .ico and/or a macOS .icns file from a source PNG or SVG.
#
# Usage: make-icons.sh <file.png|file.svg> [--ico] [--icns]
#   If neither --ico nor --icns is given, both are generated.
set -euo pipefail

ICO_SIZES=(16 32 48 64 128 256)
ICNS_SIZES=(16 32 64 128 256 512)

usage() {
    echo "Usage: $(basename "$0") <file.png|file.svg> [--ico] [--icns]" >&2
    exit 1
}

source=""
want_ico=0
want_icns=0

for arg in "$@"; do
    case "$arg" in
        --ico) want_ico=1 ;;
        --icns) want_icns=1 ;;
        -h|--help) usage ;;
        *)
            if [ -n "$source" ]; then
                usage
            fi
            source="$arg"
            ;;
    esac
done

[ -n "$source" ] || usage
[ -f "$source" ] || { echo "error: $source: no such file" >&2; exit 1; }
source="$(realpath -- "$source")"

if [ "$want_ico" -eq 0 ] && [ "$want_icns" -eq 0 ]; then
    want_ico=1
    want_icns=1
fi

case "$source" in
    *.png) source_format=png ;;
    *.svg) source_format=svg ;;
    *) echo "error: $source: unsupported extension (expected .png or .svg)" >&2; exit 1 ;;
esac

for cmd in convert python3; do
    command -v "$cmd" >/dev/null 2>&1 || { echo "error: required command not found: $cmd" >&2; exit 1; }
done
if [ "$source_format" = svg ]; then
    command -v inkscape >/dev/null 2>&1 || { echo "error: required command not found: inkscape" >&2; exit 1; }
fi

base="${source%.*}"
base="${base%-full}"
if [[ "$base" =~ ^(.*)-[0-9]+x[0-9]+$ ]]; then
    base="${BASH_REMATCH[1]}"
fi
# Kept next to the source file rather than under /tmp: a sandboxed Inkscape
# (e.g. the Flatpak build) can only read/write within its allowed filesystem,
# which does not include /tmp.
workdir="$(mktemp -d "$(dirname "$source")/.make-icons.XXXXXX")"
trap 'rm -rf "$workdir"' EXIT

# Collect every size needed by the requested outputs, deduplicated.
declare -A needed_sizes=()
if [ "$want_ico" -eq 1 ]; then
    for s in "${ICO_SIZES[@]}"; do needed_sizes[$s]=1; done
fi
if [ "$want_icns" -eq 1 ]; then
    for s in "${ICNS_SIZES[@]}"; do needed_sizes[$s]=1; done
fi

for size in "${!needed_sizes[@]}"; do
    png="$workdir/icon-${size}.png"
    if [ "$source_format" = svg ]; then
        inkscape "$source" --export-type=png --export-filename="$png" -w "$size" -h "$size" >/dev/null
    else
        convert "$source" -resize "${size}x${size}" -background none -gravity center -extent "${size}x${size}" "$png"
    fi
done

if [ "$want_ico" -eq 1 ]; then
    ico_inputs=()
    for s in "${ICO_SIZES[@]}"; do ico_inputs+=("$workdir/icon-${s}.png"); done
    convert "${ico_inputs[@]}" "${base}.ico"
    echo "Created ${base}.ico"
fi

if [ "$want_icns" -eq 1 ]; then
    largest="${ICNS_SIZES[-1]}"
    size_args=()
    for s in "${ICNS_SIZES[@]}"; do size_args+=("${s}x${s}"); done
    python3 -c "
import sys
from PIL import Image

base_img = Image.open(sys.argv[1])
sizes = [tuple(map(int, s.split('x'))) for s in sys.argv[2:-1]]
base_img.save(sys.argv[-1], sizes=sizes)
" "$workdir/icon-${largest}.png" "${size_args[@]}" "${base}.icns"
    echo "Created ${base}.icns"
fi
