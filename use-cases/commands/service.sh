#!/bin/bash

init="no"
for arg in "$@"
do
  index=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case $index in
    init) init="$val";;
    system_profile) system_profile="$val";;
    user_profile) user_profile="$val";;
    intent) intent="$val";;
    *)
  esac
done

# Check intent file
if [ "$2" != "delete" - a ! -f ${intent} ]; then
  echo "Can't proceed. Intent File ${intent} is not existed."
  return 1
fi

echo INTENT="${intent}"

# Check if system system_profile path is set
if [[ -v system_profile ]]; then
  export TF_VAR_system_profile="$system_profile"
elif [[ -v SYSTEM_PROFILE ]]; then
  export TF_VAR_system_profile="${SYSTEM_PROFILE}"
else
  echo "Can't proceed. System profile is not specified."
  return 1
fi
echo TF_VAR_system_profile="$TF_VAR_system_profile"

# Check if user user_profile file is set
if [[ -v user_profile ]]; then
  export TF_VAR_user_profile="${user_profile}"
else
  export TF_VAR_user_profile="${USER_PROFILE}"
fi
echo TF_VAR_user_profile="$TF_VAR_user_profile"

cd  ${TF_ROOT}/${1}
if [ "$init" = "y" -o "$init" = "yes" ]; then
  rm ./.terraform.lock.hcl; rm ./terraform.tfstate;
  terraform init
elif [ ! -f ".tfinit" ]; then
  terraform init
fi
touch .tfinit

echo cmd="$1"
if [ "${2}" = "create" -o  "${2}" = "update" ]; then
  terraform apply -var-file="${intent}" -state=${WORK_DIR}
elif [ "${2}" = "plan" ]; then
  terraform plan -var-file="${intent}" -out=${WORK_DIR}
elif [ "${2}" = "delete" ]; then
  terraform destroy 
else
  echo "Invalid command ${2}."
  cd $WORK_DIR
  return 1
fi
if [ $? -eq 0 ]; then
  echo "0 - Terraform applied successfully"
  searchstring="/"
  rest=${1#*$searchstring}
  terraform output > ${WORK_DIR}/${rest}-output.json
elif [ $? -eq 1 ]; then
  echo "1- Terraform applied failed"
elif [ $? -eq 2 ]; then
  echo "2- Terraform applied failed"
fi
cd $WORK_DIR