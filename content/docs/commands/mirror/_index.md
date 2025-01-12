+++
date = '2025-01-11T14:18:59-06:00'
draft = false
title = 'Mirror'
+++
Aptly enables the creation of mirrors for remote Debian repositories, supporting HTTP, HTTPS, and FTP protocols. Mirrors are created using the [`aptly mirror create`](/docs/commands/mirror/create/) command, and their contents are downloaded with the [`aptly mirror update`](/docs/commands/mirror/update/) command. To preserve the current state of a mirror, create a [snapshot](/docs/commands/snapshot/). Snapshots can be published or used to construct other snapshots.

{{< cards >}}
  {{< card link="create/" title="Create" subtitle="Create a mirror" >}}
  {{< card link="drop/" title="Drop" subtitle="Delete a mirror" >}}
  {{< card link="edit/" title="Edit" subtitle="Edit a mirror's configuration" >}}
  {{< card link="list/" title="List" subtitle="List aptly's mirrors" >}}
  {{< card link="rename/" title="Rename" subtitle="Rename a mirror" >}}
  {{< card link="search/" title="Search" subtitle="Search aptly's mirrors" >}}
  {{< card link="show/" title="Show" subtitle="Show detailed mirror info" >}}
  {{< card link="update/" title="Update" subtitle="Update a mirror from the upstream repo" >}}
{{< /cards >}}
