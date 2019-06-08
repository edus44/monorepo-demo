set -eo pipefail
COMMIT_RANGE='HEAD^1'

set +e
servicesNames=$(find services -mindepth 1 -maxdepth 1 -type d | cut -d/ -f2)
changedPaths=$(git diff $COMMIT_RANGE  --name-only | cut -d/ -f1,2 | sort -u)
changedBase=$(echo $changedPaths | tr ' ' '\n' | grep -E "^(.circleci|packages)/" )
changedServices=$(echo $changedPaths | tr ' ' '\n' | grep services/ | cut -d/ -f2)
set -e

echo " Services names   => $(echo $servicesNames)"
echo " Commit range     => $(echo $COMMIT_RANGE)"
echo " Changed paths    => $(echo $changedPaths)"
echo " Changed base     => $(echo $changedBase)"
echo " Changed services => $(echo $changedServices)"
echo ""

if [[ $changedBase = '' ]]; then
  echo 'No changes in base dependencies'
  deployServicesNames=$changedServices
else
  echo "Found changes in base dependencies"
  deployServicesNames=$servicesNames
fi

echo "Deploying services: $(echo $deployServicesNames)"

  set -x
for serviceName in $deployServicesNames; do
  echo $serviceName
  curl -s -u $CIRCLE_TOKEN: \
    -d build_parameters[CIRCLE_JOB]=$serviceName \
    https://circleci.com/api/v1.1/project/github/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/tree/$CIRCLE_BRANCH
done

