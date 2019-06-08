#!/bin/bash

for serviceName in $DEPLOY_SERVICES_NAMES; do
  echo "Launching: $serviceName"

  result=$(curl -s -u $CIRCLE_TOKEN: \
    -d build_parameters[CIRCLE_JOB]=$serviceName \
    https://circleci.com/api/v1.1/project/github/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/tree/$CIRCLE_BRANCH)

  # Build url
  buildUrl=$( echo $result | jq -r ".build_url" )
  echo "Build URL: $buildUrl"

  # Save artifact link
  mkdir -p /tmp/artifacts
  echo "<meta http-equiv='refresh' content='0; url=$buildUrl'>" > /tmp/artifacts/$serviceName.html
done