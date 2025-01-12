+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Show'
+++

aptly repo show
---------------

The `show` command displays information about a local repository and can optionally list all packages within it.

## Usage
```bash
$  aptly repo show <name>
```

| Command Params | Description            |
|----------------|------------------------|
| `name`         | Local repository name |

| Command Flags     | Description                                          |
|-------------------|------------------------------------------------------|
| `-with-packages`  | Display a detailed list of packages and their versions stored in the mirror |

{{< callout type="info" >}}
If repository has an `uploaders` file attached (from `repo include`), it will be displayed as well.
{{< /callout >}}

## Examples
```bash
$ aptly repo show -with-packages stable
    Name: stable
    Comment: Stable packages for project Foo
    Default Distribution: wheezy
    Default Component: main
    Number of packages: 10
    Packages:
      libmysqlclient18_5.5.35-rel33.0-611.squeeze_amd64
      percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_amd64
      percona-server-common-5.5_5.5.35-rel33.0-611.squeeze_amd64
      percona-server-server_5.5.35-rel33.0-611.squeeze_amd64
      percona-server-server-5.5_5.5.35-rel33.0-611.squeeze_amd64
      libmysqlclient18_5.5.35-rel33.0-611.squeeze_i386
      percona-server-client-5.5_5.5.35-rel33.0-611.squeeze_i386
      percona-server-common-5.5_5.5.35-rel33.0-611.squeeze_i386
      percona-server-server_5.5.35-rel33.0-611.squeeze_i386
      percona-server-server-5.5_5.5.35-rel33.0-611.squeeze_i386
```
