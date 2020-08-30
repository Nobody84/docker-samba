#!/bin/sh
echo "Start Web Service Discovery host daemon (WSDD)"
python3 wsdd.py &
echo ""
echo "Start /usr/bin/samba.sh from original docker image"
/usr/bin/samba.sh $@