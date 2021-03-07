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
    target="${git_dir}/$1"
    if [[ ! -d "$target" ]]; then
        printf "No repo exists at %s" "$target";
    else
        pushd "$target" >/dev/null;
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
