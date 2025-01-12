+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Create'
+++
aptly repo create
-----------------

Create local package repository. Repository would be empty when created,
packages could be added to the repository from [local files](/docs/commands/repo/add/),
[copied](/docs/commands/repo/copy/) or [moved](/docs/commands/repo/move/) from another local
repository or [imported](/docs/commands/repo/import/) from the mirror.

Usage:
```bash
$  aptly repo create <name>
```

Command Params | Description
--- | ---
`name` | A name used in Aptly to reference the repository.

Command Flags | Description
--- | ---
`-comment=""` | Text used to describe the local repository.
`-component="main"` | Default component when publishing.
`-distribution=""` | Default distribution when publishing.
`-uploaders-file=""` | `uploaders.json` to include when adding `.changes` to the repository. See [`aptly repo include`](/docs/commands/repo/include)

When publishing a repository, either directly or through a snapshot, the specified distribution and component will be used as defaults.

The contents of a local package repository can also be initialized from a snapshot:
```bash
$ aptly repo create <name> from snapshot <snapshot>
```

The only difference from the `aptly repo create <name>` command is that initial repository contents
will be copied from snapshot `<snapshot>`. This is useful to "roll back" to some state captured
in the snapshot.

## Examples
```bash
$ aptly repo create -comment="Nightly builds" testing

    Local repo [testing] successfully added.
    You can run 'aptly repo add testing ...' to add packages to repository.
```
