+++
date = '2024-11-19T21:06:33-06:00'
draft = true
title = 'Configuration'
+++

aptly looks for a configuration file in the following order:
* `~/.aptly.conf`
* `/etc/aptly.conf`

If no config file is found, a new one is created at `~/.aptly.conf`. 

The `-config=` flag can also be used to specify a config file location.

Configuration files do not cascade. The file that gets loaded must contain all configurations for a given aptly instance.

### Configuration References
{{< cards >}}
  {{< card link="docs/configuration/options" title="Configuration" icon="document-text" subtitle="Aptly configuration options" >}}
  {{< card link="docs/configuration/flags" title="Flags" icon="document-text" subtitle="Aptly CLI flags" >}}
{{< /cards >}}

Additionally, annotated default values can be found in the aptly repo [here](https://github.com/aptly-dev/aptly/blob/master/debian/aptly.nf).
## Root Directory
Aptly needs a root directory defined for persistent storage. If not specified, the directory defaults to `~/.aptly`, which will be created if missing.

The directory stores Aptly's database (`rootDir/db`), downloaded packages (`rootDir/pool`) and published repositories (`rootDir/public`)>

{{< callout type="warning" >}}
Database (`rootDir/db`) storage does not work well over slow backing storage like NFS or S3.
{{< /callout >}}

{{< callout type="warning" >}}
If you mirror upstream repos like `archive.ubuntu.com`, the `/pool` and `/public` directories need to be properly sized to store many GBs or even TBs of packages.
{{< /callout >}}

## HTTP Proxy
Aptly will respect HTTP proxy configuration defined in the `HTTP_PROXY` environment variable.
