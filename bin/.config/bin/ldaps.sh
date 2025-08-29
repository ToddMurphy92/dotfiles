#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")
echo "SCRIPT_DIR: $SCRIPT_DIR"

# Load environment variables from .env file
if [ -f "$SCRIPT_DIR/.env" ]; then
  export $(cat "$SCRIPT_DIR/.env" | xargs)
fi

ldaphost="${LDAPHOST}" # From .env file formatted as domaincontroller.domain.local
echo "ldaphost: $ldaphost"
userDN="${USERDN}" # From .env file formatted as DOMAIN\username
echo "userDN: $userDN"
# userPW=$(security find-generic-password -a "$USER" -s "ldaps.sh" -w)
filter="$1"

base=${BASE} #[-b searchbase] - From .env file formatted as dc=domain,dc=local
search="sub" #[-s {base|one|sub|children}]

flags=''
flags+='-x' #-x == Use simple authentication instead of SASL. Unsafe. You would not do this IRL.

options=''
options+='nettimeout=5' # Example of using timeout option

# ########################################################
# Example to return all attributes for a user:
# ########################################################

ldif=$(ldapsearch -LLL -H "ldaps://$ldaphost" -D "$userDN" -b "$base" -s "$search" -o "$options" -w "$(security find-generic-password -a "$USER" -s "ldaps.sh" -w)" $flags "$filter")
echo "$ldif"
