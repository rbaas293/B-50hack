cd ..
LOAD=load_mac
MAC=`echo ${OSTYPE} | tr '[A-Z]' '[a-z]'| grep -o darwin`  # on MAC OS it is "darwin"
if [ "${MAC}" = "" ]; then
# assume linux
LOAD=load_lin
LINUX=`echo ${OSTYPE} | tr '[A-Z]' '[a-z]'| grep -o linux`
if [ "${LINUX}" = "" ]; then
echo "${LOAD} not supported on this (${OSTYPE}) platform"
exit 1
fi
fi
chmod a+x linux_mac/${LOAD} 
linux_mac/${LOAD} -g compound.bin bn50.rom 0xc000 bario50web.cob 0xc100 barionetbcl.cob 0xc400 sg.bin 0xdc00 bclio.bin 0xde00
