xymon-client
============

This role enables users to install and configure xymon-client on their ubuntu
trusty hosts.

Requirements
------------

Platform requirements are listed in the metadata file.  Xymon best practice is
to hard-code the server's IP(s) rather than relying on DNS.  In this manner
Xymon can monitor DNS and will still work properly in the event of an DSN fail.

Examples
--------

1) Install and configure xymon-client based on defaults and variables.

	- hosts: all
	  roles:
	    - role: xymon-client

2) Install xymon-client and set some custom servers.

	- hosts: all
	  roles:
	    - role: xymon-client
              xymon_servers: [ "10.0.15.10" ]

License
-------

BSD

Author Information
------------------

- Greg Faust
