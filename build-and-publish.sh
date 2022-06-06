#! /bin/bash -e

if [ ! -d public ] ; then
  ./init-worktree.sh
fi

pip install -r requirements.txt

./generate-dashboard.sh

./push-public.sh
