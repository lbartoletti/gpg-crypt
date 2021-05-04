##################
### ENCRYPTION ###
##################

# Tar and Encrypt the given file or directory to a given recipient
# Usage: tgpg-encrypt file recipient
# Output: file.tar.gpg
function tgpg-encrypt() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 FILE/DIRECTORY RECIPIENT" >&2
    return 1
  fi

  tar -c `basename $1` | gpg --encrypt --recipient $2 -o `basename $1`.tar.gpg
}

# Tar and Encrypt the given file or directory.
# GPG will ask you the recipients
# Usage: tgpga-encrypt file recipient
# Output: file.tar.gpg
function tgpga-encrypt() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 FILE/DIRECTORY" >&2
    return 1
  fi

  tar -c `basename $1` | gpg --encrypt `basename $1`.tar.gpg
}

# Encrypt the given file or directory to a given recipient
# Usage: gpg-encrypt file recipient
# Output: file.gpg
function gpg-encrypt() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 FILE/DIRECTORY RECIPIENT" >&2
    return 1
  fi

  gpg --encrypt --recipient $2 -o `basename $1`.gpg "$1"
}

# Encrypt the given file or directory.
# GPG will ask you the recipients
# Usage: gpga-encrypt file
# Output: file.gpg
function gpga-encrypt() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 FILE/DIRECTORY" >&2
    return 1
  fi

  gpg --encrypt -o `basename $1`.gpg "$1"
}

##################
### DECRYPTION ###
##################

# Decrypt the given tar.gpg file
# Usage: gpg-decrypt myfile.tar.gpg
# myfile.tar.gpg was encrypted with tgpg-encrypt or tgpgr-encrypt
# output myfile
function tgpg-decrypt() {
  if [ "$#" -ne 1  ] || [[ "$1" != *.tar.gpg ]]; then
    echo "Usage: $0 FILE.tar.gpg" >&2
    return 1
  fi

  gpg --quiet --decrypt $1 | tar -x
}

# Decrypt the given gpg file
# Usage: gpg-decrypt myfile.gpg
# output myfile
function gpg-decrypt() {
  if [ "$#" -ne 1  ] || [[ "$1" != *.gpg ]]; then
    echo "Usage: $0 FILE.gpg" >&2
    return 1
  fi

  gpg --quiet --decrypt $1
}

#################
### SYMMETRIC ###
#################

# Symmetric encryption
# Usage: gpgs-encrypt myfile
# Will ask you a password
# output myfile.gpg
function gpgs-encrypt() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 FILE/DIRECTORY" >&2
    return 1
  fi

  gpg --output `basename $1`.gpg --symmetric $1
}

# Symmetric decryption
# Usage: gpgs-decrypt myfile.gpg
# Will ask you the password used to encrypt the file
# output myfile
function gpgs-decrypt() {
  if [ "$#" -ne 1  ] || [[ "$1" != *.gpg ]]; then
    echo "Usage: $0 FILE.gpg" >&2
    return 1
  fi
  out=${1}
  gpg --output `basename ${1:r}` --symmetric $1
}
