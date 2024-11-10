# Python Development Template with Nix and Poetry

This project template provides a basic setup for developing Python applications using **Nix** and **Poetry**. The setup is designed to manage the Python runtime environment through Nix while using Poetry to manage application dependencies, making it both easy to maintain and highly reproducible.

## Overview

- **Nix**: Manages the Python runtime, ensuring a consistent and isolated environment.
- **Poetry**: Manages Python dependencies and application packaging, handling development and production dependencies separately.

This approach leverages Nix for environment consistency without full dependency control, leaving application dependencies to Poetry. It’s ideal for cases where you want to integrate Nix for runtime control without complex configuration.

## Prerequisites

- Nix (activate experimental flake feature.)

## Installation

To set up the development environment:

1. Activate the Nix environment:

   ```bash
    nix develop
   ```

   This command starts a Nix shell with the configured Python runtime and Poetry available.

2. Install dependencies:

   ```bash
   make initialize
   ```

   This command installs all Python dependencies listed in pyproject.toml.

## CI Integration

In CI, Nix can provide a consistent runtime for testing. You can configure GitHub Actions or other CI/CD tools to use Nix for runtime and Poetry for dependency management, ensuring reliable and reproducible tests.
