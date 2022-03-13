# Go or No Go Switchover activity

## Running pre-requisities

Pre-requisities will be running in two phase:
<ul>
<li> Check Connectivity - P7</li>
<li>P8-P10 will be ran manually in between</li>
<li>Updating DB, stoppign jboss etc - P11-P16</li>
</ul>

Run the following sample command to check the connectivity
```shell
# The default path of connectivity_script_file is connectivity_script_file
ansible-playbook  check_connectivity.yaml -i local_inventory

# In case different location has to be provided then use the following command:

ansible-playbook  check_connectivity.yaml -i local_inventory -e \
'{
"connectivity_script_file":"/a/b/c/mypath.sh"
}'
```