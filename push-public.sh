#! /bin/bash -e

# git worktree add -B gh-pages public origin/gh-pages

cd public

git commit -am "Updated content"

git push origin gh-pages
