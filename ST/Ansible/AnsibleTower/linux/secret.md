ansible-vault create secret.yml
New Vault password: redhat
Confirm New Vault password: redhat


## Instead of entering the vault password through standard input, you can use a vault password file to store the vault password. You need to carefully protect this file using file permissions and other means.

 ansible-vault create --vault-password-file=vault-pass secret.yml

ansible-vault view secret1.yml
Vault password: secret
my_secret: "yJJvPqhsiusmmPPZdnjndkdnYNDjdj782meUZcw"

ansible-vault edit secret.yml

# Encrypting an Existing File
To encrypt a file that already exists, use the ansible-vault encrypt filename command. This command can take the names of multiple files to be encrypted as arguments.

ansible-vault encrypt secret1.yml secret2.yml
New Vault password: redhat
Confirm New Vault password: redhat
Encryption successful

ansible-vault decrypt secret1.yml --output=secret1-decrypted.yml
Vault password: redhat
Decryption successful

# Changing the Password of an Encrypted File
ansible-vault rekey secret.yml
Vault password: redhat
New Vault password: RedHat
Confirm New Vault password: RedHat
Rekey successful

# When using a vault password file, use the --new-vault-password-file option:

ansible-vault rekey \
> --new-vault-password-file=NEW_VAULT_PASSWORD_FILE secret.yml

ansible-playbook --vault-id @prompt site.yml

ansible-playbook --ask-vault-pass site.yml

 ansible-playbook --vault-password-file=vault-pw-file site.yml

 ansible-playbook \
> --vault-id one@prompt --vault-id two@prompt site.yml

