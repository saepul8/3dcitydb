#!/bin/bash
# Shell script to remove a read-only user for a specific database schema
# on PostgreSQL/PostGIS

# read database connection details
source CONNECTION_DETAILS.sh

# add psql to PATH
export PATH="$PGBIN:$PATH"

# cd to path of the shell script
cd "$( cd "$( dirname "$0" )" && pwd )" > /dev/null

# Welcome message
echo ' _______   ___ _ _        ___  ___ '
echo '|__ /   \ / __(_) |_ _  _|   \| _ )'
echo ' |_ \ |) | (__| |  _| || | |) | _ \'
echo '|___/___/ \___|_|\__|\_, |___/|___/'
echo '                     |__/          '
echo
echo '3D City Database - The Open Source CityGML Database'
echo
echo '######################################################################################'
echo
echo 'This script will revoke read-only access on a 3DCityDB schema from a user. Note that'
echo 'this operation cannot be undone. Please follow the instructions of the script.'
echo 'Enter the required parameters when prompted and press ENTER to confirm.'
echo 'Just press ENTER to use the default values.'
echo
echo 'Documentation and help:'
echo '   3DCityDB website:    https://www.3dcitydb.org'
echo '   3DCityDB on GitHub:  https://github.com/3dcitydb'
echo
echo 'Having problems or need support?'
echo '   Please file an issue here:'
echo '   https://github.com/3dcitydb/3dcitydb/issues'
echo
echo '######################################################################################'

# cd to path of the SQL scripts
cd ../../SQLScripts/UTIL/RO_ACCESS

# Prompt for RO_USERNAME ------------------------------------------------------
while [ 1 ]; do
  echo
  echo 'Please enter the username of the read-only user.'
  read -p "(RO_USERNAME must not be empty): " RO_USERNAME

  if [[ -z "$RO_USERNAME" ]]; then
    echo
    echo 'Illegal input! RO_USERNAME must not be empty.'
  else
    break;
  fi
done

# List the 3DCityDB schemas granted to RO_USERNAME ----------------------------
echo
echo "Reading 3DCityDB schemas granted to \"$RO_USERNAME\" from the database \"$PGUSER@$PGHOST:$PGPORT/$CITYDB\" ..."
psql -d "$CITYDB" -f "../SCHEMAS/LIST_SCHEMAS_WITH_ACCESS_GRANT.sql" -v username="$RO_USERNAME"

if [[ $? -ne 0 ]] ; then
  echo 'Failed to read 3DCityDB schemas from database.'
  read -rsn1 -p 'Press ENTER to quit.'
  echo
  exit 1
fi

# Prompt for schema name ------------------------------------------------------
SCHEMA_NAME=citydb
echo "Please enter the name of the 3DCityDB schema that shall be revoked from \"$RO_USERNAME\"."
read -p "(default SCHEMA_NAME=$SCHEMA_NAME): " var
SCHEMA_NAME=${var:-$SCHEMA_NAME}

# Run REVOKE_RO_ACCESS.sql to revoke read-only access on a specific schema ----
echo
echo "Connecting to the database \"$PGUSER@$PGHOST:$PGPORT/$CITYDB\" ..."
psql -d "$CITYDB" -f "REVOKE_RO_ACCESS.sql" -v ro_username="$RO_USERNAME" -v schema_name="$SCHEMA_NAME"

echo
read -rsn1 -p 'Press ENTER to quit.'
echo
