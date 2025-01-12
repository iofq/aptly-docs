+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Copy'
+++
aptly repo copy
---------------

The `copy` command transfers packages from a source local repository (`src-name`) to a destination local repository (`dst-name`) based on a specified package query. If dependency following is enabled with `-with-deps`, Aptly will attempt to copy any missing dependencies from the source repository as well.

## Usage
```bash
$  aptly repo copy <src-name> <dst-name> <package-query> ...
```

| Command Params | Description |
|---|---|
| `src-name` | Source local repository where packages will be searched. |
| `dst-name` | Destination local repository where packages will be copied. |
| `package-query` | List of [package queries](/doc/feature/query/) to filter packages. |

| Command Flags | Description |
|---|---|
| `-dry-run` | Do not copy packages; instead, display a list of packages that would be copied. |
| `-with-deps` | Follow [dependencies](/doc/feature/dependencies) when processing the package query. |

When copying with dependencies, global dependency [options](/docs/configuration/options/) are respected. For
example, to copy source packages, use `-dep-follow-source`. If aptly can't guess the list of architectures for repository `dst-name`, due to missing metadata, architectures should be specified with `-architectures` flag.

## Examples
```bash
$ aptly repo copy testing stable percona-server-client-5.5
    Loading packages...
    [o] percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_i386 copied
    [o] percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_amd64 copied
```
