#!/usr/bin/env bash

set -euxo pipefail

for dir in "baseset" "content_download/newgrf"; do
    for f in "${dir}"/*.xz; do
        output_dir=$(dirname $f)
        filename=$(basename "$f" .xz)
        xz -cdv "${f}" > "${output_dir}/${filename}"
    done
done

~/openttd-prometheus/bin/openttd -D -c openttd.cfg
