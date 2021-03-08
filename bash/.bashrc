###########################
# exported core variables #
###########################

export EDITOR=code
export PYTHONPATH="$PYTHONPATH:."

###################
# local variables #
###################

git_dir=~/git

#############
# functions #
#############

function r() {
    if [[ $# -ne 1 ]]; then
        printf "Must supply exactly one argument!";
        return;
    fi

    # Check for exact match.
    if [ -d "$git_dir/$1" ]; then
        pushd "$git_dir/$1" >/dev/null
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
        pushd "$found" >/dev/null
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
            pushd "$found" >/dev/null
        fi
    fi
}

function is_available() {
    # exit code = 1 if $1 is not available
    # exit code = 0 otherwise
    if [[ $# -ne 1 ]]; then
        printf "Must supply exactly one argument!";
        return;
    fi
    type "$1" >/dev/null 2>&1
}

###########
# aliases #
###########

alias on_msys='test $(uname -o) == "Msys"';
if on_msys; then
    if is_available python; then
        alias python='winpty python.exe';
    fi
fi
if is_available npx; then
    alias npx='npx --no-install';
fi
