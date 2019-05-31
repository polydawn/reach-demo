Hello, multistep!
=================

This module is still basic, but contrasted with the previous demo,
has multiple steps!
Each step has its own inputs and outputs,
and some of the steps refer to other steps' outputs for their inputs!

Each of these steps concatenates to a file,
which is passed between them,
and the final step emits it to stdout and yields it as an output again,
which is exported.


What did we learn?
------------------

We can construct pipelines -- and even complex graphs -- in a module,
and `reach` will deal with the whole thing.

As you can see from the logs emitted on your terminal,
every single step will each be resolved into a
[Formula](https://repeatr.io/glossary#formula);
then that formula is run;
and then its [output](https://repeatr.io/glossary#formula-output)
will be copied to wherever it's depended on;
and the cycle continues until every step is evaluated.


Take note
---------

1. Note that the order the steps were defined in the file doesn't matter --
`reach` will automatically do a topological (that is, dependency-order) sort
on all the steps, and evaluate each step according to that order.
So you can write things however you want and not worry about it.

2. Note that assignment order is consistently right-hand side assigns to left-hand side:
  - in module imports, the local name to assign is on the left, and the lookup is on the right;
  - in operation inputs, the mount path to populate is on the left, and the local name is on the right;
  - in operation outputs, the local name to assign is on the left, and the mount path to pack is on the right;
  - in module exports, the final result name to assign is on the left, and the local name is on the right.

3. You've probably noticed that inside every entry in the "steps" map,
there's another map tagging all its content as `"operation"`.  There are some
other kinds of steps than "operation" -- but we won't see those until a few
examples later.


Cool science
-------------

What happens when you open the module in an editor and change the "action" scripts?

(Any change will do -- even whitespace is fine.  Repeatr doesn't attempt to
understand the semantics of strings or shell scripts!)

Try it!

Notice how that step will be executed again when you next run `reach emerge` --
but whether or not steps that *depend* on that one are executed again *depends
on if your change mattered*.  If you made a whitespace only change to the action,
the the contents of the file being passed on won't change;
and thus later steps won't be phased!
If, on the other hand, you made a change that changed the message file,
then subsequent things will run anew!
This kind of "caching" (or "memoization") is extremely useful.
