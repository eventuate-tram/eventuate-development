#! /bin/bash -e

if [ ! -d public ] ; then
  ./init-worktree.sh
fi

./generate-dashboard.sh

./push-public.sh
