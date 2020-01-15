# awx_linux-lifecycle
Management of Linux servers' lifecycle with AWX Project or Ansible Tower

## Playbooks and comments:

* `init.yml`
  - Use: install the Foreman collection from Ansible Galaxy      
  - No variable needs to be declared for this playbook 
  - **Note**: AWX 9.1.0.0 uses Ansible 2.8.5 meaning that we cannot install collections with the ansible-galaxy command. It will be necessary to remove the mazer dependancy and replace mazer by ansible-galaxy when Ansible will be updated to 2.9

* `cdn_unregister.yml`
  - Use: unregister a RHEL server from Red Hat CDN     
  - Variables to declare in AWX (Tower):
    - `decom_host`: host to unregister from RH CDN (in a survey)      

* `cfg_el-workenv.yml`
  - Use: configuration of work environment for Enterprise Linux servers
  - No variable needs to be declared for this playbook

* `deb_update.yml`
  - Use: check and apply available updates on Debian-like hosts
  - Variables to declare in AWX:
    - `deb_hosts`: Debian-like hosts on which to apply this playbook

* `dns_add-entry.yml`
  - Use: add DNS entry to named
  - Variables to declare in AWX:
    - `dns_srv`: DNS server
    - `ip_add`: IP address of the client that will be added (in a survey)
    - `new_host`: FQDN of the client that will be added (in a survey)

* `dns_rm-entry.yml`
  - Use: remove DNS entry to named
  - Variables to declare in AWX:
    - `dns_srv`: DNS server
    - `net_add`: Network address on which is the client
    - `decom_host`: Hostname of the client that will be removed (in a survey)

* `fman_add-host.yml`
  - Use: create a host through Foreman (Satellite)
  - Variables to declare in AWX:
    - `fman_srv`: Foreman server
    - `fman_usr`: Foreman admin user (in a vault)
    - `fman_pwd`: Foreman admin password (in a vault)
    - `hostgroup`: Hostgroup of the new host
    - `organization`: Host organization
    - `location`: Host location
    - `ip_add`: Host IP address
    - `new_host`: Host Name

* `fman_rm-host.yml`
  - Use: delete a host from Foreman (Satellite)
  - Variables to declare in AWX:
    - `fman_usr`: Foreman user (in a vault)
    - `fman_pwd`: Foreman password (in a vault)
    - `fman_url`: Foreman URL
    - `decom_host`: host to delete (in a survey)

* `rpm_update.yml`
  - Use: check and apply available updates on Enterprise Linux servers
  - Variables to declare in AWX:
    - `el_hosts`: Enterprise Linux hosts on which to apply this playbook

## Workflow Templates

Here are some examples of the possible workflow templates:
* VM decommission:
```
+----------------+    +--------------+    +--------------+
| cdn_unregister | -> | fman_rm-host | -> | dns_rm-entry |
+----------------+    +--------------+    +--------------+
```

* VM creation:
```
+---------------+    +---------------+
| fman_add-host | -> | dns_add-entry |
+---------------+    +---------------+
```

## Other Files

* `bash_aliases`
  - Description: useful aliases

* `stretch.sh`
  - Use: bash script to add, commit and push to git
  - Usage:
```
stretch.sh [-h] [FILES] [COMMENT]

arguments:
  -h, --help      show this help message and exit
  FILES           files to add to git
  COMMENT         commit message

example:
  ./stretch.sh "README.md rpm_update.yml" "Update descriptions"
```

* `vimrc`
  - Description: vim configuration

## Authors

* **Quentin Petit** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
