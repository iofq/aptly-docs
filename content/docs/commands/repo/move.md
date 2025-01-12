+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Move'
+++

aptly repo move
---------------

The `move` command transfers packages matching the [package query](/doc/feature/query) from the local repository `src-repo` to `dst-repo`. If dependency following is enabled, aptly will attempt to move dependencies from `src-repo` as well.

## Usage
```bash
$  aptly repo move <src-name> <dst-name> <package-query> ...
```

| Command Params   | Description                                               |
|------------------|-----------------------------------------------------------|
| `src-name`       | Local repository where packages will be searched          |
| `dst-name`       | Local repository where packages will be moved             |
| `package-query`  | List of [package queries](/doc/feature/query/)            |

| Command Flags   | Description                                                             |
|-----------------|-------------------------------------------------------------------------|
| `-dry-run`      | Show what would be moved without actually performing the move          |
| `-with-deps`    | Follow [dependencies](/doc/feature/dependencies) when processing the package query |

{{< callout type="info" >}}
When moving packages with dependencies, global dependency options are applied. For example, use `-dep-follow-source` to move source packages.
{{< /callout >}}
{{< callout type="info" >}}
If aptly cannot determine the list of architectures from the contents of the local repository `dst-name`, you should specify the architectures explicitly using the `-architectures` flag.
{{< /callout >}}
## Examples
```bash
$ aptly repo move stable testing percona-server-client-5.5
    Loading packages...
    [o] percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_i386 moved
    [o] percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_amd64 moved
```
