+++
date = '2025-01-11T14:18:59-06:00'
title = "Create Mirror"
+++

aptly mirror create
-------------------

Apty creates a local mirror of a remote repository. It supports both standard Debian repositories and flat repositories exported via HTTP(S) or FTP. Aptly attempts to download the Release file from the remote repository and verify its signature.

## Usage
```bash
$ aptly mirror create <name> <archive url> <distribution> [<components> ...]
```

For Launchpad PPAs:

```bash
$ aptly mirror create <name> <ppa:user/project>
```

| Command Params | Description |
| ----- | ----- |
| `name` | Name of aptly mirror to create |
| `archive-url` | URL of archive, e.g. [http://ftp.ru.debian.org/debian/](http://ftp.ru.debian.org/debian/) |
| `distribution` | Distribution name, e.g. `jammy`. For flat repositories use `./` instead |
| `components...` | Optional list of components to download. If not specified aptly will fetch all components specified in the repo's Release files. |

| Command Flags | Description |
|---|---|
| `-filter=` | Specifies a query to select packages matching the criteria. Refer to the [package query documentation](/doc/feature/query/) for available query options. |
| `-filter-with-deps` | When filtering packages, also include their dependencies in the selection. |
| `-force-components` | Skip the check that ensures the requested components are listed in the `Release` file. Generally only needed for non-standard repos |
| `-ignore-signatures` | Disable verification of the `Release` file signatures. |
| `-keyring=trustedkeys.gpg` | Use the specified GPG keyring for verifying the `Release` file signatures. Multiple keyrings can be provided. |
| `-with-installer` | Download additional installer files that are not included in the standard packages. |
| `-with-sources` | Download source packages in addition to binary packages. This behavior might be enabled by default, depending on the configuration option `downloadSourcePackages`. |
| `-with-udebs` | Download .udeb packages for Debian installer support. |

{{< callout type="info" >}}
For newly created mirrors, [`aptly mirror update`](/docs/commands/mirror/update/) should also be run to download mirror contents for the first time.
{{< /callout >}}

## Package Architecture and Component Management
By default, aptly downloads packages for all architectures. You can limit architectures using either:

* The global `architectures` configuration setting (see [Configuration](/docs/configuration))
* The `-architectures` command line option, on a per-command basis.

When no components are specified, aptly downloads and merges packages from all components. To keep components separate, [create individual mirrors for each component](/doc/features/multi-component/).

## PPA and URL Handling
For PPA URLs, aptly automatically expands them to HTTP URLs using the configuration settings:

* `ppaDistributorID`
* `ppaCodename`

On Ubuntu systems, these defaults typically work automatically as aptly determines the codename using the lsb_release command.

## Filtering and Dependencies
When filtering is enabled:

* All package lists are downloaded
* Filters are applied to these lists
* Only matching packages are downloaded
* The filtered list becomes the mirror's contents

If dependency following is enabled, the filtered list expands to include required dependencies. Example filter uses:

* Get a single package with dependencies: `-filter='nginx' -filter-follow-deps`
* Download only high-priority packages: `-filter='Priority (required)'`

## Package signatures
Aptly attempts to verify signatures of the Release files using GnuPG. By
default, keyring `~/.gnupg/trustedkeys.gpg` is used. If you would
like to use different keyring(s), specify them using `-keyring` flag.

If aptly is running on Debian/Ubuntu machine, it would be good idea to import
archive signing keys shipped with the operating system:

```bash
$ gpg --no-default-keyring --keyring /usr/share/keyrings/debian-archive-keyring.gpg --export | gpg --no-default-keyring --keyring trustedkeys.gpg --import
```

If you're running Ubuntu, use
`/usr/share/keyrings/ubuntu-archive-keyring.gpg`

{{< callout type="info" >}}
If GnuPG is complaining that required key to verify signature is
missing, it will report a key ID, e.g. `46925553`. Keys can be
downloaded from a public keyserver and imported into trusted keyring using
something like:
```bash
$ gpg --no-default-keyring --keyring trustedkeys.gpg --keyserver keys.gnupg.net --recv-keys 46925553
```

Replace `46925553` with the key ID GnuPG is complaining about.
{{< /callout >}}

If you're mirroring a [flat repository](https://wiki.debian.org/DebianRepository/Format#Flat_Repository_Format), sometimes the repository key is located
near the Release files, so you can download it and import into your trusted
keychain:
```bash
$ wget -O - https://some.repo/repository/Release.key | gpg --no-default-keyring --keyring trustedkeys.gpg --import
```

You can learn about signed Debian repositories in [Debian wiki](https://wiki.debian.org/SecureApt).
If you would like to disable signature checksentirely , use the flag `-ignore-signatures` or configuration setting `gpgDisableVerify`.

## Storage Optimization
Aptly uses deduplication for downloaded files. For example, creating two mirrors (one with source packages, one without) only uses space for unique files, not duplicates.

## Examples
```bash
$ aptly -architectures="amd64" mirror create debian-main http://ftp.ru.debian.org/debian/ squeeze main
    2013/12/28 19:44:45 Downloading http://ftp.ru.debian.org/debian/dists/squeeze/Release...
    ...

    Mirror [debian-main]: http://ftp.ru.debian.org/debian/ squeeze successfully added.
    You can run 'aptly mirror update debian-main' to download repository contents.
```
