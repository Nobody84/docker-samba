#!/bin/sh
echo "Start Web Service Discovery host daemon (WSDD)"

if [ "${PRINT_PARAMETER}" = "yes" ]
then
  echo "Parameter: ${WSDD_PARAMETER}"
fi

python3 wsdd.py ${WSDD_PARAMETER} &

echo ""
echo "Start /usr/bin/samba.sh from original docker image"

# If the SAMBA_PARAMETER environment variable is not set use the commandline parameter.
if [ -z "${SAMBA_PARAMETER}" ]
then
  SAMBA_PARAMETER="${$@//\\\"/\"}"
fi

if [ "${PRINT_PARAMETER}" = "yes" ]
then
  echo "Parameter: ${SAMBA_PARAMETER}"
fi

/usr/bin/samba.sh ${SAMBA_PARAMETER}
