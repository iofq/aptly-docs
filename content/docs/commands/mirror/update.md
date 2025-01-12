+++
date = '2025-01-11T14:18:59-06:00'
title = "Update Mirror"
+++

aptly mirror update
-------------------

The `update` command synchronizes a remote mirror with the latest repository updates by downloading package files and metadata. It is essential to run this command initially after creating a mirror to populate it with the necessary content. Subsequent updates can be performed to keep the mirror in sync with the repository. The update process can be safely resumed if interrupted.

All packages would be stored under aptly's root dir (see section on
[Configuration](/docs/configuration/)).

## Usage
```bash
$ aptly mirror update <name>
```

| Command Params | Description |
|---|---|
| `name` | Mirror name |

| Command Flags | Description |
|---|---|
| `-force` | Force mirror update even if a previous update attempt may have been incorrectly recorded in the database (e.g., due to a crash) or locked by another process. |
| `-download-limit=0` | Limit download speed (kbytes/sec). |
| `-ignore-checksums` | Ignore checksum mismatches for downloaded items (package files, metadata). |
| `-ignore-signatures` | Disable verification of `Release` file signatures. |
| `-keyring=file.gpg` | GPG keyring to use when verifying the `Release` file (can be specified multiple times). |
| `-max-tries=1` | Max download tries till the process fails with a download error. |
| `-skip-existing-packages` | Do not check file existence for packages listed in the internal database of the mirror. |

During mirror updates, Aptly verifies the signature of the `Release` file using GnuPG. Refer to the documentation for the [`aptly mirror create`](/docs/commands/mirror/create/) command for detailed information on signature verification.

{{< callout type="info" >}}
Some aptly operations can be run concurrently while the mirror is being updated. The mirror update is split in two phases, an initial download of `Release` and `Packages` metadata, and the download of the actual package (.deb) files.

During the second phase, aptly unlocks the database and allow other aptly commands to be run while the mirror is being updated. Any operations on mirrors currently being updated will result in error. At the end of the mirror update operation, aptly will re-open the database
and store final status of the mirror, which can be displayed with [`aptly mirror show`](/docs/commands/mirror/show/).
{{< /callout >}}

## Examples
```bash
$ aptly mirror update debian-main

    2013/12/29 18:32:34 Downloading http://ftp.ru.debian.org/debian/dists/squeeze/Release...
    2013/12/29 18:32:37 Downloading http://ftp.ru.debian.org/debian/dists/squeeze/main/binary-amd64/Packages.bz2...
    2013/12/29 18:37:19 Downloading http://ftp.ru.debian.org/debian/pool/main/libg/libgwenhywfar/libgwenhywfar47-dev_3.11.3-1_amd64.deb...
    ...
```
