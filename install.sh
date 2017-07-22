#!/bin/bash
path=$(cd $(dirname $0);pwd)
\ls -1a | egrep -v "^\.+$" | egrep -v "install\.sh" | xargs -I% ln -sf "${path}/%" ~/%
