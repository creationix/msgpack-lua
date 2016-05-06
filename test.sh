#!/bin/bash
set -e
if [ -z "$LUA" ];
then
  echo "Installing deps"
  lit install luvit/pretty-print

  LUA=luvit-2 $0
  LUA=luajit-2.0 $0
  LUA=luajit-2.1 $0
  # LUA=lua-5.1 $0
  # LUA=lua-5.2 $0
  # LUA=lua-5.3 $0 # There is no bitop library for lua5.3
else
  echo "Testing on $LUA"
  source .travis/setenv.sh
  echo "Running tests with: $(which lua)"
  lua test.lua
fi
