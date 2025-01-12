+++
date = '2025-01-11T14:18:59-06:00'
title = "List Mirror"
+++

aptly mirror list
-----------------

Shows list of created remote repository mirrors.

## Usage
```bash
$ aptly mirror list
```

| Command Flags | Description |
|---|---|
| `-raw` | Display list in machine-readable format. |

## Examples
```bash
$ aptly mirror list
    List of mirrors:
     * [backports]: http://mirror.yandex.ru/backports.org/ squeeze-backports
     * [debian-main]: http://ftp.ru.debian.org/debian/ squeeze

```
To get more information about repository, run `aptly mirror show <name>`.

```bash
$ aptly mirror list -raw
    backports
    debian-main
```
