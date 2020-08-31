'0101
' AIPHONE (R) RY-IP44
'
' OEM firmware for RY-IP44 AIPHONE Hardware devices.
'
' make "BA50_DEFAULT_APP=ryip44" b50_nd
'
' V1.00  AD 12.02.2013  ! fixed display of call-in destination tables 2,3,4.
'                       ! fixed bad call-in URI if first destination is empty/unchecked.
'                       ! fixed missing multiple check (1 to 20) destination TermID's.
' V1.01  AD 25.03.2013  c changed isipry8_uiappsetup.html with Aiphone copy.
'                       c changed fixed ip to 192.168.0.45, nm 255.255.255.0 in 
'                         config.bin.
' V2.00  AN 20.12.2014  ! added compatibility with IX and IPW-1A systems.
'						! renamed RY-IP44.
'						! took over uitemp.html for Aiphone system type usage and made IX default.
'						c changed fixed ip to 192.168.1.45 in config.bin.
' V2.01  AN 07.05.2015	! fixed bug with reading of linked IS IP addresses which affected door 
'						  release authorization. added ln194.
' V2.02  AN 13.05.2015  ! added Aiphone Firmware version line to uiupdate.html 
' V2.1   AN 01.08.2015  ! added app server functionality for IX Mobile
'						! added app server port to uitemp.html
' V2.2   DM 02.27.2019  ! added check for Relay output number on Contact Change, will ignore RY2.

dim ver$ 
ver$="2.2 02.27.2019"

syslog "AIPHONE RY-IP44 ver."+ver$+" starting..."
syslog "Station IP: "+sprintf$("%A",1)
syslog "markers: (i) info, (w) warning, (e) error, (-) debug"

dim nul$
'def
'def
'def
' DEBUG
'def
' else
' #define  syslog "(-) "+ nul$=#1

'def
'def
dim htype
htype=iostate(60000)
if and(htype<>47 ,0=0) then
	 syslog "(e) "+ "incorrect hardware type, exiting"
	end
endif

'def
'def

'def
'def
'def
'def
'def
'def
'def
'def
'def

dim _Min$(1400)
dim _Msm$(1400)
dim i,l,m,n,x,y,z
dim tmp$,stp$
dim crlf$(3),http$(16)
dim relay_cfg(4)

dim relay_alid(4)
dim relay_asid(4)
dim relay_adig(4)
dim relay_astat$
dim door_release_trigger(4)

dim iostates,iostates_old
dim systype
dim port_sif
dim port_udp
dim port_app
dim username$(35)
dim password$(35)
dim allowed_mask(3)
dim dest_enable_masks(3)
dim callin_sources(3)
dim callin_sources_pr(3)
dim seturi0$,seturi1$,seturi2$,seturi3$
dim uriset
dim tcprmt$(16)
dim eoh$(5)
dim clen
dim cup$,cuu$
dim callin_retries

dim msg
dim drelease
dim any_call_src

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' functions
dim check_udp_evt				  <gosub 1010>
dim process_udp_evt				  <gosub 1020>
dim udp_evt_begin_call			  <gosub 1030>
dim udp_evt_begin_comm			  <gosub 1040>
dim udp_evt_door_release		  <gosub 1050>
dim udp_evt_stay_alive			  <gosub 1060>
dim udp_evt_init_notice			  <gosub 1070>
dim udp_evt_close_door			  <gosub 1080>
dim udp_evt_monitoring			  <gosub 1090>

dim check_tcp_evt                 <gosub 2000>
dim get_tcp_msg                   <gosub 2010>
dim process_app_evt				  <gosub 2015>
dim process_sif_evt               <gosub 2020>
dim sif_evt_begin_call            <gosub 2030>
dim sif_evt_begin_comm            <gosub 2040>
dim sif_evt_door_release          <gosub 2050>
dim sif_evt_end_comm              <gosub 2060>
dim sif_evt_chg_contact           <gosub 2070>
dim sif_evt_init_notice           <gosub 2080>
dim close_reopen_tcp              <gosub 2100>

dim process_contacts              <gosub 3000>
dim cclosed                       <gosub 3010>
dim check_auth                    <gosub 4000>
dim check_assigned_src_termid     <gosub 4010>
dim check_assigned_dst_termid     <gosub 4020>
dim check_assigned_srcdst_termid  <gosub 4030>
dim open_callin_socket            <gosub 4500>
dim callin_set_uri                <gosub 5000>
dim callin_callup                 <gosub 5010>
dim callin_set_uri_undo           <gosub 5020>
dim callin_get_http_reply         <gosub 5030>
dim translate_error               <gosub 5100>

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' safety timers for door close
on timer1 gosub 100
on timer2 gosub 200
on timer3 gosub 300
on timer4 gosub 400

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'get general settings: system type, udp/sif port, username and password, app port
open "STP:500" as 9 : read 9, stp$ : close 9

' get system type
systype=midget(stp$,1,1)
if systype=0 then  syslog "(i) "+ "Aiphone system type is IX"
if systype=1 then  syslog "(i) "+ "Aiphone system type is IS"
if systype=2 then  syslog "(i) "+ "Aiphone system type is IPW-1A"

'get upd port for IPW-1A
if systype = 2 then
	port_udp = midget(stp$,4,2)
	if port_udp=0 then port_udp=1724
endif
if systype = 2 then goto 10

' get sif port for IS,IX
port_sif = midget(stp$,2,2)
if port_sif=0 then port_sif=10000

' get username and password for IS
if systype = 1 then
	username$=mid$(stp$,6,16)
	if username$="" then username$="aiphone"
	open "STP:810" as 9 : read 9, stp$ : close 9
	password$=mid$(stp$,1,16) 
	if password$="" then password$="aiphone"
endif

' get username and password, and app server port for IX
if systype = 0 then
	username$=mid$(stp$,6,32)
	if username$="" then username$="admin"
	open "STP:800" as 9 : read 9, stp$ : close 9
	password$=mid$(stp$,10,32) 
	if password$="" then password$="admin"
	
	'get app server port for IX
	port_app = midget(stp$,2,2)
	if port_app = 0 then port_app=5061
endif

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Get linked stations' IP addresses, local/system id's for IS
' Set up station numbers and get app IP addresses for IX
' Source TermID/Station Number
' IS: TermID's are composed of Local(XX)-System(XXX) ID's
' Local  ID : it is the number of row in master IS, under "IP unit registration".
' System ID : it is hw related, 001 for master stations
'                               101 for video door station
' IX: Station Numbers are composed of 3-5 digit ID's
' Station Number: (Local ID * 1000) + System ID, padded to # of Digits

if systype = 0 then
	dim srcnumber$,dstnumber$,relay_a$
	
	open "STP:500" as 9 : read 9, stp$ : close 9
	' - get IX Mobile app IP addresses
	dim ipapp(8)
	for i=0 to 7
		ipapp(i) = midget(stp$,41+(i*4),4)
	next i
endif

if systype = 1 then
	dim srclid,dstlid(20)
	dim srcsid,dstsid(20)
	
	open "STP:500" as 9 : read 9, stp$ : close 9

	' - linked stations -
	dim ipls(32)
	' - term ids/station numbers -
	dim lids(32), sids(32)

	' get 32 linked station IPs
	for i=0 to 31
		ipls(i) = midget(stp$,41+(i*4),4)
	next i

	' get 32 linked station termids
	open "STP:860" as 9 : read 9, stp$ : close 9	
	for i=0 to 31	
		lids(i) = midget(stp$,1+i,1)
		sids(i) = midget(stp$,81+(i*2),2)	
	next i

	for i=0 to 31
		 syslog "(-) "+ sprintf$("%02d: ",i+1) + sprintf$("%lA",ipls(i)) + "  " + &
			sprintf$("%02d-",lids(i)) + sprintf$("%03d",sids(i))
	next i
endif

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Relay Output Settings: action type, local/system ids and digits, get mask for IS, IX, and IPW
10
open "STP:1180" as 9 : read 9, stp$ : close 9

' ~Relay Output Functionality in ryip44_uiappsetup.html
relay_cfg(0)=midget(stp$,1,1)
relay_cfg(1)=midget(stp$,2,1)
relay_cfg(2)=midget(stp$,3,1)
relay_cfg(3)=midget(stp$,4,1)

' reset all relays, check if some are normally closed
for x = 0 to 3
	if relay_cfg(x)>=1 then ioctl x+1,1 else ioctl x+1,0
next x

 syslog "(-) "+ "relay_cfg(0): "+str$(relay_cfg(0))
 syslog "(-) "+ "relay_cfg(1): "+str$(relay_cfg(1))
 syslog "(-) "+ "relay_cfg(2): "+str$(relay_cfg(2))
 syslog "(-) "+ "relay_cfg(3): "+str$(relay_cfg(3))

' get relay "enabling" door station termid ~lidr, sidr, digr in ryip44.js
dim relay_statn$, diff
for i=0 to 3
	relay_alid(i)=midget(stp$,5+i,1)
	relay_asid(i)=midget(stp$,9+(i*2),2)
	if systype = 0 then 
		relay_statn$=""
		relay_adig(i)=midget(stp$,17+i,1)
		relay_statn$ = str$(relay_alid(i)*1000+relay_asid(i))
		diff = relay_adig(i)-len(relay_statn$)
		if diff then
			for a=1 to diff
				relay_statn$ = "0" + relay_statn$
			next a
		endif
		relay_astat$=relay_astat$+relay_statn$
	endif
	if systype = 1 then  syslog "(-) "+ "relay_term-id("+str$(i)+"): "+sprintf$("%02d-",relay_alid(i))+sprintf$("%03d",relay_asid(i))
	if systype = 0 then  syslog "(-) "+ "relay_statnum("+str$(i)+"): "+relay_statn$
	if systype = 2 then  syslog "(-) "+ "relay_station_id("+str$(i)+"): "+sprintf$("%05d",relay_alid(i)*1000+relay_asid(i))
next i

if systype = 2 then goto 20

' get allowed masks for (32 x each relay) for IS ~masks in ryip44_mask.js
if systype = 1 then
	for i = 0 to 3
		allowed_mask(i)=midget(stp$,21+(4*i),4)
	next i
endif

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Relay Input Settings: prepare seturi strings for every input for IS and IX
' Remote Call-In priorities
callin_sources_pr(0)=midget(stp$,41,1)
callin_sources_pr(1)=midget(stp$,42,1)
callin_sources_pr(2)=midget(stp$,43,1)
callin_sources_pr(3)=midget(stp$,44,1)

' ~Remote Call-In IP addresses in ryip44_uiappsetup.html
callin_sources(0)=midget(stp$,45,4)
callin_sources(1)=midget(stp$,49,4)
callin_sources(2)=midget(stp$,53,4)
callin_sources(3)=midget(stp$,57,4)

' prepare HTTP requests here
crlf$=chr$(13)+chr$(10)
eoh$ =chr$(13)+chr$(10)+chr$(13)+chr$(10)
http$=" HTTP/1.0"+crlf$+crlf$
cup$="GET /CallUP.cgi?ID="+username$+"&PW="+password$+"&Kind="
cuu$="GET /SetURIUndo.cgi?ID="+username$+"&PW="+password$+http$
tmp$="GET /SetURI.cgi?ID="+username$+"&PW="+password$
seturi0$=tmp$ : seturi1$=tmp$ : seturi2$=tmp$ : seturi3$=tmp$

' get IX relay input digits
open "STP:720" as 9 : read 9, stp$ : close 9
if systype = 0 then
	dim dig(80),stat0$,stat1$,stat2$,stat3$
	'read digits for URI string below to create station numbers, ~ryip44_dest.js 1350-1429
	for i = 0 to 19
		dig(i) = midget(stp$,1+i,1) 'get byte containing d_dig for relay 1
		dig(20+i) = midget(stp$,21+i,1) 'get byte for relay 2
		dig(40+i) = midget(stp$,41+i,1) 'get byte for relay 3
		dig(60+i) = midget(stp$,61+i,1) 'get byte for relay 4
	next i
endif
	
' Masks added to enable/disable a remote uri for IS,IX
' without deleting and re-inserting it ~d_msk in ryip44_dest.js
open "STP:700" as 9 : read 9, stp$ : close 9
dest_enable_masks(0)=midget(stp$,1,4)
dest_enable_masks(1)=midget(stp$,5,4)
dest_enable_masks(2)=midget(stp$,9,4)
dest_enable_masks(3)=midget(stp$,13,4)

 syslog "(-) "+ "uri_dest_enable_masks(0): "+sprintf$("%05d",dest_enable_masks(0))
 syslog "(-) "+ "uri_dest_enable_masks(1): "+sprintf$("%05d",dest_enable_masks(1))
 syslog "(-) "+ "uri_dest_enable_masks(2): "+sprintf$("%05d",dest_enable_masks(2))
 syslog "(-) "+ "uri_dest_enable_masks(3): "+sprintf$("%05d",dest_enable_masks(3))

' Create complete setUri string
open "STP:1240" as 9 : read 9, stp$ : close 9
dim blank(4)
for i = 0 to 19
	' enable mask bit
	z=shl(1,i)
	'relay 1
	x=midget(stp$,1+i,1) ' get byte containing d_lid
	y=midget(stp$,81+shl(i,1),2) ' get word containing d_sid
	if systype=1 then
		if and(y<>0,and(dest_enable_masks(0),z)) then
			if blank(0)=0 then blank(0)=1 : seturi0$=seturi0$+"&TermID=" else seturi0$=seturi0$+"."
			uriset=or(uriset,1) : seturi0$=seturi0$+sprintf$("%02d",x)+"-"+sprintf$("%03d",y)
		endif
	endif
	if systype=0 then
		if and(dig(i)>1,and(dest_enable_masks(0),z)) then
			stat0$=str$(x*1000+y)
			diff = dig(i)-len(stat0$)
			if diff then
				for a=1 to diff
					stat0$ = "0" + stat0$
				next a
			endif
			if blank(0)=0 then blank(0)=1 : seturi0$=seturi0$+"&TermID=" else seturi0$=seturi0$+"."
			uriset=or(uriset,1) : seturi0$=seturi0$+stat0$
		endif
	endif
	'relay 2
	x=midget(stp$,21+i,1) 
	y=midget(stp$,121+shl(i,1),2)
	if systype=1 then
		if and(y<>0,and(dest_enable_masks(1),z)) then
			if blank(1)=0 then blank(1)=1 : seturi1$=seturi1$+"&TermID=" else seturi1$=seturi1$+"."
			uriset=or(uriset,2) : seturi1$=seturi1$+sprintf$("%02d",x)+"-"+sprintf$("%03d",y)
		endif
	endif
	if systype=0 then
		if and(dig(20+i)>1,and(dest_enable_masks(1),z)) then
			stat1$=str$(x*1000+y)
			diff = dig(20+i)-len(stat1$)
			if diff then
				for a=1 to diff
					stat1$ = "0" + stat1$
				next a
			endif
			if blank(1)=0 then blank(1)=1 : seturi1$=seturi1$+"&TermID=" else seturi1$=seturi1$+"."
			uriset=or(uriset,2) : seturi1$=seturi1$+stat1$
		endif
	endif
	'relay 3
	x=midget(stp$,41+i,1)
	y=midget(stp$,161+shl(i,1),2)
	if systype=1 then
		if and(y<>0,and(dest_enable_masks(2),z)) then
			if blank(2)=0 then blank(2)=1 : seturi2$=seturi2$+"&TermID=" else seturi2$=seturi2$+"."
			uriset=or(uriset,4) : seturi2$=seturi2$+sprintf$("%02d",x)+"-"+sprintf$("%03d",y)
		endif
	endif
	if systype=0 then
		if and(dig(40+i)>1,and(dest_enable_masks(2),z)) then
			stat2$=str$(x*1000+y)
			diff = dig(40+i)-len(stat2$)
			if diff then
				for a=1 to diff
					stat2$ = "0" + stat2$
				next a
			endif
			if blank(2)=0 then blank(2)=1 : seturi2$=seturi2$+"&TermID=" else seturi2$=seturi2$+"."
			uriset=or(uriset,4) : seturi2$=seturi2$+stat2$
		endif
	endif
	'relay 4
	x=midget(stp$,61+i,1)
	y=midget(stp$,201+shl(i,1),2)
	if systype=1 then
		if and(y<>0,and(dest_enable_masks(3),z)) then
			if blank(3)=0 then blank(3)=1 : seturi3$=seturi3$+"&TermID=" else seturi3$=seturi3$+"."
			uriset=or(uriset,8) : seturi3$=seturi3$+sprintf$("%02d",x)+"-"+sprintf$("%03d",y) 
		endif
	endif
	if systype=0 then
		if and(dig(60+i)>1,and(dest_enable_masks(3),z)) then
			stat3$=str$(x*1000+y)
			diff = dig(60+i)-len(stat3$)
			if diff then
				for a=1 to diff
					stat3$ = "0" + stat3$
				next a
			endif
			if blank(3)=0 then blank(3)=1 : seturi3$=seturi3$+"&TermID=" else seturi3$=seturi3$+"."
			uriset=or(uriset,8) : seturi3$=seturi3$+stat3$
		endif
	endif
next i

seturi0$=seturi0$+http$ :  syslog "(-) "+ "seturi0$: "+seturi0$
seturi1$=seturi1$+http$ :  syslog "(-) "+ "seturi1$: "+seturi1$
seturi2$=seturi2$+http$ :  syslog "(-) "+ "seturi2$: "+seturi2$
seturi3$=seturi3$+http$ :  syslog "(-) "+ "seturi3$: "+seturi3$

 syslog "(i) "+ "opening SIF TCP port..."
open "TCN:0.0.0.0:"+str$(port_sif) as 0

if systype = 0 then
	for i=0 to 7
		 syslog "(-) "+ "IX Mobile " + sprintf$("%01d: ",i+1) + sprintf$("%lA",ipapp(i))
	next i
	 syslog "(i) "+ "opening IX Mobile TCP port..."
	open "TCN:0.0.0.0:"+str$(port_app) as 3
endif

goto 1999

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'IPW-1A Loop
20	
	 syslog "(i) "+ "opening UDP port..."
	open "UDP:0.0.0.0:"+str$(port_udp) as 0

1000
	'check udp event, always
	check_udp_evt()
	'check events
	if check_udp_evt=1 then process_udp_evt()
	goto 1000
	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'check_udp_evt()
1010	
	check_udp_evt=0
	l = lastlen(0)
	if l>=0 then return
	read 0,_Min$
	x=midget(_Min$,1,4)
	if x=&H01504941 then check_udp_evt=1
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
'process_udp_evt()
1020	
	 syslog "(-) "+ "process_udp_evt(): processing event from "+udprmt$
	srcid = midget(_Min$,5,-2)
	drelease = midget(_Min$,13,-1)
	msg = midget(_Min$,14,1)
	if drelease = 32 then udp_evt_door_release()
	for i=0 to 3
		if and(drelease<>32,door_release_trigger(i)) then udp_evt_close_door()
	next i
1021	
	if msg = &H06 then udp_evt_begin_call() 							: goto 1022
	if or(msg = &H03, msg = &H04, msg = &H05) then udp_evt_begin_comm() : goto 1022
	if msg = &H01 then udp_evt_stay_alive()								: goto 1022
	if msg = &H41 then udp_evt_init_notice()							: goto 1022
	if msg = &H08 then udp_evt_monitoring()								: goto 1022
	 syslog "(-) "+ str$(msg)
1022
	return


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'udp_evt_begin_call()	
1030
	 syslog "(-) "+ "udp_evt_begin_call()"
	udp_evt_begin_call=0
	for x=0 to 3
		if or(relay_cfg(x)=2,relay_cfg(x)=4) then
			z=check_assigned_src_termid(x) : if z=0 then goto 1031
			ioctl x+1,1 'turn on call or call/comm relay
			timer x+1,10000 'start timer for 10 seconds
		endif
		if relay_cfg(x)=5 then
			if any_call_src = 0 then 
				any_call_src = srcid 'log caller
				ioctl x+1,1 'turn on any call relay
				timer x+1,10000 'start timer for 10 seconds
			endif
			if any_call_src = srcid then timer x+1,10000 'restart timer
		endif
1031
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'udp_evt_begin_comm()	
1040
	 syslog "(-) "+ "udp_evt_begin_comm()"
	udp_evt_begin_comm=0
	for x=0 to 3
		if relay_cfg(x)>1 then
			if and(relay_cfg(x)=5,any_call_src=srcid) then 
				ioctl x+1,0 'turn off any call relay
				timer x+1,0 'turn off timer
				any_call_src=0 'clear source
			endif
			z=check_assigned_src_termid(x) : if z=0 then goto 1041
			if or(relay_cfg(x)=3,relay_cfg(x)=4) then
				ioctl x+1,1 'turn on comm or call/comm relay
				timer x+1,10000 'start timer for 10 seconds
			else
				if relay_cfg(x)=2 then ioctl x+1,0 'turn off call relay
				timer x+1,0 'turn off timer
			endif
		endif
1041
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'udp_evt_door_release()	
1050
	 syslog "(-) "+ "udp_evt_door_release()"
	udp_evt_door_release=0
	for x = 0 to 3
		if or(relay_cfg(x)=0,relay_cfg(x)=1) then
			z=check_assigned_src_termid(x) : if z=0 then goto 1051
			door_release_trigger(x)=1
			timer x+1, 600000 'safety timer on (spec 600s)
			if relay_cfg(x)=0 then ioctl 1+x,1 else ioctl 1+x,0 'turn on no/nc door release relay
		endif
1051
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'udp_evt_stay_alive()
1060
	 syslog "(-) "+ "udp_evt_stay_alive()"
	udp_evt_stay_alive=0
	for x=0 to 3
		if relay_cfg(x)>1 then
			if and(relay_cfg(x)=5,any_call_src=srcid) then 
				ioctl x+1,0 'turn off any call relay
				timer x+1,0 'turn off timer
				any_call_src=0 'clear source
			endif
			z=check_assigned_src_termid(x) : if z=0 then goto 1061
			ioctl x+1,0 'turn off call or comm or call/comm relay
			timer x+1,0 'turn off timer
		endif
1061
	next x
	return
	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'udp_evt_init_notice()	
1070	
	 syslog "(-) "+ "udp_evt_init_notice()"
	udp_evt_init_notice=0
	for x = 0 to 3
		if and(door_release_trigger(x)=1, or(relay_cfg(x)=0,relay_cfg(x)=1)) then
			z=check_assigned_src_termid(x) : if z=0 then goto 1071
			if relay_cfg(x)=0 then ioctl x+1,0 else ioctl x+1,1 'turn off no/nc door release relay
			door_release_trigger(x)=0 : timer x+1,0 'turn off timer
		endif
		if relay_cfg(x)>1 then
			if and(relay_cfg(x)=5,any_call_src=srcid) then 
				ioctl x+1,0 'turn off any call relay
				timer x+1,0 'turn off timer
				any_call_src=0 'clear source
			endif
			z=check_assigned_src_termid(x) 
			if z=1 then 
				ioctl x+1,0 'turn off call or comm or call/comm relay
				timer x+1,0 'turn off timer
			endif
		endif
1071
	next x
	return
	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'udp_evt_close_door()
1080
	 syslog "(-) "+ "udp_evt_close_door()"
	udp_evt_close_door=0
	for x = 0 to 3
		if and(door_release_trigger(x)=1,or(relay_cfg(x)=0,relay_cfg(x)=1)) then
			z=check_assigned_src_termid(x) : if z=0 then goto 1081
			if relay_cfg(x)=0 then ioctl 1+x,0 else ioctl 1+x,1 'turn off no/nc door release relay
			door_release_trigger(x)=0 : timer x+1,0 'turn off timer
		endif
1081
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'udp_evt_monitoring()
1090
	 syslog "(-) "+ "udp_evt_monitoring()"
	udp_evt_monitoring=0
	for x = 0 to 3
		if or(relay_cfg(x)=2,relay_cfg(x)=4) then
			z=check_assigned_src_termid(x) : if z=0 then goto 1091
			ioctl x+1,0 'turn off call or call/comm relay
			timer x+1,0 'turn off timer
		endif
		if and(relay_cfg(x)=5,any_call_src=srcid) then 
			ioctl x+1,0 'turn off any call relay
			timer x+1,0 'turn off timer
			any_call_src=0 'clear source
		endif
1091
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' stateless main loop for IS and IX, every event is received and processed
' logical checks about the event are done in every specific
' event handling callback.

1999

	' check for sif event, always
	check_tcp_evt(0)
	' check events
	if check_tcp_evt=1 then process_sif_evt()
	' check and process input contacts
	process_contacts()
	' check for and process app keepalive, if IX system
	if systype = 0 then check_tcp_evt(3)
	goto 1999

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' check_tcp_evt()
2000
	local mtype
	check_tcp_evt=0
	if connected(mtype) then
		if mtype = 0 then  syslog "(-) "+ "check_tcp_evt(): SIF port connection established"
		if mtype = 3 then  syslog "(-) "+ "check_tcp_evt(): APP port connection established"
		tcprmt$=rmthost$(mtype)
		get_tcp_msg(mtype, 328)
		if get_tcp_msg=1 then
			if mtype = 0 then 
				 syslog "(-) "+ "check_tcp_evt(): SIF event received, sending ack"
				write mtype, "ACK", 3	
			endif
			if mtype = 3 then process_app_evt()
			' SIF spec: remote peer must close now,
			' so check socket to be closed from remote side
			x=_TMR_(0)
2001		if connected(mtype) then
				tmp$=rmthost$(mtype)
				if tmp$=tcprmt$ then
					' exit after 200 msecs timeout (force close). 
					' changed 200 to 50: IX audio while calling was quickest
					if _TMR_(0)-x>50 then
						 syslog "(e) "+ "check_tcp_evt(): force close for timeout"
						close_reopen_tcp(mtype)
						goto 2002
					endif
				else
					 syslog "(-) "+ "connected host changed! exiting check_tcp_evt()"
					' another connection is established in the meantime.
					' assume here (SIF SPEC) the previous has been closed.
					' don't do anything here, just process previous event
					goto 2002
				endif
				goto 2001
			else
				 syslog "(-) "+ "check_tcp_evt(): remote peer closed"
			endif
2002		check_tcp_evt=1 : return
		else
			 syslog "(e) "+ "check_tcp_evt(): rx timeout, brutal close"
			' no data, no NAK
			' can be an attempt of attack/scan, we close
			close_reopen_tcp(mtype)
		endif
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' get_tcp_msg()
' TCP is stream based, there is no guarantee the whole data
' amount is received at first "read" after connect. So the entire
' expected len must be read in a cycle.
'def
2010
	local mstrm, mlen, moffs, tmr_out

	get_tcp_msg=0 : moffs=0
	tmr_out=_TMR_(0)
2011
	read mstrm,_Min$
	l=lastlen(mstrm)
	if l>0 then
		midcpy _Msm$,moffs+1,l,_Min$
		moffs=moffs+l
		if moffs=mlen then get_tcp_msg=1 : goto 2012
	endif
	if _TMR_(0)-tmr_out>300 then goto 2012
	goto 2011
2012
	return
	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' process_app_evt()
2015
	 syslog "(-) "+ "process_app_evt(): processing event from "+tcprmt$
	x=val(mid$(_Msm$,1,4))
	y=val(mid$(_Msm$,17,4))
	z=check_auth()
	
	if x<100 then
		 syslog "(w) "+ "invalid program type "+str$(x)+" received, discarding data"
		return
	endif
	
	'if and(y=1110, z=1) then
	if z=1 then
		 syslog "(-) "+ "process_app_evt(): APP keepalive received, sending ack"
		write 3, "ACK", 3
	else
		 syslog "(-) "+ "process_app_evt(): invalid APP keepalive received, sending nak"
		write 3, "NAK", 3
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' process_sif_evt()
2020
	 syslog "(-) "+ "process_sif_evt(): processing event from "+tcprmt$

	' get program type
	x=val(mid$(_Msm$,1,4))
	if x<100 then
		 syslog "(w) "+ "invalid program type "+str$(x)+" received, discarding data"
		return
	endif

	' get TermIDs or Station Numbers always
	if systype = 1 then
		srclid=val(mid$(_Msm$,33,2))
		srcsid=val(mid$(_Msm$,36,3))
		dstlid(0)=val(mid$(_Msm$,41,2))
		dstsid(0)=val(mid$(_Msm$,44,3))
		 syslog "(-) "+ "process_sif_evt(): src TermID: "+sprintf$("%02d-",srclid)+sprintf$("%03d",srcsid)
		 syslog "(-) "+ "process_sif_evt(): dst TermID: "+sprintf$("%02d-",dstlid(0))+sprintf$("%03d",dstsid(0))
	endif
	if systype = 0 then
		srcnumber$ = mid$(_Msm$,33,5)
		dstnumber$ = mid$(_Msm$,41,5)
		 syslog "(-) "+ "process_sif_evt(): src Station Number: "+srcnumber$ 
		 syslog "(-) "+ "process_sif_evt(): dst Station Number: "+dstnumber$
	endif
	
	' get SIF event type
	y=val(mid$(_Msm$,17,4))
	
	if y=0000 then
		' get 1 to 19 termid's
		 syslog "(-) "+ "process_sif_evt(): get all 20 dest TermID/Station Numbers"
		for i=1 to 19
			if systype = 1 then
				dstlid(i)=val(mid$(_Msm$,41+(i*8),2))
				dstsid(i)=val(mid$(_Msm$,44+(i*8),3))
			endif
			if systype = 0 then	
				dstnumber$=dstnumber$+mid$(_Msm$,41+(i*8),5)
			endif
		next i
		sif_evt_begin_call() : goto 2021
	endif
	if y=0001 then sif_evt_begin_comm()   : goto 2021
	if and(y=0010,systype=1) then sif_evt_door_release() : goto 2021
	if y=0011 then sif_evt_end_comm()     : goto 2021
	if y=0100 then sif_evt_chg_contact()  : goto 2021
	if y=1111 then sif_evt_init_notice()  : goto 2021
	
	 syslog "(-) "+ "unhandled sif event: "+str$(y)+", discarding"	
2021
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_begin_call()
2030
	 syslog "(-) "+ "sif_evt_begin_call()"
	
	sif_evt_begin_call=0

	for x = 0 to 3
		if or(relay_cfg(x)=2,relay_cfg(x)=4) then
			z=check_assigned_src_termid(x,1) : if z=0 then goto 2031
			ioctl x+1,0
		endif
2031
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_begin_comm()
2040
	 syslog "(-) "+ "sif_evt_begin_comm()"

	sif_evt_begin_comm=0

	for x = 0 to 3
		' check srcdst validation for ext signalling only
		if relay_cfg(x)>1 then
			z=check_assigned_srcdst_termid(x,0) : if z=0 then goto 2041
			if or(relay_cfg(x)=3,relay_cfg(x)=4) then
				ioctl x+1,0
			else 
				if relay_cfg(x)=2 then ioctl x+1,1
			endif
		endif
2041
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_end_comm()
2060
	 syslog "(-) "+ "sif_evt_end_comm()"

	sif_evt_end_comm=0

	' relay back open only if not set as door release
	for x = 0 to 3
		z=check_assigned_srcdst_termid(x,0) : if z=0 then goto 2061
		if relay_cfg(x)>1 then ioctl x+1,1
2061
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_door_release() for IS
2050
	 syslog "(-) "+ "sif_evt_door_release()"

	sif_evt_door_release=0

	'get contact state, release the door=1, close=0
	y=midget(_Msm$,200+1,1)-&H30
	 syslog "(-) "+ "sif_evt_door_release(): contact state: "+str$(y)

	'normally, 0=open,1=closed, but logic can be inverted
	for x = 0 to 3
		if or(relay_cfg(x)=0,relay_cfg(x)=1) then
			z=check_assigned_dst_termid(x) : if z=0 then goto 2051 'check if event is for the configured door station
			z=check_auth(x) : if z=0 then goto 2051 'check authority for this relay (allowed sources table)
			'door release activation only is considered here
			if y=1 then
				door_release_trigger(x)=1 'door release accepted
				timer x+1, 300000 'safety timer on (spec 300secs)
				if relay_cfg(x)=0 then ioctl 1+x,1 else ioctl 1+x,0
			endif
		endif
2051
	next x
2052
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_chg_contact()
2070
	 syslog "(-) "+ "sif_evt_chg_contact()"

	sif_evt_chg_contact=0
	
	x=midget(_Msm$,216+1,1)-&H30
	' 0 = physical input of the door station
	' 1 = contact output state for door release
	' 2 = calling output (built-in hardware output on some door stations)
	' 3 = output during comm. (as 2, built-in hardware output on some door stations)
	if x<>1 then
		 syslog "(-) "+ "sif_evt_chg_contact(): unhandled contact change event: "+str$(x)
		return
	endif
	
	' is there a door release trigger (start) enabled for IS?
	if systype = 1 then
		for i=0 to 3
			if door_release_trigger(i)=1 then goto 2071
		next i
	
		 syslog "(-) "+ "sif_evt_chg_contact(): no door release trigger active, discarding"
		return
	endif

2071
	y=midget(_Msm$,217+1,1)-&H30
	 syslog "(-) "+ "sif_evt_chg_contact(): contact state: "+str$(y)
	
	z=val(mid$(_Msm$,248+1,4))
	 syslog "(-) "+ "RY" + str$(z)
	if or(z=1,z=0) then  ' only process event for RY1, not 0002
		'normally, 0=open,1=closed, but logic can be inverted
		for x = 0 to 3
			'door release only
			if or(relay_cfg(x)=0,relay_cfg(x)=1) then
				z=check_assigned_src_termid(x)
				if and(z=1,y=0,door_release_trigger(x)=1) then	
					 syslog "(-) "+ "sif_evt_chg_contact(): door closed"
					door_release_trigger(x)=0 
					if relay_cfg(x)=0 then ioctl 1+x,0 else ioctl 1+x,1
					timer x+1,0
				endif
				if systype = 1 then goto 2072
				if and(z=1,y=1) then
					 syslog "(-) "+ "sif_evt_chg_contact(): door released"
					door_release_trigger(x)=1
					if relay_cfg(x)=0 then ioctl 1+x,1 else ioctl 1+x,0
					timer x+1,300000
				endif
				' no "on/unassigned" handling
			endif
2072
		next x
	else	
		 syslog "(-) "+ "Ignoring RY" + str$(z)
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_init_notice()
2080
	 syslog "(-) "+ "sif_evt_init_notice()"
	
	sif_evt_init_notice=0

	' reset relay states, check if normally closed
	for x = 0 to 3
		if or(relay_cfg(x)=0,relay_cfg(x)=1) then
			z=check_assigned_src_termid(x)
			if z=1 then
				if relay_cfg(x)=0 then ioctl x+1,0 else ioctl x+1,1
				door_release_trigger(x)=0 : timer x+1,0
			endif
		else			
			z=check_assigned_srcdst_termid(x,0) 'external signalling here
			if z=1 then ioctl x+1,0
		endif
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' close_reopen_tcp()
2100
	local mtype2

	close mtype2
	delay 0
	if mtype2 = 0 then 
		open "TCN:0.0.0.0:"+str$(port_sif) as 0
		goto 2101
	endif
	if mtype2 = 3 then 
		open "TCN:0.0.0.0:"+str$(port_app) as 3
		goto 2101
	endif
	'syslog "it's a trap! mtype2="+str$(mtype2)
2101	
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' process_contacts()
3000
	LOCAL q,e,f

	process_contacts=0

	iostates=0
	for q = 0 to 3
		e=and(iostate(201+q),1)
		iostates=or(iostates,shl(e,q))
	next q
	if iostates<>iostates_old then
		e=xor(iostates,iostates_old)
		' process contact change now
		for q = 0 to 3
			' check what input is changed
			f=shl(1,q)
			if and(f,e) then
				' ok, changed, now see if activated or not
				if and(iostates,f) then
					 syslog "(-) "+ "contact closure "+str$(q+1)+" detected"
					cclosed(q)
				else
					 syslog "(-) "+ "contact "+str$(q+1)+" released"
				endif
			endif
		next q
		iostates_old=iostates
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' cclosed()
' nested loop for callin
' note, no retries are done for error returned, only on http timeout
3010
	LOCAL ccont

	cclosed=0

	 syslog "(-) "+ "cclosed(): contact ["+str$(ccont)+"] closed"
	
	if callin_sources(ccont)=0 then return

	callin_retries=0
3011
	callin_set_uri(ccont)
	if callin_set_uri=1 then
		 syslog "(-) "+ "callin_set_uri success"
		callin_retries=0
3012	callin_callup(ccont)
		if callin_callup=1 then
			 syslog "(-) "+ "callin_callup success"
			callin_retries=0
3013		callin_set_uri_undo(ccont)
			if callin_set_uri_undo=1 then
				 syslog "(-) "+ "callin_set_uri_undo success"
				goto 3014
			else
				' retry on timeout only
				if callin_set_uri_undo=-1 then
					callin_retries=callin_retries+1 : if callin_retries<3 then goto 3013
				else
					goto 3015
				endif
			endif
		else
			' retry on timeout only
			if callin_callup=-1 then
				callin_retries=callin_retries+1 : if callin_retries<3 then goto 3012
			else
				goto 3015
			endif
		endif
	else
		' retry on timeout only
		if callin_set_uri=-1 then
			callin_retries=callin_retries+1 : if callin_retries<3 then goto 3011
		else
			goto 3015
		endif
	endif
	 syslog "(e) "+ "call-in process failed after 3 retries, exiting."
	return
3014
	 syslog "(-) "+ "callin successful"
3015
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''		
' check_auth(x)
' relay-related contact-change authorization for IS
' IX Mobile app authorization for IX
' note: keep own separate iterator to avoid nested loop issues
4000
	LOCAL relm,tcp_sender,k

	check_auth=0
	tcp_sender=resolve(tcprmt$)
	
	if tcp_sender<>0 then
		if systype = 1 then
			for k=0 to 32
				if and(ipls(k)<>0,lids(k)<>0,sids(k)<>0) then
					if and(ipls(k)=tcp_sender,lids(k)=srclid,sids(k)=srcsid) then
						if and(allowed_mask(relm),shl(1,k)) then
							 syslog "(-) "+ "check_auth(): sender authorized"
							check_auth=1
							goto 4001
						endif
					endif
				endif
			next k
		 syslog "(e) "+ "check_auth() : sender TermID not authorized"
		endif		
		if systype = 0 then
			for k=0 to 8
				if and(ipapp(k)<>0, ipapp(k)=tcp_sender) then
					 syslog "(-) "+ "check_auth(): sender authorized"
					check_auth=1
					goto 4001
				endif
			next k
		 syslog "(e) "+ "check_auth(): sender not authorized"
		endif
	endif
4001
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' check_assigned_src_termid()
' Door Station as source Term ID must match
4010
	LOCAL rels, poss
	
	check_assigned_src_termid=0

	if systype = 1 then
		if and(relay_alid(rels)=srclid,relay_asid(rels)=srcsid) then
			check_assigned_src_termid=1
			 syslog "(-) "+ "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned TermID matched"
		else
			 syslog "(e) "+ "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned TermID unmatched"
		endif
	endif
	if systype = 0 then
		poss = 0		
		for b=0 to (rels-1)
			poss = poss + relay_adig(b)
		next b

		' syslog "(-) "+ "check_assigned_src_termid(): is src "+srcnumber$+"? assigned: "+mid$(relay_astat$,poss+1,relay_adig(rels))
		if mid$(relay_astat$,poss+1,relay_adig(rels)) = srcnumber$ then
			check_assigned_src_termid=1
			 syslog "(-) "+ "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned Station Number matched"			
		else
			 syslog "(e) "+ "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned Station Number unmatched"
		endif
	endif
	if systype = 2 then
		if and(relay_alid(rels)*1000+relay_asid(rels)=srcid) then
			check_assigned_src_termid=1
			 syslog "(-) "+ "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned Station ID matched"
		else
			 syslog "(e) "+ "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned Station ID unmatched"
		endif
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' check_assigned_dst_termid()
' Door Station as destination Term ID must match
4020
	LOCAL reld

	check_assigned_dst_termid=0

	if systype = 1 then
		if and(relay_alid(reld)=dstlid(0),relay_asid(reld)=dstsid(0)) then
			check_assigned_dst_termid=1
			 syslog "(-) "+ "check_assigned_dst_termid(): relay "+str$(reld+1)+" assigned TermID matched"
		else
			 syslog "(e) "+ "check_assigned_dst_termid(): relay "+str$(reld+1)+" assigned TermID unmatched"
		endif
	endif
	if systype = 0 then
		LOCAL posd
		posd=0
		for a=0 to (reld-1)
			posd = posd + relay_adig(a)
		next a
		' syslog "(-) "+ "check_assigned_dst_termid(): is dst "+dstnumber$+"? assigned: "+mid$(relay_astat$,posd+1,relay_adig(reld))
		if mid$(relay_astat$,posd+1,relay_adig(reld)) = dstnumber$ then
			check_assigned_dst_termid=1
			 syslog "(-) "+ "check_assigned_dst_termid(): relay "+str$(reld+1)+" assigned Station Number matched"
		else
			 syslog "(e) "+ "check_assigned_dst_termid(): relay "+str$(reld+1)+" assigned Station Number unmatched"
		endif
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' check_assigned_srcdst_termid() ' NOTE, it is OR logic
4030
	LOCAL relsd,multiple_dest,possd
	
	if systype = 0 then
		possd = 0
		for a = 0 to (relsd-1)
			possd = possd + relay_adig(a)
		next a
	endif
	
	check_assigned_srcdst_termid=0

	if multiple_dest then
		 syslog "(-) "+ "check_assigned_srcdst_termid(): checking all 20 SIF dest TermID's ..."
		for i=0 to 19
			if systype = 1 then
				if and(relay_alid(relsd)=dstlid(i),relay_asid(relsd)=dstsid(i)) then
					check_assigned_srcdst_termid=1
					 syslog "(-) "+ "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" multiple assigned TermID matched"
					goto 4031
				endif
			endif
			if systype = 0 then
				' syslog "(-) "+ "check_assigned_srcdst_termid(): is dst "+dstnumber$+"? assigned: "+mid$(relay_astat$,possd+1,relay_adig(relsd))
				if mid$(relay_astat$,possd+1,relay_adig(relsd)) = dstnumber$ then
					check_assigned_srcdst_termid=1
					 syslog "(-) "+ "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" multiple assigned Station Number matched"
					goto 4031
				endif
			endif
		next i
	else
		if systype = 1 then
			if and(relay_alid(relsd)=dstlid(0),relay_asid(relsd)=dstsid(0)) then
				check_assigned_srcdst_termid=1
				 syslog "(-) "+ "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned TermID matched"
				goto 4031
			endif
		endif
		if systype = 0 then
			' syslog "(-) "+ "check_assigned_srcdst_termid(): is dst "+dstnumber$+"? assigned: "+mid$(relay_astat$,possd+1,relay_adig(relsd))
			if mid$(relay_astat$,possd+1,relay_adig(relsd)) = dstnumber$ then
				check_assigned_srcdst_termid=1
				 syslog "(-) "+ "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned Station Number matched"
				goto 4031
			endif
		endif
	endif
	if systype = 1 then
		if and(relay_alid(relsd)=srclid,relay_asid(relsd)=srcsid) then
			check_assigned_srcdst_termid=1
			 syslog "(-) "+ "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned TermID matched"
			goto 4031
		else
			 syslog "(-) "+ "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned TermID unmatched"
		endif
	endif
	if systype = 0 then
		' syslog "(-) "+ "check_assigned_srcdst_termid(): is src "+srcnumber$+"? assigned: "+mid$(relay_astat$,possd+1,relay_adig(relsd))
		if mid$(relay_astat$,possd+1,relay_adig(relsd)) = srcnumber$ then
			check_assigned_srcdst_termid=1
			 syslog "(-) "+ "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned Station Number matched"
			goto 4031
		else
			 syslog "(e) "+ "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned Station Number unmatched"
		endif
	endif
		
4031
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' open_callin_socket(), get source contact as input
4500
	LOCAL scont

	open_callin_socket=0

	tmp$="TCP:"+sprintf$("%lA",callin_sources(scont))+":80"

	 syslog "(-) "+ "open_callin_socket(): connecting"
	open tmp$ as 1
	if mediatype(1)=0 then
		 syslog "(e) "+ "open_callin_socket(): error opening/connecting TCP handle"
		return
	endif
	open_callin_socket=1
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' callin_set_uri()
5000
	LOCAL suin

	callin_set_uri=0

	if and(uriset,shl(1,suin)) then

		open_callin_socket(suin)
		if open_callin_socket=0 then return

		' send seturi now
		on suin+1 goto 5001,5002,5003,5004
5001	write 1, seturi0$, len(seturi0$) : goto 5005
5002	write 1, seturi1$, len(seturi1$) : goto 5005
5003	write 1, seturi2$, len(seturi2$) : goto 5005
5004	write 1, seturi3$, len(seturi3$) : goto 5005
5005
		callin_get_http_reply()
		if callin_get_http_reply=1 then
			x=val(mid$(_Min$,n+7))
			if x=0 then 
				callin_set_uri=1
			else
				translate_error(x) :  syslog "(e) "+ "callin_set_uri() : call error ["+tmp$+"]"
			endif
		else
			callin_set_uri=callin_get_http_reply
		endif

		if mediatype(1) then close 1
	else
		 syslog "(e) "+ "callin_set_uri() : no URI TermID has been set/enabled, exiting"
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' callin_callup()
5010
	LOCAL cuin

	callin_callup=0

	open_callin_socket(cuin)
	if open_callin_socket=0 then return

	on callin_sources_pr(cuin)+1 goto 5011,5012,5013
5011 tmp$=cup$+"Normal"   : goto 5015
5012 tmp$=cup$+"Priority" : goto 5015
5013 tmp$=cup$+"Urgent"

5015
	tmp$=tmp$+http$
	write 1, tmp$, len(tmp$)

	callin_get_http_reply()
	if callin_get_http_reply=1 then
		x=val(mid$(_Min$,n+7))
		if x=0 then
			callin_callup=1
		else
			translate_error(x) :  syslog "(e) "+ "callin_callup() : call error ["+tmp$+"]"
		endif
	else
		callin_callup=callin_get_http_reply
	endif

	if mediatype(1) then close 1
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' callin_set_uri_undo()
5020
	LOCAL uuin

	callin_set_uri_undo=0

	open_callin_socket(uuin)
	if open_callin_socket=0 then return

	write 1, cuu$, len(cuu$)

	callin_get_http_reply()
	if callin_get_http_reply=1 then
		x=val(mid$(_Min$,n+7))
		if x=0 then 
			callin_set_uri_undo=1
		else
			translate_error(x) :  syslog "(e) "+ "callin_set_uri_undo() : call error ["+tmp$+"]"
		endif
	else
		callin_set_uri_undo=callin_get_http_reply
	endif

	if mediatype(1) then close 1
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' callin_get_http_reply()
' result is in _Min$, starting from n
5030
	callin_get_http_reply=0
	
	' get actual time, reset cursor
	x=_TMR_(0) : y=1 : clen=65535 : n=0
5031
	if clen<>0 then
		' connection close, remote peer close before we read all, 
		' no need to verify for connected
		read 1,_Msm$ : l=lastlen(1) 
		if l>0 then
			midcpy _Min$,y,l,_Msm$ : y=y+l : clen=clen-l
			' clen already received ?
			if n<>0 then goto 5031
			n=instr(1,_Min$,eoh$)
			if n>0 then
				z=instr(1,_Min$,"Content-Length: ")
				if z>0 then
					clen=val(mid$(_Min$,z+16,5))
					' update, how many bytes are still missing
					clen=clen-((y-1)-(n+3))
				else
					 syslog "(e) "+ "callin_get_http_reply() : incorrect http reply"
					goto 5034
				endif
			endif
		endif
		if systype = 1 then
			if _TMR_(0)-x>500 then
				 syslog "(e) "+ "callin_get_http_reply() : timeout error"
				callin_get_http_reply=-1
				goto 5034
			endif
		endif
		goto 5031
	else
		' success
		n=n+4
		callin_get_http_reply=1
	endif
5034
	close 1
	return

' translate_error()
5100
	LOCAL html_error

	if html_error<21 then goto 5110

	on html_error-20 goto 5101,5102,5103,5104,5105

5101 tmp$="ID/PW mismatch" : return
5102 tmp$="incorrect argument" : return
5103 tmp$="ineligible unit" : return
5104 tmp$="overlapping CGI execution not possible" : return
5105 tmp$="processing cannot be accepted" : return

5110
	tmp$=str$(html_error)
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' safety timers
100
	if and(systype=2,door_release_trigger(0)=0) then
		 syslog "(e) "+ "safety timer : no station keep alive message, closing relay 1"
		ioctl 1,0
		any_call_src = 0
	endif
	if door_release_trigger(0)=1 then
		 syslog "(e) "+ "safety timer : relay 1 detected door released, closing"
		door_release_trigger(0)=0
		if or(relay_cfg(0)=0,relay_cfg(0)=1) then
				if relay_cfg(0)=0 then ioctl 1,0 else ioctl 1,1
		endif
	endif
	timer 1,0
	return

200
	if and(systype=2,door_release_trigger(1)=0) then
		 syslog "(e) "+ "safety timer : no station keep alive message, closing relay 2"
		ioctl 2,0
		any_call_src = 0
	endif
	if door_release_trigger(1)=1 then
		 syslog "(e) "+ "safety timer : relay 2 detected door released, closing"
		door_release_trigger(1)=0
		if or(relay_cfg(1)=0,relay_cfg(1)=1) then
				if relay_cfg(1)=0 then ioctl 2,0 else ioctl 2,1
		endif
	endif
	timer 2,0
	return
300
	if and(systype=2,door_release_trigger(2)=0) then
		 syslog "(e) "+ "safety timer : no station keep alive message, closing relay 3"
		ioctl 3,0
		any_call_src = 0
	endif
	if door_release_trigger(2)=1 then
		 syslog "(e) "+ "safety timer : relay 3 detected door released, closing"
		door_release_trigger(2)=0
		if or(relay_cfg(2)=0,relay_cfg(2)=1) then
				if relay_cfg(2)=0 then ioctl 3,0 else ioctl 3,1
		endif
	endif
	timer 3,0
	return

400
	if and(systype=2,door_release_trigger(3)=0) then
		 syslog "(e) "+ "safety timer : no station keep alive message, closing relay 4"
		ioctl 4,0
		any_call_src = 0
	endif
	if door_release_trigger(3)=1 then
		 syslog "(e) "+ "safety timer : relay 4 detected door released, closing"
		door_release_trigger(3)=0
		if or(relay_cfg(3)=0,relay_cfg(3)=1) then
				if relay_cfg(3)=0 then ioctl 4,0 else ioctl 4,1
		endif
	endif
	timer 4,0
	return