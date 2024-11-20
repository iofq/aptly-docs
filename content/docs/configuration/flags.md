+++
date = '2024-11-19T00:37:55-06:00'
draft = false
title = 'Flags'
+++
There are flags that can be specfied alongside almost any aptly command.
Global flags override [configuration](/docs/configuration) parameters with similar names.

Flags can be specified before or after command name:

```
aptly -option1 command ...
or...
aptly command -option1 ...
```

| Global flag | Description |
| ----- | ----- |
| `-architectures=""` | (CSV list) List of architectures to consider during operation. Defaults to all available in repository |
| `-config=""` | Override location of configuration file |
| `-db-open-attempts=10` | Number of attempts to open DB if it's locked by other instance of aptly  {{< param version >}} |
| `-dep-follow-all-variants` | (boolean) When processing dependencies, follow a & b if depdency is 'a|b' |
| `-dep-follow-recommends` | (boolean) When processing dependencies, follow Recommends |
| `-dep-follow-source` | (boolean) When processing dependencies, follow from binary package to source package |
| `-dep-follow-suggests` | (boolean) When processing dependencies, follow Suggests |
| `-dep-verbose-resolve` | (boolean) When processing dependencies, print detailed logs {{< param version >}} |
| `-gpg-provider=gpg` | (string) PGP provider implementation (`gpg` for external gpg or `internal` for [Go internal implementation](/doc/feature/pgp-providers))

For more information on `-dep-*` flags, please see [dependency resolving](/doc/feature/dependencies).
 
