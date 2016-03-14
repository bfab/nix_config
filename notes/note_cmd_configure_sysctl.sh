sudo sysctl -w kern.sysv.shmmax=11811160064
sudo sysctl -w kern.sysv.shmall=393216

sudo bash -c '
LINES_TO_RETAIN=`egrep -v "^\s*(kern.sysv.shmmax|kern.sysv.shmall|kern.sysv.shmmin|kern.sysv.shmmni|kern.sysv.shmseg|kern.maxfiles|kern.maxfilesperproc)=" /tmp/sysctl.conf`

cat >/etc/sysctl.conf<<-EOF
  kern.sysv.shmall=393216
  kern.sysv.shmmax=11811160064
  kern.sysv.shmmin=1    
  kern.sysv.shmmni=32
  kern.sysv.shmseg=8
  kern.maxfiles=256000
  kern.maxfilesperproc=256000
EOF

echo $LINES_TO_RETAIN >> /etc/sysctl.conf
'
