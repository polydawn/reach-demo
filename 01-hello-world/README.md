Hello, world
============

This module is very simple: it has a single import (from catalog),
a single step with a single output,
and that single output is wired to a single export.

Evaluating the module will produce a short line of logging,
and should export a deterministic artifact (which just contains
the same log again as a file).

What did we learn?
------------------

This example isn't very interesting!  It almost would've been easier
to just use Repeatr and write a single formula directly.

But that's why it's a hello world :)

Already we can see:

- Imports via catalog are deterministically resolved to a WareID hash --
  can you see the relevant files in the `.timeless/catalog` dir at the repo root?
- A step in the module can use that import via a locally scoped name.
- A step's output can be exported at the end of the process.

One detail that may not be obvious yet is that the map emitted at the end
of the module evaluation is structurally the same as the "items" map inside
a release info in the Catalog.  We'll come back to this in later examples.
