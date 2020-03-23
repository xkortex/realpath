#!/usr/bin/env bash

errcho() {
    (>&2 echo -e "\e[31m${1}\e[0m")
}

failout() {
  errcho "${@}"
  exit 1
}

FOO1=/tmp/foo/bar
mkdir -p $FOO1
touch $FOO1/spam

cd $FOO1

# mac is doing something weird with /private/tmp that I don't understand sooo I'm punting on this for now 
if [[ "/tmp/foo/bar/spam" != $(realpath spam) ]]; then
  realpath spam
  failout "Basic test failed"
fi

ln -s $FOO1/spam /tmp/spam

realpath /tmp/spam