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

* `fman_rm-host.yml`
  - Usage: delete a host from Foreman (Satellite)
  - Variables to declare in AWX:
    - `fman_usr`: Foreman user (in a vault)
    - `fman_pwd`: Foreman password (in a vault)
    - `fman_url`: Foreman URL
    - `decom_host`: host to delete (in a survey)

## Authors

* **Quentin Petit** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
