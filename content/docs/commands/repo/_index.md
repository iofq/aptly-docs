+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Repo'
+++
Within aptly, a local repository is a collection of packages, primarily consisting of custom packages created internally. These packages can be dynamically managed within the repository, allowing for actions such as addition, removal, movement, and copying between repositories. Multiple versions of the same package can be maintained within a repository.

Local repositories are ideal for distributing in-house software or custom-built versions of upstream packages. The `aptly repo add` command facilitates the addition of both source packages and built binary packages to a local repository. Furthermore, local repositories can be snapshotted, potentially in conjunction with snapshots of official repositories, and subsequently published.

To capture a specific point-in-time state of a local repository, see the documentation on [Snapshots](/docs/commands/snapshot/). Local repositories can then be published either directly or based on a previously created snapshot.

{{< cards >}}
  {{< card link="create/" title="Create" subtitle="Create a local repo" >}}
  {{< card link="add/" title="Add" subtitle="Add packages to a local repo" >}}
  {{< card link="copy/" title="Copy" subtitle="Clone a repo" >}}
  {{< card link="drop/" title="Drop" subtitle="Delete a local repo" >}}
  {{< card link="edit/" title="Edit" subtitle="Edit a local repo" >}}
  {{< card link="import/" title="Import" subtitle="Import packages from one repo to another" >}}
  {{< card link="include/" title="Include" subtitle="Manage package uploads" >}}
  {{< card link="list/" title="List" subtitle="List local repos" >}}
  {{< card link="move/" title="Move" subtitle="Move packages between repos" >}}
  {{< card link="remove/" title="Remove" subtitle="Remove a local repo" >}}
  {{< card link="search/" title="Search" subtitle="Search local repos" >}}
  {{< card link="show/" title="Show" subtitle="Show detalied repo info" >}}
{{< /cards >}}
