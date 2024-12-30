#!/usr/bin/env zsh

setopt EXTENDED_GLOB

pushd "${ZDOTDIR}/.zprezto"
    for rcfile in "${ZDOTDIR}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR}/.${rcfile:t}"
    done
popd
