#!/bin/sh
echo "Start Web Service Discovery host daemon (WSDD)"
echo "Parameter: ${WSSD_PARAMETER}"
#python3 wsdd.py ${WSSD_PARAMETER} &

echo ""
echo "Start /usr/bin/samba.sh from original docker image"

# If the SAMBA_PARAMETER environment variable is not set use the commandline parameter.
if [ -z "${SAMBA_PARAMETER}" ]
then
      SAMBA_PARAMETER=$@
fi

echo "Parameter: ${SAMBA_PARAMETER}"

#/usr/bin/samba.sh ${SAMBA_PARAMETER}
