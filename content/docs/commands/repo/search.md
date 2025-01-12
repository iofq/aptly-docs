+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Search'
+++

aptly repo search
-----------------

Search local repositories for packages matching a [package query](/doc/feature/query/).

## Usage
```bash
$ aptly repo search <name> [<package-query>]
```

| Command Params   | Description                                       |
|------------------|---------------------------------------------------|
| `name`           | Repository name specified during creation         |
| `package-query`  | A [package query](/doc/feature/query/) to search for packages |

{{< callout type="info" >}}
If a package query is omitted, all the packages will be displayed.
{{< /callout >}}

| Command Flags   | Description                                                               |
|-----------------|---------------------------------------------------------------------------|
| `-format=""`    | [Custom format](/doc/feature/package-display/) for displaying results     |
| `-with-deps`    | Include [dependencies](/doc/feature/dependencies) of matching packages in the search results |


## Examples
```bash
$ aptly repo search internal-pkg 'Version (>= 4.5)'
    libtinfo5_5.9-10_i386
    perl-base_5.14.2-21+deb7u1_amd64
    ncurses-base_5.9-10_all
    xz-utils_5.1.1alpha+20120614-2_i386
    gcc-4.7-base_4.7.2-5_amd64
    libtinfo5_5.9-10_amd64
    base-files_7.1wheezy5_i386
    ncurses-bin_5.9-10_i386
    xz-utils_5.1.1alpha+20120614-2_amd64
    liblzma5_5.1.1alpha+20120614-2_i386
    coreutils_8.13-3.5_amd64
    liblzma5_5.1.1alpha+20120614-2_amd64
    libncurses5_5.9-10_amd64
    coreutils_8.13-3.5_i386
    libncurses5_5.9-10_i386
    perl-base_5.14.2-21+deb7u1_i386
    base-files_7.1wheezy5_amd64
    ncurses-bin_5.9-10_amd64
    gcc-4.7-base_4.7.2-5_i386
```
