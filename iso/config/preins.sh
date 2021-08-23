if ls /cdrom/netping/deb/zabbix/ | grep zabbix-release*
then
curtin in-target --target=/target -- apt install -y /cdrom/netping/deb/pgsql/*.deb
curtin in-target --target=/target -- apt install -y /cdrom/netping/deb/zabbix/*.deb
cp /cdrom/netping/zabbix/config/zabbix_server.conf /target/etc/zabbix/
cp /cdrom/netping/zabbix/config/php-fpm.conf /target/etc/zabbix/
cp /cdrom/netping/zabbix/config/zabbix.conf.php /target/etc/zabbix/web/zabbix.conf.php
cp /cdrom/netping/zabbix/config/nginx.conf /target/etc/zabbix/nginx.conf
rm -f /target/etc/nginx/sites-enabled/default
rm /target/lib/systemd/system/zabbix-server.service
cp /cdrom/netping/zabbix/config/zabbix-server.service /target/lib/systemd/system/zabbix-server.service
rm /target/lib/systemd/system/zabbix-agent.service
cp /cdrom/netping/zabbix/config/zabbix-agent.service /target/lib/systemd/system/zabbix-agent.service
ln -s /target/lib/systemd/system/zabbix-server.service /target/etc/systemd/system/multi-user.target.wants/zabbix-server.service
cp -r /cdrom/netping/zabbix/sql/* /target/var/lib/postgresql/12/main/
awk -F":" '{if ($1=="postgres") system("chown -R " $3":"$4 " /target/var/lib/postgresql/12/main/") }' /target/etc/passwd
chmod -R u+rw /target/var/lib/postgresql/12/main/
else echo "no zabbix"
fi
