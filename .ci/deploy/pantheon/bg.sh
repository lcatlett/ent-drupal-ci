#!/bin/bash

fakevars() {
export PATH=$PATH:$HOME/bin
export PR_NUMBER=1
export CI_BRANCH=base-package-updates
export CI_BUILD_NUMBER=5
export DEFAULT_SITE='ent-drupal-ci'
export CI_PR_URL=''
export CI_PROJECT_USERNAME='lcatlett'
export CI_PROJECT_REPONAME='***'
export DEFAULT_ENV='pr-1'
export TERMINUS_HIDE_UPDATE_MESSAGE=1
export TERMINUS_SITE='ent-drupal-ci'
export TERMINUS_ENV='pr-1'
export DEFAULT_BRANCH='master'
export BEHAT_ADMIN_PASSWORD=$(openssl rand -base64 24)
export BEHAT_ADMIN_USERNAME=pantheon-ci-testing-$CI_BUILD_NUMBER
export BEHAT_ADMIN_EMAIL=no-reply+ci-$CI_BUILD_NUMBER@getpantheon.com
export MULTIDEV_SITE_URL='https://pr-1-***.pantheonsite.io/'
export DEV_SITE_URL='https://dev-***.pantheonsite.io/'
export TEST_SITE_URL='https://test-***.pantheonsite.io/'
export LIVE_SITE_URL='https://live-***.pantheonsite.io/'
export ARTIFACTS_DIR='artifacts'
export ARTIFACTS_FULL_DIR='/tmp/artifacts'
export CI_BUILD_URL='https://github.com/lcatlett/***/actions/runs/5362799050'
export CI_NODE_INDEX=0
export CI_REPOSITORY_URL='https://github.com/lcatlett/***'
export ARTIFACTS_DIR_URL='https://github.com/lcatlett/***/actions/runs/5362799050/#artifacts'
export PATH=$PATH:$HOME/bin
export PR_NUMBER=1
export CI_BRANCH=base-package-updates
export CI_BUILD_NUMBER=5
export DEFAULT_SITE='ent-drupal-ci'
export CI_PR_URL=''
export CI_PROJECT_USERNAME='lcatlett'
export CI_PROJECT_REPONAME='***'
export DEFAULT_ENV='pr-1'
export TERMINUS_HIDE_UPDATE_MESSAGE=1
export TERMINUS_SITE='ent-drupal-ci'
export TERMINUS_ENV='pr-1'
export DEFAULT_BRANCH='master'
export BEHAT_ADMIN_PASSWORD=$(openssl rand -base64 24)
export BEHAT_ADMIN_USERNAME=pantheon-ci-testing-$CI_BUILD_NUMBER
export BEHAT_ADMIN_EMAIL=no-reply+ci-$CI_BUILD_NUMBER@getpantheon.com
export MULTIDEV_SITE_URL='https://pr-1-***.pantheonsite.io/'
export DEV_SITE_URL='https://dev-***.pantheonsite.io/'
export TEST_SITE_URL='https://test-***.pantheonsite.io/'
export LIVE_SITE_URL='https://live-***.pantheonsite.io/'
export ARTIFACTS_DIR='artifacts'
export ARTIFACTS_FULL_DIR='/tmp/artifacts'
}

wait_for_pids()
{
    for (( i = 1; i <= $#; i++ )) do
        wait $@
        status=$?
        echo "received status: "$status
        if [ $status -ne 0 ] && [ $status -ne 127 ]; then
            exit 1
        fi
    done
}

sleep_for_10()
{
    sleep 10
    exit 10
}
md()
{

   # if [[ "$CI_BRANCH" != "$DEFAULT_BRANCH" ]]
   # then
    # Create a new multidev environment (or push to an existing one)
    terminus auth:login
    terminus -n build:env:create "$TERMINUS_SITE.dev" "$TERMINUS_ENV" --pr-id=$PR_NUMBER --yes -vvv
    #else
    # Push to the dev environment
    #echo "pushing to dev"
    # terminus -n build:env:push "$TERMINUS_SITE.dev" --yes
    #fi
   # 
}

sleep_for_20()
{
    sleep 20
}

sleep_for_10 &
pid1=$!
echo "pid1: "$pid1

sleep_for_20 &
pid2=$!
echo "pid2: "$pid2

md &
pid3=$!

fakevars

echo value of  site: $TERMINUS_SITE
echo value of  env: $TERMINUS_ENV
echo value of $PR_NUMBER   


wait_for_pids $pid2 $pid1   $pid3 
