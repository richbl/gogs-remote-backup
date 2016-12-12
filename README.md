# Gogs-Remote-Backup
**Gogs-Remote-Backup** (`run_gogs_remote_backup.sh`) is a [bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) script to remotely back up key files/folders used in a [Gogs](https://gogs.io/) installation using the secure remote copy ([scp](http://man7.org/linux/man-pages/man1/scp.1.html)) command. Specifically, **Gogs-Remote-Backup** backs up the following:

- The [PostgreSQL](https://www.postgresql.org/) database used by [Gogs](https://gogs.io/)
- The [Gogs](https://gogs.io/) custom configuration file called `app.ini`. This file is important, as it contains all configuration details regarding the current [Gogs](https://gogs.io/) install
- The [Gogs](https://gogs.io/) [Git](https://git-scm.com/) repositories located in the `gogs-repositories` folder

> **Note:** [Gogs](https://gogs.io/) can be installed using other database options: this script currently only supports [PostgreSQL](https://www.postgresql.org/).

Importantly, `run_gogs_remote_backup.sh` is intended to be used for making unattended script calls (*e.g.*, running cron jobs) into a set of related [Git](https://git-scm.com/) projects configured as [Git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules), making it easy to use this project as a front-end while the supporting submodule projects get updated independently. The two submodule projects are:

- [**Postgresql-Db-Dump**](https://github.com/richbl/postgresql-db-dump), used to remotely dump a [PostgreSQL](https://www.postgresql.org/) database
- [**Remote-Folder-Copy**](https://github.com/richbl/remote-folder-copy), used to remotely copy a folder

> **Note:** Upon cloning this project, all submodule projects will be automatically included, so no additional configuration is required beyond typical script customization.


## Requirements

 - An operational [bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) environment (bash 4.3.46 used during development)
 -  The requirements of each of the two submodule projects used in this project. Note that each submodule project will alert the user to missing dependencies at runtime

While this package was written and tested under Linux (Ubuntu 16.10), there should be no reason why this won't work under other Unix-like operating systems.

## Basic Usage

Be sure to review and edit the contents of the **Gogs-Remote-Backup** script (`run_gogs_remote_backup.sh`) to customize script parameters and folder options.

> **Note:** **Gogs-Remote-Backup** really only serves as a wrapper for [**Postgresql-Db-Dump**](https://github.com/richbl/postgresql-db-dump) and [**Remote-Folder-Copy**](https://github.com/richbl/remote-folder-copy), so a good understanding of the parameters passed into these scripts is important.

Because **Gogs-Remote-Backup** is intended to run unattended, the only usage is to call the script directly, with no additional parameters passed on the command line.

    $ ./run_gogs_remote_backup.sh 
