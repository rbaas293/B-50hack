#!/bin/bash

CPCRLF=../tools/cpcrlf

DST_PAGE=WEB4
SRC_DIR=serial_io_tunnel
COB=barionetbcl.cob
BAS_FILE="barionet.bas"


MAC=`uname | tr '[A-Z]' '[a-z]'| grep -o darwin`       # on MAC OS it is "darwin"
if [ "${MAC}" = "" ]; then		# Linux
	BPKG=../tools/bpkg-static-linux-x86
	TOKENIZER=../tools/tokenizer-static-linux-x86
	TFTP=atftp
else					# MAC
	BPKG=../tools/bpkg-mac-x86
	TOKENIZER=../tools/tokenizer-mac-x86
	TFTP=../tools/atftp-mac-emul
fi


if [ "$1" = "-h" ] ; then 
	echo -e "Barionet 50 compile tool, (c)2009 Barix AG\nUsage: $0 [<ip_address>]\nBuilds ${COB} and optionally uploads to the device via TFTP.\nRequires dosemu installed." ; 
	exit 0 
fi

#copy 
${CPCRLF} -r ${SRC_DIR} bla

#tokenize
cd bla
if ../${TOKENIZER} barionet50 ${BAS_FILE} ; then : ; else echo "ERROR - TOKENIZER REPORTS FAILURE" ; fi
cd ../
rm -f bla/*.bak bla/*.BAK

#create COB
${BPKG} /o ${COB} /d bla
rm -rf bla
echo

#upload
if [ $# -ge 1 ] ; then
	${TFTP} -l ${COB} -r ${DST_PAGE} -p $1
fi


