#!/bin/sh
if [ -z ${FTP_PASSWORD} ]; then
  PASSWORD=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c${1:-8};echo;)
  echo "Generated password for user 'files': ${FTP_PASSWORD}"
fi
# set ftp user password
echo "files:${FTP_PASSWORD}" |/usr/sbin/chpasswd
chown files:files /home/files/ -R

if [ -z $1 ]; then
  /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
else
  $@
fi