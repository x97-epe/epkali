#!/bin/sh
# Simple script to config Kali and Start OpenVPN

## Configure
VPN=world201-vpn_s3.ovpn

SECRETS_DIR=/secrets
VPN_CONF_DIR=/etc/openvpn
HOSTSFILE=/tmp/local_hosts

##Main
echo "Configure Hosts file"
if [ -r $HOSTSFILE ];then
	/bin/cat $HOSTSFILE >> /etc/hosts
else
	echo "Error: Hosts file $HOSTSFILE does NOT exist"
	exit 1
fi

echo "Configure OpenVPN"
if [ -d $SECRETS_DIR ];then
	echo "Copy $SECRETS_DIR to $VPN_CONF_DIR"
	/bin/cp $SECRETS_DIR/* $VPN_CONF_DIR
else
	echo "Error: Dir $SECRETS_DIR does NOT exist"
	exit 1
fi

if [ ! -r $VPN_CONF_DIR/$VPN ];then
	echo "Error: Cannot find VPN config file $VPN"
	exit 1
fi 

echo "OK: all settings completed"

echo "Starting OpenVPN"
cd $VPN_CONF_DIR
exec /usr/sbin/openvpn --config $VPN 

echo "OpenVPN started"
exit 0
