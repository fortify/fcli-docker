# fcli-docker — Copilot Instructions

Docker image definitions for fcli. Two variants: `fcli-scratch` (minimal, no shell) and `fcli-ubi9` (Red Hat UBI 9, shell-based).

## Structure

- `linux/` — Linux Dockerfiles and build scripts
- `windows/` — Windows Dockerfiles and build scripts
- `.github/workflows/` — CI/CD for building and publishing images to Docker Hub (`fortifydocker/fcli`)

## Key Rules

- Images must stay minimal; do not add unnecessary packages
- The scratch image has no shell — only direct fcli entrypoint
- Test both variants when changing shared build logic
