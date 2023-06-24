#!/usr/bin/env bash

set -m # allow for job control
EXIT_CODE=0;  # exit code of overall script

function handleJobs() {
     for job in `jobs -p`; do
         echo "PID => ${job}"
         CODE=0;
         wait ${job} || CODE=$?
         if [[ "${CODE}" != "0" ]]; then
         echo "At least one test failed with exit code => ${CODE}" ;
         EXIT_CODE=1;
         fi
     done
}

trap 'handleJobs' CHLD  # trap command is the key part
DIRN=$(dirname "$0");

commands=(
    "{ terminus whoami; }"
    "{ terminus multidev:list ent-drupal-ci; }"
    "{ terminus -n build:env:create "ent-drupal-ci.dev" "pr-1" --pr-id=1 --yes -vvv; }"
)

clen=`expr "${#commands[@]}" - 1` # get length of commands - 1

for i in `seq 0 "$clen"`; do
    (echo "${commands[$i]}" | bash) &   # run the command via bash in subshell
    echo "$i ith command has been issued as a background job"
done

wait; # wait for all subshells to finish

echo "EXIT_CODE => $EXIT_CODE"
exit "$EXIT_CODE"
# end