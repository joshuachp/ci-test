# Repository tools and scripts

export MAIN_CRATE := "ci-lib"
export MSRV := `cargo metadata --format-version 1 --no-deps --locked | jq .packages.[0].rust_version --raw-output`

# Tools to run in CI
mod ci 'scripts/ci'

help:
    just --list
