cat >> /etc/sysconfig/watchlog << EOF
WORD="ALERT"
LOG=/var/log/watchlog.log
EOF
cp /var/log/boot.log /var/log/watchlog.log
cat >> /var/log/watchlog.log << EOF
"ALERT"
EOF
cp /home/vagrant/conf_files/watchlog.sh /opt/watchlog.sh
chmod +x /opt/watchlog.sh
cp /home/vagrant/conf_files/watchlog.service /etc/systemd/system/watchlog.service
cp /home/vagrant/conf_files/watchlog.timer /etc/systemd/system/watchlog.timer
systemctl start watchlog.timer
yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y
cp /home/vagrant/conf_files/spawn-fcgi /etc/sysconfig/spawn-fcgi
cp /home/vagrant/conf_files/spawn-fcgi.service /etc/systemd/system/spawn-fcgi.service
systemctl start spawn-fcgi
cp /home/vagrant/conf_files/httpd.service /usr/lib/systemd/system/httpd.service
cp /home/vagrant/conf_files/httpd-first /etc/sysconfig/httpd-first
cp /home/vagrant/conf_files/httpd-second /etc/sysconfig/httpd-second
rm -rf /etc/httpd/conf/httpd.conf
cp /home/vagrant/conf_files/first.conf /etc/httpd/conf/first.conf
cp /home/vagrant/conf_files/second.conf /etc/httpd/conf/second.conf
systemctl start httpd@first
systemctl start httpd@second