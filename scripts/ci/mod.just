# Shows this help message
help:
    just --list ci

# Format all the code
fmt:
    cargo fmt --all
    just --fmt --unstable

# Check the format all the code
[group("check")]
fmt-check:
    cargo fmt --check --all
    just --fmt --check --unstable

# Run clippy for the workspace with all features and targets
[group("check")]
clippy:
    cargo clippy --locked --all-targets --all-features --workspace

# Run tests with each feature enabled at a time
[group("check")]
build-cross: (build-cross-target "aarch64-unknown-linux-gnu") (build-cross-target "aarch64-unknown-linux-musl")

# Run tests with each feature enabled at a time
[group("check")]
build-cross-target target:
    cargo build --workspace --all-features --target {{ target }}

# Generates the docs as docs.rs would do
[group("check")]
docs:
    cargo +nightly docs-rs --locked -p "$MAIN_CRATE"

# Check the minimal version of the dependencies for the library
[group("check")]
minimal-versions:
    cargo minimal-versions check --workspace --ignore-private --detach-path-deps=skip-exact --direct

# Check the MSRV to compile the main crate
[group("check")]
msrv:
    cargo "+$MSRV" hack --no-dev-deps check --all-features -p "$MAIN_CRATE"

# Check the semver compatibility
[group("check")]
semver-check:
    cargo semver-checks

# Run tests with all feature enabled
[group("test")]
test:
    cargo nextest --locked --workspace --all-features

# Run tests with all feature enabled
[group("test")]
test-release:
    cargo nextest --locked --workspace --all-features --release

# Run doc tests with all feature enabled
[group("test")]
test-doc:
    cargo test --locked --workspace --all-features --doc

# Run tests with each feature enabled at a time
[group("test")]
test-features:
    cargo hack --each-feature nextest run --locked --workspace

# Run tests with each feature enabled at a time
[group("test")]
test-coverage:
    ./scripts/ci/coverage.sh
