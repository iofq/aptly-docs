+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Edit'
+++
aptly repo edit
---------------

The `edit` command updates the metadata of a local repository, including the comment, default distribution, and component.

## Usage
```bash
$  aptly repo edit <name>
```

| Command Params | Description            |
|-----------------|------------------------|
| `name`            | Local repository name |

| Command Flags       | Description                                                       |
|---------------------|-------------------------------------------------------------------|
| `-comment=""`       | Text describing the local repository                             |
| `-component=""`     | Default component to use when publishing                         |
| `-distribution=""`  | Default distribution to use when publishing                      |
| `-uploaders-file=""`| Path to `uploaders.json` for including `.changes` into the repository |

The specified `distribution` and `component` serve as defaults when publishing the repository, either directly or through a snapshot.

If the `-uploaders-file` flag is specified, the file's contents are parsed and linked to the local repository. This sets per-repository upload restrictions, which are enforced by the `aptly repo include` command. To remove upload restrictions, provide an empty value: `-uploaders-file=""`.

## Examples
```bash
$ aptly repo edit -comment="Nightly builds" -distribution=wheezy testing
    Local repo [testing]: Nightly builds successfully updated.
```
