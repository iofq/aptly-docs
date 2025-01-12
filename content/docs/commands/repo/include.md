+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo Include'
+++

aptly repo include
------------------

The `include` command enables automatic processing of `.changes` files to manage package upload permissions to local repositories.

These facilitate a package upload workflow using Debian tools like `dpkg-genchanges` and `dput`. A set of Debian package files is uploaded along with a `.changes` file, signed by the developer, that describes the changeset. Aptly verifies the signature, checks package integrity, and optionally applies user-defined rules to add the package to local repositories.

## Usage
```bash
$  aptly repo include <file.changes>|<directory> ...
```

| Command Flags              | Description                                                                                     |
|----------------------------|-------------------------------------------------------------------------------------------------|
| `-accept-unsigned`         | Accept unsigned `.changes` files                                                               |
| `-force-replace`           | Replace existing packages that conflict with new ones by removing the existing package         |
| `-ignore-signatures`       | Disable verification of `.changes` file signatures                                             |
| `-keyring=`                | GPG keyring to use for verifying `.changes` files (can be specified multiple times)            |
| `-no-remove-files`         | Keep files that have been successfully imported into the repository                            |
| `-repo="distribution"`| Specify the repository where files should go; defaults to the `Distribution` field of the `.changes` file |
| `-uploaders-file=""`       | Path to the `uploaders.json` file                                                              |

Aptly performs a recursive search for `.changes` files in the paths provided as program arguments.
For each .changes file found:

* The `.changes` file is copied to a temporary directory.
* Signature presence is verified. If no signature is found, the file is rejected unless the `-accept-unsigned` flag is used.
* The signature is validated, and the GPG key IDs used for signing are recorded. If the signature verification fails, the file is rejected unless the `-ignore-signatures` flag is specified.
* Package files referenced in the `.changes` file are copied to a temporary directory, and their checksums are verified. If the checksums do not match, the `.changes` file is rejected.
* Aptly determines the local repository name using the `-repo` flag or fields from the `.changes` file (details below).
* Each package file is checked to ensure it matches the Architecture, Source, and Binary fields.
* If a local repository has an associated `-uploaders-file`, it is used. Otherwise, the value of the `-uploaders-file` flag is applied. If no `-uploaders-file` is specified, anyone can upload any package.
* Fields from the `.changes` file and GPG key IDs are matched against rules in the `-uploaders-file`.
* Package files are added to the local repository as appropriate.

The process then repeats with the next `.changes` file.

Behavior surrounding duplicate packages and deduplication match the `repo create/add` commands.

## Examples

    $ aptly repo include incoming/
    gpgv: Signature made Sun Mar 15 20:36:44 2015 MSK using DSA key ID 16DB3E6D
    gpgv: Good signature from "Aptly Tester (don't use it) <test@aptly.info>"
    Loading repository unstable for changes file hardlink_0.2.1_amd64.changes...
    [+] hardlink_0.2.1_source added
    [+] hardlink_0.2.1_amd64 added


### Repo name

For each `.changes` file, the Local repository name is calculated based on value of `-repo` flag
and `.changes` file fields. Aptly makes use of the [Go template syntax](http://godoc.org/text/template)
for the value of `-repo` flag.

By default, the `-repo` flag has value `{{.Distribution}}` which means that packages would be
uploaded to local repository matching value of `Distribution` field in `.changes` file.
If a raw value (e.g. `-repo=mysoft`) is given, it would be used for any `.changes` file.

Values of all `.changes` file fields are exposed to the template as `{{.Field}}` replacements.
Templates are powerful, e.g. `local-{{.Distribution}}` would be expanded to `local-` concatenated
with `Distribution:` field value. `{{if eq .Source foo}}mysoftware{{else}}foreignsoftware{{end}}`
would choose the repo name based on test `Source: == "foo"`.

### Uploaders.json

Uploaders configuration allows to restrict who can upload packages (based on GPG key IDs). Uploaders
file is JSON-based (it allows inline comments and relaxed comma placement):

    {
        "groups": {
            "admins": ["1B2AFA1C"],
            // admins can do whatever developers can do
            "developers": ["21DBB89C16DB3E6D", "37E1C17570096AD1", "admins"]
        },
        "rules": [
            // don't let anyone upload these packages
            { "condition": "Source (dangerous) | Source (kernel)",
              "deny": ["*"]
            },
            // admins and our CTO can upload to stable
            { "condition": "Distribution (stable)",
              "allow": ["admins", "CEA4B22E"]
            },
            // everybody else is denied upload
            { "condition": "Distribution (stable)",
              "deny": ["*"]
            },
            // hardlink is our favourite package!
            { "condition": "Source (hardlink)",
              "allow": ["developers", "admins"]
            },
            // arm64 is open to anyone
            {
              "condition": "Architecture (% *arm64*)",
              "allow": ["*"]
            }
        ]
    }

Uploaders file consists of two parts: groups definition and rules. Groups are optional, but they could
be used to place list of GPG key IDs to be used in rules. Groups may reference other groups, group name
would be expanded to list of GPG key IDs when found in rules.

GPG keys could be given in short or long format. GPG signature verification produces always long key IDs,
but short keys would match against them. It is recommended long key IDs due to risk of collisions.
Special value `*` matches against any key.

Rules are evaluated like firewall from first item to last. If no rules match `.changes` file, upload
is denied. Each rule consists of three parts: condition, allow/deny (or both) lists. Condition is using
[package query](/doc/feature/query) syntax, but it matches agains `.changes` file fields. If condition
part of the rule matches `.changes` file, search stops and rule is processed:

 * if any of keys which have been used to sign `.changes` file match `deny` list, upload would be rejected
 * if any of keys which have been used to sign `.changes` file match `allow` list, upload would be accepted

