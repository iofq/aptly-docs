+++
date = '2025-01-11T14:18:59-06:00'
title = "Show Mirror"
+++

aptly mirror show
-----------------

Shows detailed information about mirror.

## Usage
```bash
$ aptly mirror show <name>
```

| Command Params | Description |
|---|---|
| `name` | Mirror name |

| Command Flag | Description |
|---|---|
| `-with-packages` | Show detailed list of packages and versions stored in the mirror. |

## Examples
```bash
$ aptly mirror show backports2
    Name: backports2
    Archive Root URL: http://mirror.yandex.ru/backports.org/
    Distribution: squeeze-backports
    Components: main, contrib, non-free
    Architectures: i386, amd64
    Last update: 2013-12-27 19:30:19 MSK
    Number of packages: 3898

    Information from release file:
    ...
```
