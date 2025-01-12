+++
date = '2025-01-11T14:18:59-06:00'
title = "Drop Mirror"
+++

aptly mirror drop
-----------------


The 'drop' command deletes information about a remote repository mirror. Package data itself is not deleted, as it may still be used by other mirrors or snapshots. If the mirror is currently used as a source for creating a snapshot, Aptly will refuse to delete it. Use the `-force` flag to override this safety check

## Usage
```bash
$ aptly mirror drop <name>
```

| Command Params | Description |
|---|---|
| `name` | Mirror name (from `aptly mirror list`) |

| Command Flags | Description |
|---|---|
| `-force` | Drop mirror even if it used as source of a snapshot |

Dropping mirror only removes metadata about the mirror; in order to
cleanup the disk space occupied by package files you will need to run the
[`aptly db cleanup`](/doc/commands/db/cleanup/) command.

## Examples
```bash
$ aptly mirror drop -force wheezy-main
    Mirror `wheezy-main` has been removed.
```
