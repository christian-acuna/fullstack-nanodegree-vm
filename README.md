### Swiss-system Game  Tournament Planner
---

This project is a Python module that uses PostgreSQL database to manage a Swiss system game tournament where
players are not eliminated but rather are paired up by the number of total number of wins.


### File Structure

      tournament/
      ├──tournament_test.py
      ├──tournament.py
      ├──tournament.sql
      pg.config.sh
      README.md
      Vagrantfile

### Requirements

- Vagrant
- VirtualBox


### Install

If you don't already have Vagrant VM, download and install it on your machine.

1. Clone or fork this repo from Github and cd into the project folder
- From the terminal, cd to your /vagrant directory
- Run `vagrant up` to launch the virtual machine (VM)
- Then type `vagrant ssh` to log into into the VM
- Once in the VM, cd to the `/tournament` folder
- Create the tournament database with PostgreSQL CLI `psql -f tournament.sql`

#### Getting Started
    ```
    $ vagrant up
    $ vagrant ssh

    $ cd /vagrant/tournament
    # Launch the PSQL database
    $ psql tournament
    # Import the sql file to create tables and view
    tournament=> \i tournament.sql
    # Exit the psql CLI
    tournament=> \q

    # Go back to the tournament directory
    $ cd /vagrant/tournament
    # Run tests 
    $ python tournament_test.py
    ```
