# awx_rhel-lifecycle
Management of RHEL servers' lifecycle with AWX Project or Ansible Tower

## Playbooks and comments:

* `init.yml`
  - Usage: install the Foreman collection from Ansible Galaxy      
  - No variable needs to be declared for this playbook 
  - **Note**: AWX 9.1.0.0 uses Ansible 2.8.5 meaning that we cannot install collections with the ansible-galaxy command. It will be necessary to remove the mazer dependancy and replace mazer by ansible-galaxy when Ansible will be updated to 2.9

* `cdn_unregister.yml`
  - Usage: unregister a RHEL server from Red Hat CDN     
  - Variables to declare in AWX (Tower):
    - `decom_host`: host to unregister from RH CDN (in a survey)      

* `dns_add-entry.yml`
  - Usage: Add DNS entry to libvirt dnsmasq
  - Variables to declare in AWX:
    - `dns_srv`: DNS server
    - `clt_ipadd`: IP address of the client that will be added
    - `clt_fqdn`: FQDN of the client that will be added

* `dns_rm-entry.yml`
  - Usage: Remove DNS entry to libvirt dnsmasq
  - Variables to declare in AWX:
    - `dns_srv`: DNS server
    - `decom_host`: Hostname of the client that will be removed

* `fman_rm-host.yml`
  - Usage: delete a host from Foreman (Satellite)
  - Variables to declare in AWX:
    - `fman_usr`: Foreman user (in a vault)
    - `fman_pwd`: Foreman password (in a vault)
    - `fman_url`: Foreman URL
    - `decom_host`: host to delete (in a survey)

## Workflow Template

Here are some examples of the possible workflow templates:
* VM decommission:
```
+----------------+    +--------------+    +--------------+
| cdn_unregister | -> | fman_rm-host | -> | dns_rm-entry |
+----------------+    +--------------+    +--------------+
```

## Authors

* **Quentin Petit** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
