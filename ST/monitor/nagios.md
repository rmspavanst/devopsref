sudo apt-get install wget build-essential unzip openssl libssl-dev
sudo apt-get install apache2 php libapache2-mod-php php-gd libgd-dev
sudo adduser nagios
sudo groupadd nagcmd 
sudo usermod -a -G nagcmd nagios 
sudo usermod -a -G nagcmd www-data

wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.2.tar.gz
tar xzf nagios-4.4.2.tar.gz
cd nagios-4.4.2
sudo ./configure --with-command-group=nagcmd
sudo make all
sudo make install
sudo make install-init
sudo make install-config
sudo make install-commandmode
sudo cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/ 
sudo chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers

sudo vi /etc/apache2/conf-available/nagios.conf

ScriptAlias /nagios/cgi-bin "/usr/local/nagios/sbin"

<Directory "/usr/local/nagios/sbin">
   Options ExecCGI
   AllowOverride None
   Order allow,deny
   Allow from all
   AuthName "Restricted Area"
   AuthType Basic
   AuthUserFile /usr/local/nagios/etc/htpasswd.users
   Require valid-user
</Directory>


Alias /nagios "/usr/local/nagios/share"

<Directory "/usr/local/nagios/share">
   Options None
   AllowOverride None
   Order allow,deny
   Allow from all
   AuthName "Restricted Area"
   AuthType Basic
   AuthUserFile /usr/local/nagios/etc/htpasswd.users
   Require valid-user
</Directory>

sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo a2enconf nagios
sudo a2enmod cgi rewrite
sudo service apache2 restart


To install the required Nagios plugin, download the plugins 
wget http://www.nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
http://www.nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz
tar xzf nagios-plugins-2.2.1.tar.gz
cd nagios-plugins-2.2.1
sudo ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
sudo make
sudo make install
cd



x. Edit the nagios configuration file located at /usr/local/nagios/etc/nagios.cfg
sudo vi /usr/local/nagios/etc/nagios.cfg
Uncomment that line cfg_dir=/usr/local/nagios/etc/servers

sudo mkdir /usr/local/nagios/etc/servers
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
sudo service nagios start
sudo systemctl enable nagios


Access Nagios with http://MasterIP/nagios/
user id nagiosadmin & password


Install apache2 on the client host and make sure it's running
Add the host and service definitions in the master machine to monitor HTTP service
Restart the Nagios service on the master node
Refresh the Nagios page and check if the newly added host is available under monitoring as below

1.	Add a host to Nagios master configuration for monitoring 
a.	Install apache2 on client host and make sure its running 
b.	Add the host and service definitions in the master machine to monitor HTTP service 
c.	Restart the Nagios service on master node 
d.	Refresh the Nagios page and check if newly added host is available under monitoring as below

Solution: Here we will add monitoring Apache HTTP service on remote client: 
1.	Perform following steps on target machine that you need to be monitored by Nagios 
a.	Login to target host as ubuntu user and Install apache web server on the client machine 
sudo su  - ubuntu 
sudo apt update
sudo apt install apache2
sudo systemctl status apache2
sudo systemctl start apache2
http://ClientIP

2.	Add the host and service definitions in the master machine 
a.	 Create the host config file with host and service definitions.
sudo vi /usr/local/nagios/etc/servers/hosts.cfg
root@mastre:~# cat /usr/local/nagios/etc/servers/hosts.cfg
## Default Linux Host Template ##

define host{
name                    linux-box               ; Name of this template
use                     generic-host            ; Inherit default values
check_period            24x7
check_interval          5
retry_interval          1
max_check_attempts      10
check_command           check-host-alive
notification_period     24x7
notification_interval   30
notification_options    d,r
contact_groups          admins
register                0                        ; DONT REGISTER THIS - ITS A TEMPLATE
}

## Default
define host{
use                     linux-box               ; Inherit default values from a template
host_name               slave1                  ; The name we're giving to this server
alias                   ubuntu 18               ; A longer name for the server
address                 172.31.8.245            ;3.21.44.13   ; IP address of Remote Linux host
}

define service {
use                     generic-service         ; Inherit default values from a template
host_name               slave1
service_description     HTTP
check_command           check_http
}

or 
define service {
use                     generic-service         ; Inherit default values from a template
host_name               slave1
service_description     check-host-alive
check_command           check-host-alive
}



sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

sudo service nagios restart
