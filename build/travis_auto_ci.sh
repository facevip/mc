#!/usr/bin/env bash
#
# Code coverage generation
#set -e -o pipefail
set -v

echo "TRAVIS_BRANCH=$TRAVIS_BRANCH"
echo "TRAVIS_PULL_REQUEST_BRANCH=$TRAVIS_PULL_REQUEST_BRANCH"
echo "TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST"
echo "TRAVIS_PULL_REQUEST_SHA=$TRAVIS_PULL_REQUEST_SHA"
echo "TRAVIS_PULL_REQUEST_SLUG=$TRAVIS_PULL_REQUEST_SLUG"
echo "TRAVIS_REPO_SLUG=$TRAVIS_REPO_SLUG"
echo "TRAVIS_BUILD_DIR=$TRAVIS_BUILD_DIR"
echo "cur dir"
pwd
basepath=$(
    cd $(dirname $0)
    pwd
)
echo "base=$basepath"
echo "git branch"
git branch
echo "git status"
git status

echo "TRAVIS_SECURE_ENV_VARS=$TRAVIS_SECURE_ENV_VARS"
echo "token=$MDJ33_TOKEN"
git remote -v
git branch -r

setup_git() {
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "mdj33"
}

commit_website_files() {
#    git checkout -b gh-pages
    git status
    git add -u
    git status
    git commit --message "Travis build"

#    git push origin HEAD:$TRAVIS_BRANCH
}

upload_files() {
#    local token="e39a91bcd236ad93a2cf849256cb7f206d77ea68"
#     local token="aa"
#    curl -H 'Authorization: token <e32f4a9bcfc918e8e1d4928fa47704d3eb451100>'  https://github.com/mdj33/plugin.git
#    git remote rm origin
    git remote add originx https://"${MDJ33_TOKEN}"@github.com/mdj33/plugin.git >/dev/null 2>&1
    git push --quiet --set-upstream originx $TRAVIS_BRANCH
}

if [ $TRAVIS_PULL_REQUEST == false ];then
    setup_git
    commit_website_files
    upload_files
fi
