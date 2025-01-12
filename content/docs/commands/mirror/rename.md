+++
date = '2025-01-11T14:18:59-06:00'
title = "Rename Mirror"
+++

aptly mirror rename
-------------------

Command changes name of the mirror. Mirror name should be unique.

## Usage
```bash
$ aptly mirror rename <old-name> <new-name>
```

| Command Params | Description |
|---|---|
| `old-name` | Current mirror name. |
| `new-name` | New mirror name. |

## Examples

```bash
$ aptly mirror rename whezy-main wheezy-main
    Mirror whezy-main -> wheezy-main has been successfully renamed.
```
