#!/user/bin/env bash

ITUNES_XML=/e/iTunes\ Library.xml

load_music_db() {
    r itunes-to-s
    name=tunes.db
    if [ -f ./$name ]; then
        rm $name
    fi
    if [[ ! -z "$1" ]]; then
        time pipenv run load --from "$ITUNES_XML" --to $name --verbose
    else
        time pipenv run load --from "$ITUNES_XML" --to $name
    fi
}

alias load=load_music_db
alias test_tunes=load_music_db

