+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Drop'
+++
aptly repo drop
---------------

The `drop` command removes information about the local package repository but does not delete the package data itself, as it may still be used by other mirrors or snapshots. If a snapshot was created from the local repository, aptly will prevent its deletion unless the `-force` flag is used to override this restriction.

## Usage
```bash
$ aptly repo drop <name>
```

| Command Params | Description                  |
|-----------------|------------------------------|
| `name`          | Local repository name       |

| Command Flags | Description                                        |
|---------------|----------------------------------------------------|
| `-force`        | Drop the repository even if used as a snapshot source |

Dropping local repository only removes metadata; in order to cleanup the
disk space occupied by package files you might need to run
[`aptly db cleanup`](/docs/commands/db/cleanup/) command.

## Examples
```bash
$ aptly repo drop stable
    Local repo `stable` has been removed.
```
