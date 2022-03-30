
## https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/objectdefinitions.html#:~:text=check_command%3A,assume%20the%20host%20is%20down  ##

## https://www.sbarjatiya.com/notes_wiki/index.php/Configuring_remote_service_checks_using_nagios



# Define a service to check TCP on the remote machine.
define service{
        use                             local-service         ; Name of service template to use
        host_name                       infor1
        service_description             tcp
        check_command                   check_tcp! -f ok -I 192.168.1.100 -p 80
        notifications_enabled           0
        }

# 'check_tcp' command definition
define command{
        command_name    check_tcp
        command_line    $USER1$/check_tcp -H $HOSTADDRESS$ -p $ARG1$ $ARG2$
        }

# Define a service to check TCP on the remote machine.
define service{
        use                             local-service         ; Name of service template to use
        host_name                       iis-server1
        service_description             tcp
        check_command                   check_tcp!-H 192.168.9.100 -p 80
        notifications_enabled           0
        }


define host {
   use linux-server
   host_name ubuntu_host
   alias Ubuntu Host
   address 192.168.1.10
   register 1
}
define service {
   host_name ubuntu_host
   service_description PING
   check_command check_ping!100.0,20%!500.0,60%
   max_check_attempts 2
   check_interval 2
   retry_interval 2
   check_period 24x7
   check_freshness 1
   contact_groups admins
   notification_interval 2
   notification_period 24x7
   notifications_enabled 1
   register 1
}






define host{
host_name	host_name
alias	alias
display_name	display_name
address	address
parents	host_names
hostgroups	hostgroup_names
check_command	command_name
initial_state	[o,d,u]
max_check_attempts	#
check_interval	#
retry_interval	#
active_checks_enabled	[0/1]
passive_checks_enabled	[0/1]
check_period	timeperiod_name
obsess_over_host	[0/1]
check_freshness	[0/1]
freshness_threshold	#
event_handler	command_name
event_handler_enabled	[0/1]
low_flap_threshold	#
high_flap_threshold	#
flap_detection_enabled	[0/1]
flap_detection_options	[o,d,u]
process_perf_data	[0/1]
retain_status_information	[0/1]
retain_nonstatus_information	[0/1]
contacts	contacts
contact_groups	contact_groups
notification_interval	#
first_notification_delay	#
notification_period	timeperiod_name
notification_options	[d,u,r,f,s]
notifications_enabled	[0/1]
stalking_options	[o,d,u]
notes	note_string
notes_url	url
action_url	url
icon_image	image_file
icon_image_alt	alt_string
vrml_image	image_file
statusmap_image	image_file
2d_coords	x_coord,y_coord
3d_coords	x_coord,y_coord,z_coord
   	}
Example Definition:

define host{
	host_name			bogus-router
	alias				Bogus Router #1
	address				192.168.1.254
	parents				server-backbone
	check_command			check-host-alive
	check_interval			5
	retry_interval			1
	max_check_attempts		5
	check_period			24x7
	process_perf_data		0
	retain_nonstatus_information	0
	contact_groups			router-admins
	notification_interval		30
	notification_period		24x7
	notification_options		d,u,r
	}


define hostgroup{
	hostgroup_name		novell-servers
	alias			Novell Servers
	members			netware1,netware2,netware3,netware4
	}


define service{
	host_name		linux-server
	service_description	check-disk-sda1
	check_command		check-disk!/dev/sda1
	max_check_attempts	5
	check_interval	5
	retry_interval	3
	check_period		24x7
	notification_interval	30
	notification_period	24x7
	notification_options	w,c,r
	contact_groups		linux-admins
	}


define servicegroup{
	servicegroup_name	dbservices
	alias			Database Services
	members			ms1,SQL Server,ms1,SQL Server Agent,ms1,SQL DTC
	}


define contact{
	contact_name                    jdoe
	alias                           John Doe
	host_notifications_enabled		1
	service_notifications_enabled	1
	service_notification_period     24x7
	host_notification_period        24x7
	service_notification_options    w,u,c,r
	host_notification_options       d,u,r
	service_notification_commands   notify-by-email
	host_notification_commands      host-notify-by-email
	email			jdoe@localhost.localdomain
	pager			555-5555@pagergateway.localhost.localdomain
	address1			xxxxx.xyyy@icq.com
	address2			555-555-5555
	can_submit_commands	1
	}


define servicedependency{
	host_name			WWW1
	service_description		Apache Web Server
	dependent_host_name		WWW1
	dependent_service_description	Main Web Site
	execution_failure_criteria	n
	notification_failure_criteria	w,u,c
	}

define serviceescalation{
	host_name		nt-3
	service_description	Processor Load
	first_notification	4
	last_notification	0
	notification_interval	30
	contact_groups		all-nt-admins,themanagers
	}

