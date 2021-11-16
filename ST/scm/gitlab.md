
configure GitLab for HA
=======================
https://forge.etsi.org/rep/help/administration/high_availability/gitlab.md

Configure PostgreSQL for HA for GitLab
======================================
https://forge.etsi.org/rep/help/administration/high_availability/database.md




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

gitlab-ctl reconfigure --> gitlab-ctl start --> gitlab-ctl status

gitlab-rails console -e production

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
