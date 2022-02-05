#!/usr/bin/env bash

export ITUNES_XML="/mnt/e/iTunes Library.xml"

music() {
    db=/mnt/c/Users/Spence/git/itunes-to-sqlite/tunes.db
    sqlite3 $db
}

