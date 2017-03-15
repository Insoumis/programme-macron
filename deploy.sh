#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

mkdir deploy
cd deploy

echo $GH_TOKEN | cut -c1-5

git init
git config user.name "Lucas Gautheron"
git config user.email "lucas.gautheron@gmail.com"

git remote add origin "https://$GH_TOKEN@github.com/Insoumis/programme-macron.git"
git fetch origin
git fetch origin gh-pages

git checkout gh-pages

git rm -r *
cp -R ../public/ .
git add *

git commit -m"Update"

git push
