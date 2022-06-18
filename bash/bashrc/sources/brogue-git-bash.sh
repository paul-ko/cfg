#!/user/bin/env bash
set -u

_brogue_dir=/c/games/BrogueCE-1.10-windows-x86_64/BrogueCE-windows
_brogue_executable=$_brogue_dir/brogue.exe
_brogue_max_seed=4294967295

print_brogue_seed_catalog() {
    max_depth=${1-""}
    min_seed=${2-""}
    seed_count=${3-""}
    if [[ -z "$seed_count" ]]; then
        printf "Must pass three args: <max depth> <min seed> <seed count>\n"
        return
    fi
    if [[ $max_depth -lt 1 || $min_seed -lt 1 || $seed_count -lt 1 ]]; then
        printf "All three args must be positive numbers!\n"
        return
    fi
    catalog_args="--print-seed-catalog $min_seed $seed_count $max_depth"
    out_file=$_brogue_dir/catalog-$min_seed-$seed_count-$max_depth.csv
    set -x
    $_brogue_executable --csv $catalog_args > $out_file
    set +x
}

alias seeds=print_brogue_seed_catalog
