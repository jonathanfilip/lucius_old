#!/usr/bin/env bash

function gmake() {
    if [[ -z $MAKEINCDIR ]]; then
        MAKEINCDIR=/cigdev/build/2.0.10.6/make
        read -p "MAKEINCDIR ($MAKEINCDIR): " arg
        if [[ -n "$arg" ]]; then
            MAKEINCDIR=$arg
        fi
        export MAKEINCDIR
    fi

    if [[ -z $MAKETARGET ]]; then
        MAKETARGET=lxa64g4
        read -p "MAKETARGET ($MAKETARGET): " arg
        if [[ -n "$arg" ]]; then
            MAKETARGET=$arg
        fi
        export MAKETARGET
    fi

    for word in $@; do
        if [[ "$word" == "install" ]]; then
            read -p "INSTALLROOT ($PWD): " arg

            if [[ -n "$arg" ]]; then
                export INSTALLROOT=$arg
            else
                export INSTALLROOT=$PWD
            fi
        fi
    done

    gnumake -R $@
}

