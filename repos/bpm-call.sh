#!/bin/bash
export target=$1
$(echo "export root=$(cat ~/.vls))
cd $root/repos/
./$1.vine