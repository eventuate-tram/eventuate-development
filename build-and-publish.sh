#! /bin/bash -e

if [ ! -d public ] ; then
  ./init-worktree.sh
fi

pip install -r requirements.txt

./generate-dashboard.sh

git config --global user.email "Chris@ChrisRichardson.net"
git config --global user.name "Chris Richardson"

./push-public.sh
