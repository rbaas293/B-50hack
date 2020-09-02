#!/bin/bash

CPCRLF=../tools/cpcrlf
APPNAME=bario50web
DEST=${APPNAME}.cob
DEST_PAGE=WEB1

MAC=`uname | tr '[A-Z]' '[a-z]'| grep -o darwin`       # on MAC OS it is "darwin"
if [ "${MAC}" = "" ]; then		# Linux
	BPKG=../tools/bpkg-static-linux-x86
	TFTP=atftp
else					# MAC
	BPKG=../tools/bpkg-mac-x86
	TFTP=../tools/atftp-mac-emul
fi

${CPCRLF} -r ${APPNAME} bla

${BPKG} /o ${APPNAME}.cob /d bla
rm -rf bla
echo

if [ $# -ge 1 ] ; then
	${TFTP} -l "${DEST}" -r ${DEST_PAGE} -p $1
fi
