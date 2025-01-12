+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Remove'
+++

aptly repo remove
-----------------

The `remove` command deletes packages matching the [package query](/doc/feature/query/)
from the local repo `name`.

## Usage
```bash
$  aptly repo remove <name> <package-query> ...
```

| Command Params   | Description                                               |
|------------------|-----------------------------------------------------------|
| `name`           | Local repository from which packages will be removed      |
| `package-query`  | List of [package queries](/doc/feature/query/)            |

| Command Flags | Description                               |
|---------------|-------------------------------------------|
| `-dry-run`    | Show what would be removed without actually performing the removal |

When packages are removed from a local repository, only their references are deleted. Packages included in any snapshot remain unaffected. If no references to the packages exist, their files and metadata can be cleaned up using the [`aptly db cleanup`](/doc/aptly/db/cleanup/). command.

## Examples
```bash
$ aptly repo remove stable percona-server-client-5.5
    Loading packages...
    [-] percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_i386 removed
    [-] percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_amd64 removed
```
