+++
date = '2025-01-11T14:18:59-06:00'
title = "Search Mirror"
+++

aptly mirror search
-------------------

Search mirror for packages matching query.

## Usage
```bash
$ aptly mirror search <name> [<package-query>]
```

| Command Params | Description |
|---|---|
| `name` | Mirror name (given when mirror was created). |
| `package-query` | A [package query](/doc/feature/query/) to search for packages. If package query is omitted, all the packages are displayed. |

| Command Flag | Description |
|---|---|
| `-format=""` | [Custom format](/doc/feature/package-display/) for result printing. |
| `-with-deps` | Include [dependencies](/doc/feature/dependencies) of matching packages into search results. |

## Examples
```bash
$ aptly mirror search wheezy 'Name (% nginx*), $Architecture (i386), !Name (% *-dbg)'
    nginx-full_1.2.1-2.2+wheezy2_i386
    nginx-extras_1.2.1-2.2+wheezy2_i386
    nginx-light_1.2.1-2.2+wheezy2_i386
    nginx-common_1.2.1-2.2+wheezy2_all
    nginx-doc_1.2.1-2.2+wheezy2_all
    nginx-naxsi-ui_1.2.1-2.2+wheezy2_all
    nginx_1.2.1-2.2+wheezy2_all
    nginx-naxsi_1.2.1-2.2+wheezy2_i386
```
