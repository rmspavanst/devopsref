# multinode deployment

1. Controller node (1-2 cpu, 8+GB RAM, 100gb storage, 1+NIC)
        neutro server
        nova api
        nova scheduler
        keystone all
        glance api
        glance registry
        cider api
        cider scheduler
        message queue
        database
2. Compute node (2-4+ cpu, 8+GB RAM, 100+GB Storage, 2+NIC)
        nova Compute
        neutron-*plugin agent
        hypervisor
3. Network node (1-2+cpu, 2+GB RAM, 50+GB Storage, 2+NIC)
        neutron-*plufin agent
        neutro-dhcp ahent
        neutron-l3 agent
        neutron-metering agent
4. Object Storage node (1-2+ cpu, 4+GB RAM, 100+GB Storage, 1+NIC)
        account service
        container service
        object service
        proxy
5. Block Storage node (1-2+ cpu, 2+GB RAM, 100+GB Storage, 1+NIC)
        cinder volume
        shared the filesystem service

# lab

==> Launch 2 nodes in virtual box and attach 2nic cards( 1 for bridge to access internet and another adaptor use for internal)
