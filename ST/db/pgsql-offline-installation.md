Installing PostgreSQL Offline on RHEL
If your server does not have internet access then you can install PostgreSQL offline. Skip this section if you have already completed the installation of PostgreSQL from the previous section.
For Red Hat Enterprise Linux 7
Go to https://yum.postgresql.org/11/redhat/rhel-7-x86_64/ and download the specified version of the following packages:

postgresql11-libs
postgresql11
postgresql11-server
Install the packages in the order listed above, for example:
yum localinstall postgresql11-libs-11.10-1PGDG.rhel7.x86_64.rpm postgresql11-11.10-1PGDG.rhel7.x86_64.rpm postgresql11-server-11.10-1PGDG.rhel7.x86_64.rpm

Note: If the RHEL7 command does not work, use the RHEL6 command below.
For Red Hat Enterprise Linux 6
Go to https://yum.postgresql.org/11/redhat/rhel-6-x86_64/ and download the specified version of the following packages:

postgresql11-libs
postgresql11
postgresql11-server
Install the packages in the order listed above, for example:
rpm -ivh postgresql11-libs-11.10-1PGDG.rhel6.x86_64.rpm postgresql11-11.10-1PGDG.rhel6.x86_64.rpm postgresql11-server-11.10-1PGDG.rhel6.x86_64.rpm


Initialize the PostgreSQL data directory:
sudo -u postgres /usr/pgsql-11/bin/initdb --encoding UTF8 /var/lib/pgsql/11/data

Set the database service to start on boot: chkconfig postgresql-11 on

Start the database service:
systemctl enable postgresql-11
systemctl start postgresql-11