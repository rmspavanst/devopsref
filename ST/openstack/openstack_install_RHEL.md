## Steps for Installing Open Stack PackStack on Centos/RHEL


sudo setenforce 0
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager


yum autoremove epel-release  
yum autoremove openstack-packstack  
yum clean all

yum search centos-release-openstack

yum install -y centos-release-openstack-stein.noarch
yum update -y
yum install -y openstack-packstack
packstack --allinone

Find the password for admin account:

cat keystonerc_admin

# https://www.devopsschool.com/tutorial/openstack/install-openstack-in-rhel-centos7.html
# https://www.rdoproject.org/install/packstack/
# https://www.linuxtechi.com/install-openstack-centos-8-with-packstack/ (## working)
# https://computingforgeeks.com/install-openstack-victoria-on-centos/
# https://haihh2.notion.site/1-Install-OpenStack-on-RHEL-8-VMware-all-in-one-3f4b6809d0a14c318de3b39efc0a91d1#c04a7090b7154c7696ffec4b2be387a7

# https://www.edureka.co/community/64660/how-do-i-install-openstack-in-rhel-7-centos-7








Redhat Openstack:
==================

# https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/standalone_deployment_guide/examples

# https://achchusnulchikam.medium.com/how-to-install-all-in-one-red-hat-openstack-platform-16-proof-of-concept-rhosp-e917b5b58e4b

# https://egallen.com/openstack-16.1/
# https://www.linkedin.com/pulse/how-deploy-openstack-16-train-platform-using-packstack-goran-jumi%C4%87/

# https://github.com/rh-telco-tigers/OSP16.2-AIO

# https://www.juniper.net/documentation/en_US/contrail20/topics/topic-map/setting-up-contrail-rhosp-introduction.html

# https://hackmd.io/@rh-openstack-ci/rki7LxDP8

subscription-manager clean

yum clean all

subscription-manager unregister

[root@aio ~]# cat /etc/resolv.conf
# Generated by NetworkManager
nameserver 168.95.1.1
nameserver 192.168.1.1




Openstack vagarant
===================

# https://www.openstackfaq.com/openstack-setup-all-in-one/

Docker:
=========

https://serverhealers.com/blog/deploying-openstack-using-docker-container-with-kolla-and-hyper-v

## Terraform:

https://computingforgeeks.com/deploy-vm-instance-on-openstack-with-terraform/








Note for RHEL: Although it is expected that RDO works fine on RHEL, it is currently not tested in RHEL OS.

On RHEL 8:

$ sudo dnf install -y https://www.rdoproject.org/repos/rdo-release.el8.rpm
$ sudo dnf update -y
$ subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
$ sudo dnf install -y openstack-packstack
$ sudo packstack --allinone

============================================================================================================================

## Step 0: Prerequisites:

Software
CentOS Stream 8 is the minimum recommended version, or the equivalent version of one of the RHEL-based Linux distributions such as Red Hat Enterprise Linux, Scientific Linux, and so on. Packages are provided for x86_64, aarch64 and ppc64le architectures although most of the testing is done on x86_64.

Hardware
Machine with at least 16GB RAM, processors with hardware virtualization extensions, and at least one network adapter.

Hostname
Name the host with a fully qualified domain name rather than a short-form name to avoid DNS issues with Packstack.

$ hostnamectl set-hostname cloud.scmgalaxy.lan

Network
If you plan on having external network access to the server and instances, this is a good moment to properly configure your network settings. A static IP address to your network card, and disabling NetworkManager are good ideas.

## On CentOS Stream 8/RHEL 8:

1. network-scripts is deprecated and not installed by default, so needs to be installed explicitly.

$ sudo dnf install network-scripts -y

2. Disable firewalld and NetworkManager

$ sudo systemctl disable firewalld
$ sudo systemctl stop firewalld
$ sudo systemctl disable NetworkManager
$ sudo systemctl stop NetworkManager
$ sudo systemctl enable network
$ sudo systemctl start network if notworks install $ dnf install network-scripts


## Step 1: Software repositories

On CentOS Stream 8, first you need to enable the powertools repository. Then, the Extras repository provides the RPM that enables the OpenStack repository. Extras is enabled by default on CentOS 8, so you can simply install the RPM to set up the OpenStack repository:

$ sudo dnf config-manager --enable powertools
$ sudo dnf install -y centos-release-openstack-yoga
On CentOS Stream 9, first you need to enable the crb. Then, the extras-common repository provides the RPM that enables the OpenStack repository. It is enabled by default on CentOS Stream 9, so you can simply install the RPM to set up the OpenStack repository:

$ sudo dnf config-manager --enable crb
$ sudo dnf install -y centos-release-openstack-zed
On RHEL 8, install the RDO repository RPM to setup the Openstack repository, then you must enable the codeready-builder option in subscription-manager:

$ sudo dnf install -y https://www.rdoproject.org/repos/rdo-release.el8.rpm
$ subscription-manager repo --enable codeready-builder-for-rhel-8-x86_64-rpms
Update your current packages:

$ sudo dnf update -y
Looking for an older version? See http://rdoproject.org/repos/ for the full listing.

## Step 2: Install Packstack Installer


$ sudo dnf install -y openstack-packstack


## Step 3: Disable selinux enforcing mode
There are known issues with selinux policies and rabbitmq in CentOS Stream 9. Disable selinux enforcing mode:

$ sudo setenforce 0


## Step 4: Run Packstack to install OpenStack
Packstack takes the work out of manually setting up OpenStack. It provides a set of options to specify the desired services and configurations for each installation. You can list all the available parameters using:

$ packstack --help
For a simple, single node OpenStack deployment with default options, run the following command:

$ sudo packstack --allinone
The Packstack command line interface accepts an answers file as a mechanism to specify the parameters. The base answers file can be created with:

$ packstack --gen-answer-file
Then can be used by using --answer-file option:

$ sudo packstack --answer-file=<path to the answers file>
If you have run Packstack previously, there will be a file in your home directory named something like packstack-answers-20130722-153728.txt You will probably want to use that file again, using the --answer-file option, so that any passwords you have already set (for example, mysql) will be reused.

The installer will ask you to enter the root password for each host node you are installing on the network, to enable remote configuration of the host so it can remotely configure each node using Puppet.

Once the process is complete, you can log in to the OpenStack web interface Horizon by going to http://$YOURIP/dashboard. The user name is admin. The password can be found in the file keystonerc_admin in the /root directory of the control node.



## Install Packages

subscription-manager register
subscription-manager attach
subscription-manager release --set=8.4
subscription-manager repos --disable=*
dnf install -y https://www.rdoproject.org/repos/rdo-release.el8.rpm
subscription-manager repos \
--enable=rhel-8-for-x86_64-baseos-rpms \
--enable=rhel-8-for-x86_64-appstream-rpms \
--enable=rhel-8-for-x86_64-highavailability-rpms \
--enable=rhel-8-for-x86_64-supplementary-rpms \
--enable=codeready-builder-for-rhel-8-x86_64-rpms
dnf update -y
dnf install -y network-scripts
systemctl enable --now network
systemctl stop NetworkManager 
systemctl disable NetworkManager
systemctl stop firewalld 
systemctl disable firewalld



subscription-manager repos \
--enable=rhel-8-for-x86_64-baseos-rpms \
--enable=rhel-8-for-x86_64-appstream-rpms \
--enable=codeready-builder-for-rhel-8-x86_64-rpms

sudo packstack --os-neutron-ml2-tenant-network-types=vxlan \
--os-neutron-l2-agent=openvswitch \
--os-neutron-ml2-type-drivers=vxlan,flat \
--os-neutron-ml2-mechanism-drivers=openvswitch \
--keystone-admin-passwd=P@ssw0rd \
--nova-libvirt-virt-type=kvm \
--provision-demo=n \
--cinder-volumes-create=n \
--os-heat-install=y \
--os-swift-storage-size=10G \
--gen-answer-file /root/answers.txt

sudo packstack --answer-file /root/answers.txt



export OS_CLOUD=standalone

/home/stack/.config/openstack/cloud.yaml

clouds:
  standalone:
    auth:
      auth_url: http://192.168.0.120:5000
      password: 8VuR83gNHKSwKabIfsCgI96xn
      project_domain_name: Default
      project_name: admin
      user_domain_name: Default
      username: admin
    cacert: ''
    identity_api_version: '3'
    region_name: regionOne


vi admin-openrc

1 export OS_USERNAME=admin
2 export OS_PASSWORD=123456
3 export OS_PROJECT_NAME=admin
4 export OS_USER_DOMAIN_NAME=Default
5 export OS_PROJECT_DOMAIN_NAME=Default
6 export OS_AUTH_URL=http://controller:35357/v3
7 export OS_IDENTITY_API_VERSION=3






