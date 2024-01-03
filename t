This is the AAP installer inventory file
Please consult the docs if you're unsure what to add
For all optional variables please consult the included README.md
This section is for your AAP Controller host(s)
If one of these components is not being installed, comment out the <fqdn> line.
-------------------------------------------------
This section is for your AAP Automation Hub host(s)
-----------------------------------------------------
This section is for your AAP EDA Controller host(s)
-----------------------------------------------------
This section is for the AAP database(s)
-----------------------------------------
Uncomment the lines below and amend appropriately if you want AAP to install and manage the postgres databases
Leave commented out if you intend to use your own external database and just set appropriate _pg_hosts vars
see mandatory sections under each AAP component
Common variables needed for installation
----------------------------------------
If using the online (non-bundled) installer, you need to set RHN registry credentials
If using the bundled installer, you need to alter defaults by using:
AAP Controller - mandatory
------------------------------
AAP Controller - optional
------------------------------
To use the postinstall feature you need to set these variables
AAP Automation Hub - mandatory
------------------------------
AAP Automation Hub - optional
-----------------------------
AAP EDA Controller - mandatory
------------------------------
AAP EDA Controller - optional
-----------------------------