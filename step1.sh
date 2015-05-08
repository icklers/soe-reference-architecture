#! /bin/bash

# this is step where we expect to have an already installed satellite 6 and create the configuration for all further steps, the main org and subscriptions

# TODO short desc and outcome of this step

DIR="$PWD"
source "${DIR}/common.sh"

# check if organization already exists. if yes, exit
#hammer organization info --name $ORG >/dev/null 2>&1 && echo "Organization $ORG already exists. Exit."; exit 1

# create org
hammer organization create --name "$ORG" --label "$ORG_LABEL" --description "$ORG_DESCRIPTION"

# TODO check if the file exists

# upload manifest
hammer subscription upload --organization "$ORG" --file "$subscription_manifest_loc"

# note: has worked for me only at the second try, so maybe we should check if successful before proceeding:
hammer subscription list --organization "$ORG" | grep -q 'Red Hat Enterprise Linux Server' && echo ok || echo "Subscription import has not been successful. Exit" && exit 1

