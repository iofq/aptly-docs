+++
date = '2025-01-11T14:18:59-06:00'
title = "Edit Mirror"
+++

aptly mirror edit
-----------------

The 'edit' command allows you to modify the settings of a mirror. You can adjust the filter query, specify whether to include dependencies during filtering, and define the list of architectures to process.

## Usage
```bash
$ aptly mirror edit <name>
```

| Command Params | Description |
|---|---|
| `name` | Mirror name |

| Command Flags | Description |
|---|---|
| `-archive-url=` | Change the archive URL. |
| `-filter=` | [Package query](/doc/feature/query/) applied to packages in the mirror. Set to empty to disable filtering. |
| `-filter-with-deps` | When filtering, include [dependencies](/doc/feature/dependencies) of matching packages as well. |
| `-architectures=` | Global flag to change the list of architectures. |
| `-ignore-signatures` | Disable verification of `Release` file signatures. |
| `-keyring=trustedkeys.gpg` | GPG keyring to use when verifying the `Release` file (can be specified multiple times). |
| `-with-installer` | Download additional not packaged installer files. |
| `-with-sources` | Download source packages in addition to binary packages. |
| `-with-udebs` | Download `.udeb` packages (Debian installer support). |

In order to apply new filtering settings, [update](/docs/commands/mirror/update/)
mirror.

## Examples
```bash
$ aptly mirror edit -filter=nginx -filter-with-deps wheezy-main
    Mirror [wheezy-main]: http://mirror.yandex.ru/debian/ wheezy successfully updated.
```
```bash
$ aptly mirror edit -architectures=i386,amd64 sensu
    Downloading http://repos.sensuapp.org/apt/dists/sensu/Release...
    Mirror [sensu]: http://repos.sensuapp.org/apt/ sensu successfully updated.
```
