

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

gitlab-ctl reconfigure gitlab-ctl start gitlab-ctl status

gitlab-rails console -e production

to reset root password

user = User.where(id: 1).first user.password ='passw0rd' user.password_confirmation ='passw0rd' user.save!

or

sudo gitlab-rake "gitlab:password:reset[johndoe]"

http://10.170.1.94/