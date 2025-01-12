+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Import'
+++
aptly repo import
-----------------

The `import` command copies packages matching the [package query](/doc/feature/query) from the mirror `src-mirror` to the local repository `dst-repo`. If [dependency following](/doc/feature/dependency) is enabled, aptly will also attempt to copy any missing dependencies from `src-mirror`.

## Usage
```bash
$  aptly repo import <src-mirror> <dst-repo> <package-query> ...
```

| Command Params   | Description                                               |
|------------------|-----------------------------------------------------------|
| `src-mirror`     | Mirror where packages will be searched                    |
| `dst-repo`       | Local repository where packages will be copied            |
| `package-query`  | List of [package queries](/doc/feature/query/)            |

| Command Flags   | Description                                                             |
|-----------------|-------------------------------------------------------------------------|
| `-dry-run`      | Show what would be imported without actually performing the import      |
| `-with-deps`    | Follow [dependencies](/doc/feature/dependencies) when processing `package-query` |

When copying with dependencies, global dependency options are applied. For instance, use `-dep-follow-source` to copy source packages. If aptly cannot determine the list of architectures from the contents of the local repository `dst-repo`, specify the architectures explicitly with the `-architectures` flag.

## Examples
```bash
$ aptly repo import percona testing percona-server-client-5.5
    Loading packages...
    [o] percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_i386 imported
    [o] percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_amd64 imported
```
