#!/bin/bash

apk add jq

for serviceName in $DEPLOY_SERVICES_NAMES; do
  echo "Launching $serviceName"
  result=$(curl -s -u $CIRCLE_TOKEN: \
    -d build_parameters[CIRCLE_JOB]=$serviceName \
    -d revision=$CIRCLE_SHA1 \
    https://circleci.com/api/v1.1/project/github/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/tree/$CIRCLE_BRANCH)
  buildUrl=$( echo $RES | jq -r ".build_url" )
  echo $buildUrl
done