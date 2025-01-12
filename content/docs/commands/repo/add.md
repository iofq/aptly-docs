+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Add'
+++

aptly repo add
--------------

Add a local repository to aptly, consisting of one or more packages.

When importing from a directory, Aptly performs a recursive scan to locate all files matching the patterns `*.[u]deb` and `*.dsc`. Each discovered file is analyzed to extract its metadata, and a corresponding package entry is created and added to the database. The files themselves are then imported into the internal package pool. For source packages, all required files are automatically added as well. These extra files must be located within the same directory as the `.dsc` file.

## Usage
```bash
$  aptly repo add <name> <package file>|<directory> ...
```

| Command Params | Description |
|---|---|
| `name` | Local repository name |

| Command Flags | Description |
|---|---|
| `-force-replace` | When adding a package that conflicts with an existing package, remove the existing package. |
| `-remove-files` | Remove files that have been successfully imported into the repository. |

Aptly does not report an error if a duplicate package is added to a repository. However, it is prohibited to have two packages within the same repository with identical triples (architecture, name, version) but differing metadata or files. Refer to the Duplicate packages [documentation](/docs/features/duplicate) for more details. To replace an existing package with a conflicting one, use the `-force-replace` flag.

All files added to the package pool are deduplicated, similar to the handling of files from mirrors, ensuring that only a single copy of each file is stored within the Aptly pool.

The `-remove-files` flag enables the implementation of an "incoming/" directory concept, where packages are removed immediately after they are imported into the database.

## Examples

```bash
$ aptly repo add testing files/libboost-program-options-dev_1.49.0.1_i386.deb
    Loading packages...
    [+] libboost-program-options-dev_1.49.0.1_i386 added
```
