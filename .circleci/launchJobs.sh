#!/bin/bash

for serviceName in $DEPLOY_SERVICES_NAMES; do
  echo $serviceName
  curl -s -u $CIRCLE_TOKEN: \
    -d build_parameters[CIRCLE_JOB]=$serviceName \
    https://circleci.com/api/v1.1/project/github/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/tree/$CIRCLE_BRANCH
done