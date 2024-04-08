if [[ "${UID}" -ne 0 ]]
then 
    echo 'Please run with sudo or root'
    exit 1 
fi