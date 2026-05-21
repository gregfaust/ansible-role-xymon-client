xymon-client
============

This role installs and configures the xymon-client monitoring agent on Ubuntu hosts.

Requirements
------------

- Ansible >= 2.15
- Ubuntu (see meta/main.yml for supported versions)

Xymon best practice is to hard-code the server's IP(s) rather than relying on
DNS, so that Xymon can still monitor DNS even during DNS failures.

Role Variables
--------------

| Variable              | Default            | Description                         |
|-----------------------|--------------------|-------------------------------------|
| `xymon_pkg_name`      | `xymon-client`   | Package name to install             |
| `xymon_pkg_state`     | `present`        | Package state                       |
| `xymon_service_name`  | `xymon-client`   | Service name                        |
| `xymon_service_state` | `started`        | Desired service state               |
| `xymon_service_enabled` | `yes`          | Enable service on boot              |
| `xymon_servers`       | `["10.0.15.10"]` | List of Xymon server IPs            |
| `xymon_validate`      | `false`          | Run post-install validation checks  |

Validation runs four checks (package installed, config file exists, service
running, service enabled) and fails the playbook if any check does not pass.
Set `xymon_validate: true` to enable it.

Examples
--------

1) Install and configure xymon-client with defaults.

```yaml
- hosts: all
  roles:
    - role: xymon-client
```

2) Set custom Xymon servers.

```yaml
- hosts: all
  roles:
    - role: xymon-client
      xymon_servers:
        - 10.0.15.10
        - 10.0.15.11
```

3) Run validation after installation.

```yaml
- hosts: all
  roles:
    - role: xymon-client
      xymon_validate: true
```

License
-------

BSD

Author Information
------------------

- Greg Faust
