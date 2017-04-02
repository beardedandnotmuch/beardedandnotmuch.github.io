---
title: Git tips
tags: [git]
created_at: Oct 12, 2016
kind: article
---

"deleted by them" while rebasing
how to see diff:
`git diff mybranch@{1}...origin/master -- path/to/file`
from:
http://stackoverflow.com/a/33811103/1733730

git checkout --theirs PATH/FILE

git checkout --ours PATH/FILE

git diff -w branch-1..branch-2  -- PATH/FILE
