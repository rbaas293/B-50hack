#!/bin/bash
# Erases all user pages (WEB UI, BCL programs) in a Barionet 50
# Keeps the firmware
# (C)2009 Barix AG
#
# requires atftp

EMPTY=../update_rescue/empty.cob
SLEEP=0

if [ $# -lt 1 ] ; then 
	echo "(C)2009 Barix AG"
	echo "Usage: $0 <ip address>"
	echo "Erases all user pages (WEB UI, BCL programs) in a Barionet 50. Keeps the firmware."
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

for page in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ; do
	echo "Erasing WEB$page..."
	${TFTP} -l "${EMPTY}" -r "WEB$page" -p $1
	if [ ${SLEEP} -gt 0 ] ; then sleep ${SLEEP} ; fi
done
echo "All user pages erased in the device '$1'"
