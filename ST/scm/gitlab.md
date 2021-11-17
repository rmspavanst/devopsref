





sudo dnf install -y curl policycoreutils openssh-server perl
# Enable OpenSSH server daemon if not enabled: sudo systemctl status sshd
sudo systemctl enable sshd
sudo systemctl start sshd
# Check if opening the firewall is needed with: sudo systemctl status firewalld
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo systemctl reload firewalld

sudo dnf install postfix
sudo systemctl enable postfix
sudo systemctl start postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
or
# download the pkg on https://packages.gitlab.com/gitlab/gitlab-ce
rpm -i  gitlab-ce-14.4.0-ce.0.el7.x86_64.rpm

apt-get install gitlab-ee

Set the port in /etc/gitlab/gitlab.rb
external_port "8888"

Then run reconfigure:
gitlab-ctl reconfigure




Set port in /var/opt/gitlab/gitlab-rails/etc/gitlab.yml
production: &base
  #
  # 1. GitLab app settings
  # ==========================

  ## GitLab settings
  gitlab:
    ## Web server settings (note: host is the FQDN, do not include http://)
    host: gitlab.blitting.com
    port: 8888
    https: false

Then restart gitlab

gitlab-ctl stop
gitlab-ctl start

cd /etc/gitlab/
vi gitlab.rd
externan_url: localhost:8888


gitlab-ctl reconfigure --> gitlab-ctl start --> gitlab-ctl status



gitlab-rails console -e production

to create user:
User.create!(username: "test", email: "test@example.com", password: "test", password_confirmation: "test", is_admin: true, is_moderator: true)



to reset root password

user = User.where(id: 1).first user.password ='passw0rd' user.password_confirmation ='passw0rd' user.save!

or

sudo gitlab-rake "gitlab:password:reset[johndoe]"

http://10.170.1.94/


# PostgreSQL connection details
gitlab_rails['db_adapter'] = 'postgresql'
gitlab_rails['db_encoding'] = 'utf8'
gitlab_rails['db_host'] = '20.40.99.114' 
gitlab_rails['db_port'] = 5432
gitlab_rails['db_username'] = 'gitlab'
gitlab_rails['db_password'] = 'gitlab******'



ssl:
-----

mksir /etc/gitlab/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out git.example.com.crt -keyout git.example.com.key -subj "/CN=git.example.com/O=git.example.com"

cp /etc/gitlab/ssl/git.example.com.crt /etc/gitlab/trusted-certs/

Then configure SSL settings on your /etc/gitlab/gitlab.rb file. First, change external URL from http to https

external_url 'https://git.example.com'

Under the ## GitLab NGINX section, enable Nginx and provide SSL key and certificate paths.

nginx['enable'] = true
nginx['client_max_body_size'] = '250m'
nginx['redirect_http_to_https'] = true

nginx['ssl_certificate'] = "/etc/gitlab/ssl/git.example.com.key"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/git.example.com.crt"
nginx['ssl_protocols'] = "TLSv1.1 TLSv1.2"


sudo gitlab-ctl reconfigure



to connect external PGSQL DB--- 
----------------------------------------

6. Database
In GitLab 12.1 and later, only PostgreSQL is supported. In GitLab 14.0 and later, we require PostgreSQL 12+.
Install the database packages.

For Ubuntu 20.04 and later:

sudo apt install -y postgresql postgresql-client libpq-dev postgresql-contrib

For Ubuntu 18.04 and earlier, the available PostgreSQL doesn’t meet the minimum version requirement. You need to add PostgreSQL’s repository:

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt update
sudo apt -y install postgresql-12 postgresql-client-12 libpq-dev

Verify the PostgreSQL version you have is supported by the version of GitLab you’re installing:

psql --version

Start the PostgreSQL service and confirm that the service is running:

sudo service postgresql start
sudo service postgresql status

Create a database user for GitLab:

sudo -u postgres psql -d template1 -c "CREATE USER git CREATEDB;"

Create the pg_trgm extension:

sudo -u postgres psql -d template1 -c "CREATE EXTENSION IF NOT EXISTS pg_trgm;"

Create the btree_gist extension (required for GitLab 13.1+):

sudo -u postgres psql -d template1 -c "CREATE EXTENSION IF NOT EXISTS btree_gist;"

Create the GitLab production database and grant all privileges on the database:

sudo -u postgres psql -d template1 -c "CREATE DATABASE gitlabhq_production OWNER git;"

Try connecting to the new database with the new user:

sudo -u git -H psql -d gitlabhq_production

Check if the pg_trgm extension is enabled:

SELECT true AS enabled
FROM pg_available_extensions
WHERE name = 'pg_trgm'
AND installed_version IS NOT NULL;

If the extension is enabled this produces the following output:

enabled
---------
 t
(1 row)

Check if the btree_gist extension is enabled:

SELECT true AS enabled
FROM pg_available_extensions
WHERE name = 'btree_gist'
AND installed_version IS NOT NULL;

If the extension is enabled this produces the following output:

enabled
---------
 t
(1 row)

Quit the database session:

gitlabhq_production> \q
