+++
date = '2024-11-19T21:06:33-06:00'
draft = true
title = 'Configuration Options'
+++
Configuration file is stored in JSON format. Annotated default values can also be found in the repo [here](https://github.com/aptly-dev/aptly/blob/master/debian/aptly.conf).

The following options can be defined in Aptly'json configuration file:
### Options:
| Option    | Description |
| -------- | ------- |
| `rootDir` | (path) Root of directory storage to store database (`rootDir/db`), downloaded packages (`rootDir/pool`) and published repositories (`rootDir/public`). Database storage does not work well over NFS. |
| `downloadConcurrency` | (int) Number of parallel download threads to use when downloading packages |
| `downloadSpeedLimit` | (int) Limit download bandwidth used by aptly in kbytes per second. 0 means unlimited |
| `architectures` | (list) List of architectures to process; if left empty, defaults to all available architectures; Can be overridden per command with option `-architectures` |
| `dependencyFollowSuggests` | (boolean) Follow contents of `Suggests:` field when processing dependencies for the package |
| `dependencyFollowRecommends` | (boolean) Follow contents of `Recommends:` field when processing dependencies for the package |
| `dependencyFollowAllVariants` | (boolean) When dependency looks like `package-a | package-b`, follow both variants always |
| `dependencyFollowSource` | (boolean) Follow dependency from binary package to source package |
| `dependencyVerboseResolve` | (boolean) Print detailed logs while resolving dependencies (< {{< param version >}}) |
| `gpgDisableSign` | (boolean) Don't sign published repositories with `gpg`. Can be disabled on per-repo basis using `-skip-signing` flag when publishing |
| `gpgDisableVerify` | (boolean) Don't verify remote mirrors with `gpg`. Can be disabled on per-mirror basis using `-ignore-signatures` flag when creating and updating mirrors |
| `gpgProvider` | (string) Implementation of PGP signing/validation - `gpg` for external `gpg` utility or `internal` to use Go internal implementation |
| `downloadSourcePackages` | (boolean) If enabled, all mirrors created will download Debian source packages; Can be enabled on per-mirror basis with `-with-sources` flag |
| `serveInAPIMode` | (boolean) Enables serving published repos according to configured `FileSystemPublishEndpoints` while running aptly in the api mode. If there are no `FileSystemPublishEndpoints`, it serves `public/` subdirectory of aptly’s root. For example, if you have FileSystemPublishEndpoints configured as follows then the contents of `/srv/publishes` are accessible via `http://aptlyhost/repos/bootstrap/` and the contents of `/opt/another` via `http://aptlyhost/repos/some_other/` accordingly. If FileSystemPublishEndpoints are not configured, the default publish location is accessible via `http://aptlyhost/repos/-/`. |
| `ppaDistributorID` / `ppaCodename` | (string) Specifies parameters for short PPA url expansion. If left blank they default to output of the `lsb_release` command |
| `FileSystemPublishEndpoints` | (json) Configuration of local filesystem publishing endpoints (see [custom filesystem publishing](/doc/feature/filesystem)) (< {{< param version >}}) |
| `S3PublishEndpoints` | (json) Configuration of Amazon S3 publishing endpoints (see [publishing to S3](/doc/feature/s3/)) |
| `SwiftPublishEndpoints` | (json) Describes OpenStack Swift publishing parameters (see [publishing to Swift](/doc/feature/swift)) |
| `enableMetricsEndpoint` | (boolean) Specifies whether the metrics endpoint should be enabled or disabled when running api serve (see [misc API](/doc/api/misc)) |
| `logLevel` | (string) Specifies the log level, valid values are `debug`, `info`, `warn` and `error`. Only has effect with log format set to `json`; recommended to leave at default value otherwise. |
| `logFormat` | (string) Specifies the log format to use, can be `default` or `json`. |
| `skipLegacyPool` | (boolean) In aptly up to version 1.0.0, package files were stored in internal package pool with MD5-dervied path. since 1.1.0 package pool layout was changed; if option is enabled, aptly stops checking for legacy paths; by default option is enabled for new aptly installations and disabled when upgrading from older versions (< {{< param version >}}) |
