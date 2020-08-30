#!/bin/sh
echo "Start Web Service Discovery host daemon (WSDD)"
python3 wsdd.py &
echo ""
echo "Sart /usr/bin/samba.sh for original docker image"
/usr/bin/samba.sh $@