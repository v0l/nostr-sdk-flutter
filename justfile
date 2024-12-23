set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

[private]
default:
    @just --list

precommit:
    @bash contrib/scripts/precommit.sh

check:
    @bash contrib/scripts/check.sh

clean:
    flutter clean
    cd example && flutter clean
    cd rust && cargo clean

example:
    cd example && flutter run
