#!/bin/bash
# Erases the BCL page in a Barionet 50. Keeps everything else
# (C)2009 Barix AG
#
# requires atftp

EMPTY=../update_rescue/empty.cob
SLEEP=0

if [ $# -lt 1 ] ; then 
	echo "(C)2009 Barix AG"
	echo "Usage: $0 <ip address>"
	echo "Erases the BCL page in a Barionet 50. Keeps everything else."
	exit 0
fi


MAC=`uname | tr '[A-Z]' '[a-z]'| grep -o darwin`       # on MAC OS it is "darwin"
if [ "${MAC}" = "" ]; then		# Linux
	TFTP=atftp
	if [ ! -x `which ${TFTP}` ] ; then 
		echo "TFTP program not found!"
		exit 0
	fi
else					# MAC
	TFTP=../tools/atftp-mac-emul
fi

for page in 4 ; do
	echo "Erasing WEB$page..."
	${TFTP} -l "${EMPTY}" -r "WEB$page" -p $1
	if [ ${SLEEP} -gt 0 ] ; then sleep ${SLEEP} ; fi
done
echo "BCL page erased in the device '$1'"
