# gpg-crypt

`gpg-crypt` is a simple ZSH plugin to encrypt/decrypt files or directories in place.

# Usage:

`tgpg-encrypt FILE/DIRECTORY RECIPIENT`

Tar and encrypts a given file or directory into a `.gpg` file in the current directory.

`tgpg-decrypt FILE.gpg`

Decrypts and untar a given `.tar.gpg` file to the current directory.

`gpg-encrypt FILE RECIPIENT`

Encrypts a given file into a `.gpg` file in the current directory.

`gpg-decrypt FILE.gpg`

Decrypts a given `.gpg` file to the current directory.


`gpgs-encrypt FILE RECIPIENT`

Encrypts a given file into a `.gpg` file in the current directory.
You will need to supply a passphrase to encrypt the file.

`gpgs-decrypt FILE.gpg`

Decrypts a given `.gpg` file to the current directory.
You will need to supply a passphrase to decrypt the file.

