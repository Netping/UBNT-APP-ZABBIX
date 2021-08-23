cd /tmp
rsync -vr ./isogit/iso/ ./iso/netping/zabbix/
#rsync -vr ./isogit/config.sh ./iso/netping/zabbix/
rm -rf /tmp/isogit
apt install /tmp/iso/netping/zabbix/zabbix-release_5.2-1+ubuntu20.04_all.deb
#zabbix
apt clean
apt install --download-only -y zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-nginx-conf zabbix-agent
cp /var/cache/apt/archives/*.deb ./iso/netping/deb/zabbix/
mv /tmp/iso/netping/zabbix/zabbix-release_*_all.deb /tmp/iso/netping/deb/zabbix/
#postgresql 
apt clean
apt install --download-only -y postgresql
cp /var/cache/apt/archives/*.deb ./iso/netping/deb/pgsql
