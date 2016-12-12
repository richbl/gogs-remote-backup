#!/bin/bash

# -----------------------------------------------------------------------------
# Copyright (C) Business Learning Incorporated (businesslearninginc.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.
# -----------------------------------------------------------------------------
#
# A bash script to remotely backup files from a Gogs (https://github.com/gogits/gogs) install
#
# Version: 0.1.0
#
# Requirements:
#
#  --Requirements from the following submodule projects:
#    --postgres_db_dump project (https://github.com/richbl/postgresql-db-dump)
#    --remote_folder_copy project (https://github.com/richbl/remote-folder-copy)
#
# Inputs:
#
#  --None (runs with no inputs)
#
# Outputs:
#
#  --None (side effect is the completion of the called script(s))
#

# Backup Gogs database (see submodule project for arguments passed)
#
/bin/bash ./postgresql-db-dump/postgres_db_dump.sh -h EXAMPLE.COM -u USERNAME -p 'PASSWORD' -d GOGS_DATABASE -o . &&

# Backup Gogs repos folder (gogs-repositories) and Gogs custom conf folder (app.ini)
# (see submodule project for arguments passed)
#
/bin/bash ./remote-folder-copy/remote_folder_copy.sh -u USERNAME -p 'PASSWORD' -w EXAMPLE.COM -P 1234 -s /home/GIT_USER/gogs-repositories -d . &&
/bin/bash ./remote-folder-copy/remote_folder_copy.sh -u USERNAME -p 'PASSWORD' -w EXAMPLE.COM -P 1234 -s /home/GIT_USER/gogs/custom/conf -d .
