+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Rename'
+++

aptly repo rename
-----------------

The `rename` command renames a local repository. Each local repository must have a unique name.

## Usage
```bash
$ aptly repo rename <old-name> <new-name>
```

| Command Params | Description                       |
|----------------|-----------------------------------|
| `old-name`     | Current local repository name     |
| `new-name`     | New local repository name         |

## Examples
```bash
$ aptly repo rename whezy-main wheezy-main

    Local repository whezy-main -> wheezy-main has been successfully renamed.
```
