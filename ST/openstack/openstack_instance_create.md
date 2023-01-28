## Step)  Test and verify OpenStack installation by launching an instance

## https://help.dreamhost.com/hc/en-us/articles/216511617-How-to-launch-an-instance-using-the-OpenStack-CLI

# https://computingforgeeks.com/install-openstack-victoria-on-centos/

### CentOS 8 Stream Linux x86_64 ###
wget https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20220913.0.x86_64.qcow2

### CentOS 9 Stream Linux x86_64 ###
wget https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-20220919.0.x86_64.qcow2

Before launching an instance in openstack, first we must create networks and router and glance image. So, let’s first create external network in admin tenant using following neutron commands,

[root@openstack ~]# source keystonerc_admin

# openstack service list
[root@openstack ~(keystone_admin)]# neutron net-create external_network --provider:network_type flat --provider:physical_network extnet --router:external

Now add a subnet of your flat network to external network by running following neutron command.

[root@openstack ~(keystone_admin)]# neutron subnet-create --name public_subnet --enable_dhcp=True --allocation-pool=start=192.168.1.210,end=192.168.1.230 --gateway=192.168.1.1 external_network 192.168.1.0/24


Create a router by executing the following neutron command and set its gateway using external network

[root@openstack ~(keystone_admin)]# neutron router-create dev-router
[root@openstack ~(keystone_admin)]# neutron router-gateway-set dev-router external_network


Create private network and attach a subnet to it. Run the following neutron command,

[root@openstack ~(keystone_admin)]# neutron net-create pvt_net
[root@openstack ~(keystone_admin)]# neutron subnet-create --name pvt_subnet pvt_net 10.20.1.0/24


Add pvt_net interface to router “dev_router” using beneath neutron command,

[root@openstack ~(keystone_admin)]# neutron router-interface-add dev-router  pvt_subnet

Now Download Cirros image and then upload it to glance

[root@openstack ~(keystone_admin)]# wget http://download.cirros-cloud.net/0.5.1/cirros-0.5.1-x86_64-disk.img
[root@openstack ~(keystone_admin)]# openstack image create --disk-format qcow2 --container-format bare --public --file cirros-0.5.1-x86_64-disk.img  cirros


Now head back to horizon dashboard and verify the network topology