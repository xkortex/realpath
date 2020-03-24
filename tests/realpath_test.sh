#!/usr/bin/env bash
# This should generally be run from a container or isolated environment for safety

shopt -s expand_aliases

errcho() {
    (>&2 echo -e "\e[31m${1}\e[0m")
}

failout() {
  errcho "${@}"
  exit 1
}

REPO_DIR=${REPO_DIR:-github.com/xkortex/realpath}
A_REPO_DIR="$GOPATH/src/$REPO_DIR"
alias rp="${A_REPO_DIR}/build/realpath"

# make sure alias actually works
rp .

FOO1=/tmp/foo/bar
mkdir -p $FOO1
touch $FOO1/spam

cd $FOO1

# mac is doing something weird with /private/tmp that I don't understand sooo I'm punting on this for now 
if [[ "/tmp/foo/bar/spam" != $(rp spam) ]]; then
  realpath spam
  failout "Basic test failed"
fi

ln -svf $FOO1/spam /tmp/spam

realpath /tmp/spam

#/usr/local/go/bin/go
if [[ "/usr/local/go/bin" != $(rp `which go`/..) ]]; then
  failout "concat ../ test failed: $(rp `which go`/..)"
fi


# todo: realpath ~/this_does_not_exist (success) realpath ~/this/does_not_exist (fails) 
# todo: flag to generate what path WOULD be (that may be hard)
# todo: trap and cleanup 

