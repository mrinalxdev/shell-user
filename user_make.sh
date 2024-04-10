if [[ "${UID}" -ne 0 ]]
then 
    echo 'Please run with sudo or root'
    exit 1 
fi

if [[ "${#}" -lt 1 ]]
then  
    echo "Usage: ${0} USER_NAME [COMMENT] ..."
    echo 'Create a user with name USER_NAME and comments field of COMMENT'
    exit 1 
fi

USER_NAME = "${1}"
echo $USER_NAME

shift 
COMMENT = "${@}"

PASSWORD = $(date + $%s%N) # The password
echo PASSWORD

useradd -c "${COMMENT}" -m ${USER_NAME}

if [[ $? -ne 0 ]]
then 
    echo 'The Account could not be created'
    exit
fi

echo $PASSWORD | passwd --stdin $USER_NAME

if [[ $? -ne 0 ]]
then 
    echo 'Password could not be set'
    exit 1
fi


passwd -e $USER_NAME

echo 
echo "Username : $USER_NAME"
echo
echo "Password : $PASSWORD"
echo 
echo $(hostname)

