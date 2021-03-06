#!/bin/bash

set -e

if [ "$OS" = "Windows_NT" ]; then
    .paket/paket.exe update -g wsbuild
else
    mono .paket/paket.exe update -g wsbuild
fi

export DOTNETSOLUTION=WebSharper.sln
exec paket-files/wsbuild/github.com/dotnet-websharper/build-script/WebSharper.Fake.sh "$@"

