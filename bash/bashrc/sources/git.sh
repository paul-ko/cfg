# shellcheck shell=bash

###################
# local variables #
###################

git_dir=~/git

#############
# functions #
#############

r() {
    if [[ $# -ne 1 ]]; then
        printf "Must supply exactly one argument!";
        return;
    fi

    # Check for exact match.
    if [ -d "$git_dir/$1" ]; then
        pushd "$git_dir/$1" >/dev/null || return
        return
    fi

    # Check for starts with.
    found="";
    while read -rd ""; do
        if [[ $found == "" ]]; then
            found="$REPLY";
        else
            found='\0';
        fi;
    done < <(find "$git_dir" -maxdepth 1 -type d -name "$1*" -print0);
    if [[ $found == '\0' ]]; then
        echo "Found multiple starts!"
    elif [[ $found != "" ]]; then
        pushd "$found" >/dev/null || return
    else

        # If there were no startswith, checks for contains.
        while read -rd ""; do
            if [[ $found == "" ]]; then
                found="$REPLY";
            else
                found='\0';
            fi;
        done < <(find "$git_dir" -maxdepth 1 -type d -name "*$1*" -print0);
        if [[ "$found" == "" ]]; then
            echo "Found no starts or contains!";
        elif [[ "$found" == '\0' ]]; then
            echo "Found multiple contains!";
         else
            pushd "$found" >/dev/null || return
        fi
    fi
}
