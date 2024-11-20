+++
date = '2024-11-19T00:51:03-06:00'
draft = false
title = 'Installation'
weight = 1
next = "/docs/configuration"
+++

Aptly is written in Go and is compiled to a single binary. There are various ways to install it:
{{< details title="Debian/Ubuntu" closed="true" >}}

aptly packages are available for [Debian](https://packages.debian.org/search?searchon=names&keywords=aptly) as well as [Ubuntu](http://packages.ubuntu.com/search?suite=all&searchon=names&keywords=aptly).

```bash
apt install aptly
```

If you would like to install a (newer) version of aptly than the Debian / Ubuntu package, aptly's repository can be installed by adding a new repository to `/etc/apt/sources.list.d`:

```bash
echo "deb \[signed-by=/etc/apt/keyrings/aptly.asc\] http://repo.aptly.info/ squeeze main" | sudo tee /etc/apt/sources.list.d/aptly.list
```

**And importing key that is used to sign the release:**

* For releases older than Debian 12 and Ubuntu 22.04, create the directory first:

```bash
sudo mkdir -p /etc/apt/keyrings; sudo chmod 755 /etc/apt/keyrings
```

* Download and install key:

```bash
wget -O /etc/apt/keyrings/aptly.asc https://www.aptly.info/pubkey.txt
```

After that you can install aptly as any other software package:

```bash
apt-get update && apt-get install aptly
```

Please don't worry about `squeeze` part in repo name: aptly package should work on Debian squeeze+, Ubuntu 10.0+. Package contains aptly binary, man page and bash completion.
{{< /details >}}

{{< details title="CI Builds for Debian/Ubuntu" closed="true" >}}

If you would like to use the CI Builds (formerly known as nightly) from github (unstable!), use the following APT source:

```bash
# In /etc/apt/sources.list.d/aptly.list:
deb \[signed-by=/etc/apt/keyrings/aptly.asc\] http://repo.aptly.info/ci _DIST_ main
```

Where `DIST` needs to be changed to the distribution: `buster` / `bullseye` / `bookworm` (Debian) or `focal` / `jammy` / `noble` (Ubuntu).
{{< /details >}}

{{< details title="Mac OS X" closed="true" >}}

**Mac OS X**: Installation using Homebrew:

$ brew install aptly
{{< /details >}}

{{< details title="Binary Releases" closed="true" >}}
Releases for binary distributions (depend almost only on `libc`) for Linux, FreeBSD, and Mac OS X are available.

* Linux (Debian, Ubuntu, RedHat, Centos, ...)
    * [32-bit](https://github.com/aptly-dev/aptly/releases/download/v{{< param version >}}/aptly_{{< param version >}}_linux_386.tar.gz) [64-bit](https://github.com/aptly-dev/aptly/releases/download/v{{< param version >}}/aptly_{{< param version >}}_linux_amd64.tar.gz)

* FreeBSD 9.2+
    * [32-bit](https://github.com/aptly-dev/aptly/releases/download/v{{< param version >}}/aptly_{{< param version >}}_freebsd_386.zip) [64-bit](https://github.com/aptly-dev/aptly/releases/download/v{{< param version >}}/aptly_{{< param version >}}_freebsd_amd64.zip)

* Mac OS X 10.9
    * [64-bit](https://github.com/aptly-dev/aptly/releases/download/v{{< param version >}}/aptly_{{< param version >}}_darwin_amd64.zip)

The archive contains a binary executable, as well as bash/zsh completion and man pages:

```bash
tar xzf aptly\_{{< param version >}}\_linux\_amd64.tar.gz
aptly\_{{< param version >}}\_linux\_amd64/aptly version
aptly version: {{< param version >}}
#optional: install to /usr/local/bin
install aptly\_{{< param version >}}\_linux\_amd64/aptly /usr/local/bin/aptly
```
{{< /details >}}

{{< details title="From Source" closed="true" >}}
If you have a Go environment set up (go 1.10+ required), you can build aptly from **source** by cloning it and building:

```bash
mkdir -p $GOPATH/src/github.com/aptly-dev/aptly
git clone https://github.com/aptly-dev/aptly $GOPATH/src/github.com/aptly-dev/aptly
cd $GOPATH/src/github.com/aptly-dev/aptly
make install
# aptly binary would be built in $GOPATH/bin/
aptly
```
{{< /details >}}

