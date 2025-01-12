+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo List'
+++

aptly repo list
---------------

The `list` command displays a list of all local package repositories.

{{< callout type="info" >}}
To get more information about local repository, run `aptly repo show <name>`.
{{< /callout >}}

## Usage
```bash
$  aptly repo list
```

| Command Flags | Description                               |
|---------------|-------------------------------------------|
| `-raw`        | Display the list in a machine-readable format |

## Examples
```bash
$ aptly repo list
    List of local repos:
     * [stable]: Stable packages for project Foo (packages: 10)
     * [testing] (packages: 1)
```

```bash
$ aptly repo list -raw
    stable
    testing
```
