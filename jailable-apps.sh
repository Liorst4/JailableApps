#!/bin/sh

for i in $(basename -s .profile /etc/firejail/*.profile); do
    C=$(command -v "$i" 2>/dev/null)
    if [ -n "$C" ]; then
        printf "%s is " "$i"
        L=$(readlink "$C" 2>/dev/null)
        if [ -n "$L" ] && [ "/usr/bin/firejail" = "$L" ]; then
            echo "jailed"
        else
            echo "not jailed"
        fi
    fi
done;
