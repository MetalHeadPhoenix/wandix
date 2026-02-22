# wandix

wandix is a tiny CLI helper that installs a shell function and provides simple project templates (docker, python, bash, go) under a user's home `playground` directory.

## Features

- Install a reusable shell loader (`wandix.sh`) into the user shell.
- Create simple project skeletons from templates.
- A small helper `bu` for timestamped backups.

## Files in this repository

- [src/DEBIAN/control](src/DEBIAN/control) — package metadata
- [src/usr/bin/wandix-init](src/usr/bin/wandix-init) — per-user initialization script
- [src/usr/share/wandix/wandix.sh](src/usr/share/wandix/wandix.sh) — shell functions
- [src/usr/share/wandix/templates](src/usr/share/wandix/templates) — project templates


## Per-user setup

After the package is installed system-wide, each user should run the init script once to add the loader to their shell and create the playground folder:

```bash
wandix-init
# or full path: /usr/bin/wandix-init
```

Then restart your shell or run:

```bash
source "$HOME/.bashrc"
```

## Usage

Create a new project from a template:

```bash
wandix create python myproj
wandix create docker myapp
wandix create bash scriptname
```

The new project folders are created under `$HOME/playground` with simple starter files (e.g., `main.py` for python projects).

Use the backup helper:

```bash
bu somefile.txt
```

## Templates

Edit or extend templates in `/usr/share/wandix/templates` (packaged path). Add more complete Dockerfiles or compose files as needed. When updating templates in the repo, rebuild the package to distribute changes.


