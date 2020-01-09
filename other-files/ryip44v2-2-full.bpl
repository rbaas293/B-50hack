RST1 Seg:C400 Off:0000 Len:00025DB4 CoB1
��   errors.hlp
`��  ryip44.bas
���  ryip44.bcl	�3q ryip44.js
J�� ryip44.tok� ryip44_dest.js�
 ryip44_mask.js�� ryip44_uiappsetup.html-a+ ryip44_uidest.html�&�1 ryip44_uihappsetup.html�,X ryip44_uimask.html 0  BCL file not exisiting or invalid tokencode version (use correct tokenizer version)
1  PRINT was not last statement in line or wrong delimiter used (allowed ',' or ';')
2  Wrong logical operator in IF statement (allowed '=','>','>=','<','<=','<>')
3  ONLY String VARIABLE can be used as parameter in OPEN,READ,MIDxxx,EXEC
4  Wrong delimiter/parameter is used in list of parameters for this statement/function
5  ON statement must be followed by GOTO/GOSUB statement
6  First parameter of TIMER statement must be 1..4 (# for ON TIMER# GOSUB...)
7  Wrong element is used in this string/numeric expression, maybe a type mismatch
8  Divided by Zero
9  Wrong label is used in GOTO/GOSUB statement (allowed only a numeric constant)
10 Wrong symbol is used in source code, syntax error, tokenization is impossible
11 Wrong size of string/array is used in DIM (allowed only a numeric constant)
12 Wrong type in DIM statement used (only string variable or long variable/array allowed)
13 DIM was not last statement in line or wrong delimiter used (allowed only ',')
14 Missing bracket in expression or missing quote in string constant
15 Maximum nesting of calculations exceeded (too many brackets)
16 Assignment assumed (missing equal sign)
17 Wrong size of external tokenized TOK file (file might be corrupt)
18 Too many labels needed, tokenization is impossible
19 Identical labels in source code found, tokenization is impossible
20 Undefined label in GOTO/GOSUB statement found, tokenization is impossible
21 Missing THEN in IF/THEN statement
22 Missing TO in FOR/TO statement
23 Run-time warning: Possibly, maximum nesting of FOR-NEXT loops exceeded
24 NEXT statement without FOR statement or wrong index variable in NEXT statement
25 Maximum nesting of GOSUB-RETURN calls exceeded
26 RETURN statement without proper GOSUB statement
27 Lack of memory for dynamic memory allocation
28 String variable name conflict or too many string variables used
29 Long variable name conflict or too many long variables used
30 Insufficient space in memory for temp string, variable or program allocation
31 Current Array index bigger then maximal defined index in DIM statement
32 Wrong current number of file/stream handler (allowed only 0..4)
33 Wrong file/stream type/type name or file/stream is already closed
34 This file/stream handler is already used or file/stream already opened
35 Missing AS statement in OPEN AS statement
36 Wrong address in IOCTL or IOSTATE
37 Wrong serial port number in OPEN statement
38 Wrong baudrate parameter for serial port in OPEN statement
39 Wrong parity parameter for serial port in OPEN statement
40 Wrong data bits parameter for serial port in OPEN statement
41 Wrong stop bits parameter for serial port in OPEN statement
42 Wrong serial port type parameter in OPEN statement
43 Run-time warning: You lost data during PLAY -- Please, increase string size
44 For TCP/CIFS file/stream only handler with number 0..5 are allowed
45 Only standard size (256 bytes) string variable allowed for READ and WRITE in STP file
46 Wrong or out of string range parameters in MID$ or MIDxxx
47 Only one STP/F_C file can be opened at a time
48 '&' can be used ONLY at the end of a line
49 Syntax error in multiline IF...ENDIF (maybe wrong nesting)
50 Length of Search Tag must not exceed size of target String Variable for READ
51 DIM string/array variable name already used
52 Wrong user function name or array declaration missing
53 General syntax error: wrong or not allowed delimiter or statement at this position
54 Run-time warning: Lost data during UDP READ -- Please, increase string size
55 Run-time warning: Lost data during UDP receiving -- 1k buffer limit
56 Run-time warning: Impossible to allocate 6 TCP handles, if 6 are needed free up TCP command port and/or serial local ports
57 Run-time warning: Lost data during concatenation of strings -- Please, increase target string size (DIM statement)
58 Run-time warning: Lost data during assignment of string -- Please, increase target string size (DIM statement)
59 Indicated flash page (WEBx) is out of range for this HW
60 COB file (F_C type) exceeds 64k limit
61 Token size too long
62 Unrecognized token type
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
	if relay_cfg(x)=1 then ioctl x+1,1 else ioctl x+1,0
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
			ioctl x+1,1
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
				ioctl x+1,1
			else 
				if relay_cfg(x)=2 then ioctl x+1,0
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
		if relay_cfg(x)>1 then ioctl x+1,0
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
#define sysi #1 syslog "(i) "+#1
#define sysw #1 syslog "(w) "+#1
#define syse #1 syslog "(e) "+#1
' DEBUG
#define sysd #1 syslog "(-) "+#1
' else
' #define sysd nul$=#1

#define BARIONET_50_AIPHONE   47 '(0x2f)
#define TEST_VERSION 0
dim htype
htype=iostate(60000)
if and(htype<>BARIONET_50_AIPHONE,TEST_VERSION=0) then
	syse "incorrect hardware type, exiting"
	end
endif

#define MAINLOOPIPW		 1000
#define MAINLOOP         1999

#define H_TCP_SIF        0
#define H_UDP_SIF		 0
#define H_TCP_APP		 3
#define H_TCP_CALLIN     1
#define H_STP            9
#define PORT_DEFAULT_SIF 10000
#define PORT_DEFAULT_UDP 1724
#define PORT_DEFAULT_APP 5061
#define LEN_TCP_EVT      328

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
open "STP:500" as H_STP : read H_STP, stp$ : close H_STP

' get system type
systype=midget(stp$,1,1)
if systype=0 then sysi "Aiphone system type is IX"
if systype=1 then sysi "Aiphone system type is IS"
if systype=2 then sysi "Aiphone system type is IPW-1A"

'get upd port for IPW-1A
if systype = 2 then
	port_udp = midget(stp$,4,2)
	if port_udp=0 then port_udp=PORT_DEFAULT_UDP
endif
if systype = 2 then goto 10

' get sif port for IS,IX
port_sif = midget(stp$,2,2)
if port_sif=0 then port_sif=PORT_DEFAULT_SIF

' get username and password for IS
if systype = 1 then
	username$=mid$(stp$,6,16)
	if username$="" then username$="aiphone"
	open "STP:810" as H_STP : read H_STP, stp$ : close H_STP
	password$=mid$(stp$,1,16) 
	if password$="" then password$="aiphone"
endif

' get username and password, and app server port for IX
if systype = 0 then
	username$=mid$(stp$,6,32)
	if username$="" then username$="admin"
	open "STP:800" as H_STP : read H_STP, stp$ : close H_STP
	password$=mid$(stp$,10,32) 
	if password$="" then password$="admin"
	
	'get app server port for IX
	port_app = midget(stp$,2,2)
	if port_app = 0 then port_app=PORT_DEFAULT_APP
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
	
	open "STP:500" as H_STP : read H_STP, stp$ : close H_STP
	' - get IX Mobile app IP addresses
	dim ipapp(8)
	for i=0 to 7
		ipapp(i) = midget(stp$,41+(i*4),4)
	next i
endif

if systype = 1 then
	dim srclid,dstlid(20)
	dim srcsid,dstsid(20)
	
	open "STP:500" as H_STP : read H_STP, stp$ : close H_STP

	' - linked stations -
	dim ipls(32)
	' - term ids/station numbers -
	dim lids(32), sids(32)

	' get 32 linked station IPs
	for i=0 to 31
		ipls(i) = midget(stp$,41+(i*4),4)
	next i

	' get 32 linked station termids
	open "STP:860" as H_STP : read H_STP, stp$ : close H_STP	
	for i=0 to 31	
		lids(i) = midget(stp$,1+i,1)
		sids(i) = midget(stp$,81+(i*2),2)	
	next i

	for i=0 to 31
		sysd sprintf$("%02d: ",i+1) + sprintf$("%lA",ipls(i)) + "  " + &
			sprintf$("%02d-",lids(i)) + sprintf$("%03d",sids(i))
	next i
endif

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Relay Output Settings: action type, local/system ids and digits, get mask for IS, IX, and IPW
10
open "STP:1180" as H_STP : read H_STP, stp$ : close H_STP

' ~Relay Output Functionality in ryip44_uiappsetup.html
relay_cfg(0)=midget(stp$,1,1)
relay_cfg(1)=midget(stp$,2,1)
relay_cfg(2)=midget(stp$,3,1)
relay_cfg(3)=midget(stp$,4,1)

' reset all relays, check if some are normally closed
for x = 0 to 3
	if relay_cfg(x)=1 then ioctl x+1,1 else ioctl x+1,0
next x

sysd "relay_cfg(0): "+str$(relay_cfg(0))
sysd "relay_cfg(1): "+str$(relay_cfg(1))
sysd "relay_cfg(2): "+str$(relay_cfg(2))
sysd "relay_cfg(3): "+str$(relay_cfg(3))

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
	if systype = 1 then sysd "relay_term-id("+str$(i)+"): "+sprintf$("%02d-",relay_alid(i))+sprintf$("%03d",relay_asid(i))
	if systype = 0 then sysd "relay_statnum("+str$(i)+"): "+relay_statn$
	if systype = 2 then sysd "relay_station_id("+str$(i)+"): "+sprintf$("%05d",relay_alid(i)*1000+relay_asid(i))
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
open "STP:720" as H_STP : read H_STP, stp$ : close H_STP
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
open "STP:700" as H_STP : read H_STP, stp$ : close H_STP
dest_enable_masks(0)=midget(stp$,1,4)
dest_enable_masks(1)=midget(stp$,5,4)
dest_enable_masks(2)=midget(stp$,9,4)
dest_enable_masks(3)=midget(stp$,13,4)

sysd "uri_dest_enable_masks(0): "+sprintf$("%05d",dest_enable_masks(0))
sysd "uri_dest_enable_masks(1): "+sprintf$("%05d",dest_enable_masks(1))
sysd "uri_dest_enable_masks(2): "+sprintf$("%05d",dest_enable_masks(2))
sysd "uri_dest_enable_masks(3): "+sprintf$("%05d",dest_enable_masks(3))

' Create complete setUri string
open "STP:1240" as H_STP : read H_STP, stp$ : close H_STP
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

seturi0$=seturi0$+http$ : sysd "seturi0$: "+seturi0$
seturi1$=seturi1$+http$ : sysd "seturi1$: "+seturi1$
seturi2$=seturi2$+http$ : sysd "seturi2$: "+seturi2$
seturi3$=seturi3$+http$ : sysd "seturi3$: "+seturi3$

sysi "opening SIF TCP port..."
open "TCN:0.0.0.0:"+str$(port_sif) as H_TCP_SIF

if systype = 0 then
	for i=0 to 7
		sysd "IX Mobile " + sprintf$("%01d: ",i+1) + sprintf$("%lA",ipapp(i))
	next i
	sysi "opening IX Mobile TCP port..."
	open "TCN:0.0.0.0:"+str$(port_app) as H_TCP_APP
endif

goto MAINLOOP

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'IPW-1A Loop
20	
	sysi "opening UDP port..."
	open "UDP:0.0.0.0:"+str$(port_udp) as H_UDP_SIF

MAINLOOPIPW
	'check udp event, always
	check_udp_evt()
	'check events
	if check_udp_evt=1 then process_udp_evt()
	goto MAINLOOPIPW
	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'check_udp_evt()
1010	
	check_udp_evt=0
	l = lastlen(H_UDP_SIF)
	if l>=0 then return
	read H_UDP_SIF,_Min$
	x=midget(_Min$,1,4)
	if x=&H01504941 then check_udp_evt=1
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
'process_udp_evt()
1020	
	sysd "process_udp_evt(): processing event from "+udprmt$
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
	sysd str$(msg)
1022
	return


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'udp_evt_begin_call()	
1030
	sysd "udp_evt_begin_call()"
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
	sysd "udp_evt_begin_comm()"
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
	sysd "udp_evt_door_release()"
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
	sysd "udp_evt_stay_alive()"
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
	sysd "udp_evt_init_notice()"
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
	sysd "udp_evt_close_door()"
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
	sysd "udp_evt_monitoring()"
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

MAINLOOP

	' check for sif event, always
	check_tcp_evt(H_TCP_SIF)
	' check events
	if check_tcp_evt=1 then process_sif_evt()
	' check and process input contacts
	process_contacts()
	' check for and process app keepalive, if IX system
	if systype = 0 then check_tcp_evt(H_TCP_APP)
	goto MAINLOOP

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' check_tcp_evt()
2000
	local mtype
	check_tcp_evt=0
	if connected(mtype) then
		if mtype = H_TCP_SIF then sysd "check_tcp_evt(): SIF port connection established"
		if mtype = H_TCP_APP then sysd "check_tcp_evt(): APP port connection established"
		tcprmt$=rmthost$(mtype)
		get_tcp_msg(mtype, LEN_TCP_EVT)
		if get_tcp_msg=1 then
			if mtype = H_TCP_SIF then 
				sysd "check_tcp_evt(): SIF event received, sending ack"
				write mtype, "ACK", 3	
			endif
			if mtype = H_TCP_APP then process_app_evt()
			' SIF spec: remote peer must close now,
			' so check socket to be closed from remote side
			x=_TMR_(0)
2001		if connected(mtype) then
				tmp$=rmthost$(mtype)
				if tmp$=tcprmt$ then
					' exit after 200 msecs timeout (force close). 
					' changed 200 to 50: IX audio while calling was quickest
					if _TMR_(0)-x>50 then
						syse "check_tcp_evt(): force close for timeout"
						close_reopen_tcp(mtype)
						goto 2002
					endif
				else
					sysd "connected host changed! exiting check_tcp_evt()"
					' another connection is established in the meantime.
					' assume here (SIF SPEC) the previous has been closed.
					' don't do anything here, just process previous event
					goto 2002
				endif
				goto 2001
			else
				sysd "check_tcp_evt(): remote peer closed"
			endif
2002		check_tcp_evt=1 : return
		else
			syse "check_tcp_evt(): rx timeout, brutal close"
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
#define TOUT_TCP_MSG   300
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
	if _TMR_(0)-tmr_out>TOUT_TCP_MSG then goto 2012
	goto 2011
2012
	return
	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' process_app_evt()
2015
	sysd "process_app_evt(): processing event from "+tcprmt$
	x=val(mid$(_Msm$,1,4))
	y=val(mid$(_Msm$,17,4))
	z=check_auth()
	
	if x<100 then
		sysw "invalid program type "+str$(x)+" received, discarding data"
		return
	endif
	
	'if and(y=1110, z=1) then
	if z=1 then
		sysd "process_app_evt(): APP keepalive received, sending ack"
		write H_TCP_APP, "ACK", 3
	else
		sysd "process_app_evt(): invalid APP keepalive received, sending nak"
		write H_TCP_APP, "NAK", 3
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' process_sif_evt()
2020
	sysd "process_sif_evt(): processing event from "+tcprmt$

	' get program type
	x=val(mid$(_Msm$,1,4))
	if x<100 then
		sysw "invalid program type "+str$(x)+" received, discarding data"
		return
	endif

	' get TermIDs or Station Numbers always
	if systype = 1 then
		srclid=val(mid$(_Msm$,33,2))
		srcsid=val(mid$(_Msm$,36,3))
		dstlid(0)=val(mid$(_Msm$,41,2))
		dstsid(0)=val(mid$(_Msm$,44,3))
		sysd "process_sif_evt(): src TermID: "+sprintf$("%02d-",srclid)+sprintf$("%03d",srcsid)
		sysd "process_sif_evt(): dst TermID: "+sprintf$("%02d-",dstlid(0))+sprintf$("%03d",dstsid(0))
	endif
	if systype = 0 then
		srcnumber$ = mid$(_Msm$,33,5)
		dstnumber$ = mid$(_Msm$,41,5)
		sysd "process_sif_evt(): src Station Number: "+srcnumber$ 
		sysd "process_sif_evt(): dst Station Number: "+dstnumber$
	endif
	
	' get SIF event type
	y=val(mid$(_Msm$,17,4))
	
	if y=0000 then
		' get 1 to 19 termid's
		sysd "process_sif_evt(): get all 20 dest TermID/Station Numbers"
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
	
	sysd "unhandled sif event: "+str$(y)+", discarding"	
2021
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_begin_call()
2030
	sysd "sif_evt_begin_call()"
	
	sif_evt_begin_call=0

	for x = 0 to 3
		if or(relay_cfg(x)=2,relay_cfg(x)=4) then
			z=check_assigned_src_termid(x,1) : if z=0 then goto 2031
			ioctl x+1,1
		endif
2031
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_begin_comm()
2040
	sysd "sif_evt_begin_comm()"

	sif_evt_begin_comm=0

	for x = 0 to 3
		' check srcdst validation for ext signalling only
		if relay_cfg(x)>1 then
			z=check_assigned_srcdst_termid(x,0) : if z=0 then goto 2041
			if or(relay_cfg(x)=3,relay_cfg(x)=4) then
				ioctl x+1,1
			else 
				if relay_cfg(x)=2 then ioctl x+1,0
			endif
		endif
2041
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_end_comm()
2060
	sysd "sif_evt_end_comm()"

	sif_evt_end_comm=0

	' relay back open only if not set as door release
	for x = 0 to 3
		z=check_assigned_srcdst_termid(x,0) : if z=0 then goto 2061
		if relay_cfg(x)>1 then ioctl x+1,0
2061
	next x
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_door_release() for IS
2050
	sysd "sif_evt_door_release()"

	sif_evt_door_release=0

	'get contact state, release the door=1, close=0
	y=midget(_Msm$,200+1,1)-&H30
	sysd "sif_evt_door_release(): contact state: "+str$(y)

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
	sysd "sif_evt_chg_contact()"

	sif_evt_chg_contact=0
	
	x=midget(_Msm$,216+1,1)-&H30
	' 0 = physical input of the door station
	' 1 = contact output state for door release
	' 2 = calling output (built-in hardware output on some door stations)
	' 3 = output during comm. (as 2, built-in hardware output on some door stations)
	if x<>1 then
		sysd "sif_evt_chg_contact(): unhandled contact change event: "+str$(x)
		return
	endif
	
	' is there a door release trigger (start) enabled for IS?
	if systype = 1 then
		for i=0 to 3
			if door_release_trigger(i)=1 then goto 2071
		next i
	
		sysd "sif_evt_chg_contact(): no door release trigger active, discarding"
		return
	endif

2071
	y=midget(_Msm$,217+1,1)-&H30
	sysd "sif_evt_chg_contact(): contact state: "+str$(y)
	
	z=val(mid$(_Msm$,248+1,4))
	sysd "RY" + str$(z)
	if or(z=1,z=0) then  ' only process event for RY1, not 0002
		'normally, 0=open,1=closed, but logic can be inverted
		for x = 0 to 3
			'door release only
			if or(relay_cfg(x)=0,relay_cfg(x)=1) then
				z=check_assigned_src_termid(x)
				if and(z=1,y=0,door_release_trigger(x)=1) then	
					sysd "sif_evt_chg_contact(): door closed"
					door_release_trigger(x)=0 
					if relay_cfg(x)=0 then ioctl 1+x,0 else ioctl 1+x,1
					timer x+1,0
				endif
				if systype = 1 then goto 2072
				if and(z=1,y=1) then
					sysd "sif_evt_chg_contact(): door released"
					door_release_trigger(x)=1
					if relay_cfg(x)=0 then ioctl 1+x,1 else ioctl 1+x,0
					timer x+1,300000
				endif
				' no "on/unassigned" handling
			endif
2072
		next x
	else	
		sysd "Ignoring RY" + str$(z)
	endif
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' sif_evt_init_notice()
2080
	sysd "sif_evt_init_notice()"
	
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
	if mtype2 = H_TCP_SIF then 
		open "TCN:0.0.0.0:"+str$(port_sif) as H_TCP_SIF
		goto 2101
	endif
	if mtype2 = H_TCP_APP then 
		open "TCN:0.0.0.0:"+str$(port_app) as H_TCP_APP
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
					sysd "contact closure "+str$(q+1)+" detected"
					cclosed(q)
				else
					sysd "contact "+str$(q+1)+" released"
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

	sysd "cclosed(): contact ["+str$(ccont)+"] closed"
	
	if callin_sources(ccont)=0 then return

	callin_retries=0
3011
	callin_set_uri(ccont)
	if callin_set_uri=1 then
		sysd "callin_set_uri success"
		callin_retries=0
3012	callin_callup(ccont)
		if callin_callup=1 then
			sysd "callin_callup success"
			callin_retries=0
3013		callin_set_uri_undo(ccont)
			if callin_set_uri_undo=1 then
				sysd "callin_set_uri_undo success"
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
	syse "call-in process failed after 3 retries, exiting."
	return
3014
	sysd "callin successful"
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
							sysd "check_auth(): sender authorized"
							check_auth=1
							goto 4001
						endif
					endif
				endif
			next k
		syse "check_auth() : sender TermID not authorized"
		endif		
		if systype = 0 then
			for k=0 to 8
				if and(ipapp(k)<>0, ipapp(k)=tcp_sender) then
					sysd "check_auth(): sender authorized"
					check_auth=1
					goto 4001
				endif
			next k
		syse "check_auth(): sender not authorized"
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
			sysd "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned TermID matched"
		else
			syse "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned TermID unmatched"
		endif
	endif
	if systype = 0 then
		poss = 0		
		for b=0 to (rels-1)
			poss = poss + relay_adig(b)
		next b

		'sysd "check_assigned_src_termid(): is src "+srcnumber$+"? assigned: "+mid$(relay_astat$,poss+1,relay_adig(rels))
		if mid$(relay_astat$,poss+1,relay_adig(rels)) = srcnumber$ then
			check_assigned_src_termid=1
			sysd "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned Station Number matched"			
		else
			syse "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned Station Number unmatched"
		endif
	endif
	if systype = 2 then
		if and(relay_alid(rels)*1000+relay_asid(rels)=srcid) then
			check_assigned_src_termid=1
			sysd "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned Station ID matched"
		else
			syse "check_assigned_src_termid(): relay "+str$(rels+1)+" assigned Station ID unmatched"
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
			sysd "check_assigned_dst_termid(): relay "+str$(reld+1)+" assigned TermID matched"
		else
			syse "check_assigned_dst_termid(): relay "+str$(reld+1)+" assigned TermID unmatched"
		endif
	endif
	if systype = 0 then
		LOCAL posd
		posd=0
		for a=0 to (reld-1)
			posd = posd + relay_adig(a)
		next a
		'sysd "check_assigned_dst_termid(): is dst "+dstnumber$+"? assigned: "+mid$(relay_astat$,posd+1,relay_adig(reld))
		if mid$(relay_astat$,posd+1,relay_adig(reld)) = dstnumber$ then
			check_assigned_dst_termid=1
			sysd "check_assigned_dst_termid(): relay "+str$(reld+1)+" assigned Station Number matched"
		else
			syse "check_assigned_dst_termid(): relay "+str$(reld+1)+" assigned Station Number unmatched"
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
		sysd "check_assigned_srcdst_termid(): checking all 20 SIF dest TermID's ..."
		for i=0 to 19
			if systype = 1 then
				if and(relay_alid(relsd)=dstlid(i),relay_asid(relsd)=dstsid(i)) then
					check_assigned_srcdst_termid=1
					sysd "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" multiple assigned TermID matched"
					goto 4031
				endif
			endif
			if systype = 0 then
				'sysd "check_assigned_srcdst_termid(): is dst "+dstnumber$+"? assigned: "+mid$(relay_astat$,possd+1,relay_adig(relsd))
				if mid$(relay_astat$,possd+1,relay_adig(relsd)) = dstnumber$ then
					check_assigned_srcdst_termid=1
					sysd "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" multiple assigned Station Number matched"
					goto 4031
				endif
			endif
		next i
	else
		if systype = 1 then
			if and(relay_alid(relsd)=dstlid(0),relay_asid(relsd)=dstsid(0)) then
				check_assigned_srcdst_termid=1
				sysd "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned TermID matched"
				goto 4031
			endif
		endif
		if systype = 0 then
			'sysd "check_assigned_srcdst_termid(): is dst "+dstnumber$+"? assigned: "+mid$(relay_astat$,possd+1,relay_adig(relsd))
			if mid$(relay_astat$,possd+1,relay_adig(relsd)) = dstnumber$ then
				check_assigned_srcdst_termid=1
				sysd "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned Station Number matched"
				goto 4031
			endif
		endif
	endif
	if systype = 1 then
		if and(relay_alid(relsd)=srclid,relay_asid(relsd)=srcsid) then
			check_assigned_srcdst_termid=1
			sysd "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned TermID matched"
			goto 4031
		else
			sysd "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned TermID unmatched"
		endif
	endif
	if systype = 0 then
		'sysd "check_assigned_srcdst_termid(): is src "+srcnumber$+"? assigned: "+mid$(relay_astat$,possd+1,relay_adig(relsd))
		if mid$(relay_astat$,possd+1,relay_adig(relsd)) = srcnumber$ then
			check_assigned_srcdst_termid=1
			sysd "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned Station Number matched"
			goto 4031
		else
			syse "check_assigned_srcdst_termid(): relay "+str$(relsd+1)+" assigned Station Number unmatched"
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

	sysd "open_callin_socket(): connecting"
	open tmp$ as H_TCP_CALLIN
	if mediatype(H_TCP_CALLIN)=0 then
		syse "open_callin_socket(): error opening/connecting TCP handle"
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
5001	write H_TCP_CALLIN, seturi0$, len(seturi0$) : goto 5005
5002	write H_TCP_CALLIN, seturi1$, len(seturi1$) : goto 5005
5003	write H_TCP_CALLIN, seturi2$, len(seturi2$) : goto 5005
5004	write H_TCP_CALLIN, seturi3$, len(seturi3$) : goto 5005
5005
		callin_get_http_reply()
		if callin_get_http_reply=1 then
			x=val(mid$(_Min$,n+7))
			if x=0 then 
				callin_set_uri=1
			else
				translate_error(x) : syse "callin_set_uri() : call error ["+tmp$+"]"
			endif
		else
			callin_set_uri=callin_get_http_reply
		endif

		if mediatype(H_TCP_CALLIN) then close H_TCP_CALLIN
	else
		syse "callin_set_uri() : no URI TermID has been set/enabled, exiting"
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
	write H_TCP_CALLIN, tmp$, len(tmp$)

	callin_get_http_reply()
	if callin_get_http_reply=1 then
		x=val(mid$(_Min$,n+7))
		if x=0 then
			callin_callup=1
		else
			translate_error(x) : syse "callin_callup() : call error ["+tmp$+"]"
		endif
	else
		callin_callup=callin_get_http_reply
	endif

	if mediatype(H_TCP_CALLIN) then close H_TCP_CALLIN
	return

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''	
' callin_set_uri_undo()
5020
	LOCAL uuin

	callin_set_uri_undo=0

	open_callin_socket(uuin)
	if open_callin_socket=0 then return

	write H_TCP_CALLIN, cuu$, len(cuu$)

	callin_get_http_reply()
	if callin_get_http_reply=1 then
		x=val(mid$(_Min$,n+7))
		if x=0 then 
			callin_set_uri_undo=1
		else
			translate_error(x) : syse "callin_set_uri_undo() : call error ["+tmp$+"]"
		endif
	else
		callin_set_uri_undo=callin_get_http_reply
	endif

	if mediatype(H_TCP_CALLIN) then close H_TCP_CALLIN
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
		read H_TCP_CALLIN,_Msm$ : l=lastlen(H_TCP_CALLIN) 
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
					syse "callin_get_http_reply() : incorrect http reply"
					goto 5034
				endif
			endif
		endif
		if systype = 1 then
			if _TMR_(0)-x>500 then
				syse "callin_get_http_reply() : timeout error"
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
	close H_TCP_CALLIN
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
		syse "safety timer : no station keep alive message, closing relay 1"
		ioctl 1,0
		any_call_src = 0
	endif
	if door_release_trigger(0)=1 then
		syse "safety timer : relay 1 detected door released, closing"
		door_release_trigger(0)=0
		if or(relay_cfg(0)=0,relay_cfg(0)=1) then
				if relay_cfg(0)=0 then ioctl 1,0 else ioctl 1,1
		endif
	endif
	timer 1,0
	return

200
	if and(systype=2,door_release_trigger(1)=0) then
		syse "safety timer : no station keep alive message, closing relay 2"
		ioctl 2,0
		any_call_src = 0
	endif
	if door_release_trigger(1)=1 then
		syse "safety timer : relay 2 detected door released, closing"
		door_release_trigger(1)=0
		if or(relay_cfg(1)=0,relay_cfg(1)=1) then
				if relay_cfg(1)=0 then ioctl 2,0 else ioctl 2,1
		endif
	endif
	timer 2,0
	return
300
	if and(systype=2,door_release_trigger(2)=0) then
		syse "safety timer : no station keep alive message, closing relay 3"
		ioctl 3,0
		any_call_src = 0
	endif
	if door_release_trigger(2)=1 then
		syse "safety timer : relay 3 detected door released, closing"
		door_release_trigger(2)=0
		if or(relay_cfg(2)=0,relay_cfg(2)=1) then
				if relay_cfg(2)=0 then ioctl 3,0 else ioctl 3,1
		endif
	endif
	timer 3,0
	return

400
	if and(systype=2,door_release_trigger(3)=0) then
		syse "safety timer : no station keep alive message, closing relay 4"
		ioctl 4,0
		any_call_src = 0
	endif
	if door_release_trigger(3)=1 then
		syse "safety timer : relay 4 detected door released, closing"
		door_release_trigger(3)=0
		if or(relay_cfg(3)=0,relay_cfg(3)=1) then
				if relay_cfg(3)=0 then ioctl 4,0 else ioctl 4,1
		endif
	endif
	timer 4,0
	returnHTTP/1.0 200
Content-type: application/x-javascript

//<!-- &L(0,"*"); -->
var lsip = new Array();
var lids = new Array();
var sids = new Array();
var digits = new Array();
var lidr = new Array();
var sidr = new Array();
var digitr = new Array();
var input,output;
var systype=&LSetup(1,"%lu",500,B);

// get setups for local system ip addresses for IS, app ip addresses for IX
lsip[ 0]=&LSetup(1,"%lu",540,D);;lsip[ 1]=&LSetup(1,"%lu",544,D);;lsip[ 2]=&LSetup(1,"%lu",548,D);;lsip[ 3]=&LSetup(1,"%lu",552,D);;
lsip[ 4]=&LSetup(1,"%lu",556,D);;lsip[ 5]=&LSetup(1,"%lu",560,D);;lsip[ 6]=&LSetup(1,"%lu",564,D);;lsip[ 7]=&LSetup(1,"%lu",568,D);;
lsip[ 8]=&LSetup(1,"%lu",572,D);;lsip[ 9]=&LSetup(1,"%lu",576,D);;lsip[10]=&LSetup(1,"%lu",580,D);;lsip[11]=&LSetup(1,"%lu",584,D);;
lsip[12]=&LSetup(1,"%lu",588,D);;lsip[13]=&LSetup(1,"%lu",592,D);;lsip[14]=&LSetup(1,"%lu",596,D);;lsip[15]=&LSetup(1,"%lu",600,D);;
lsip[16]=&LSetup(1,"%lu",604,D);;lsip[17]=&LSetup(1,"%lu",608,D);;lsip[18]=&LSetup(1,"%lu",612,D);;lsip[19]=&LSetup(1,"%lu",616,D);;
lsip[20]=&LSetup(1,"%lu",620,D);;lsip[21]=&LSetup(1,"%lu",624,D);;lsip[22]=&LSetup(1,"%lu",628,D);;lsip[23]=&LSetup(1,"%lu",632,D);;
lsip[24]=&LSetup(1,"%lu",636,D);;lsip[25]=&LSetup(1,"%lu",640,D);;lsip[26]=&LSetup(1,"%lu",644,D);;lsip[27]=&LSetup(1,"%lu",648,D);;
lsip[28]=&LSetup(1,"%lu",652,D);;lsip[29]=&LSetup(1,"%lu",656,D);;lsip[30]=&LSetup(1,"%lu",660,D);;lsip[31]=&LSetup(1,"%lu",664,D);;

// system local id's: reading dwords for IS
lids[0]=&LSetup(1,"%lu",860,D);;lids[1]=&LSetup(1,"%lu",864,D);;lids[2]=&LSetup(1,"%lu",868,D);;lids[3]=&LSetup(1,"%lu",872,D);;
lids[4]=&LSetup(1,"%lu",876,D);;lids[5]=&LSetup(1,"%lu",880,D);;lids[6]=&LSetup(1,"%lu",884,D);;lids[7]=&LSetup(1,"%lu",888,D);;

// system system id's: reading dwords for IS
sids[0]=&LSetup(1,"%lu",940,D);;sids[1]=&LSetup(1,"%lu",944,D);;sids[2]=&LSetup(1,"%lu",948,D);;sids[3]=&LSetup(1,"%lu",952,D);;
sids[4]=&LSetup(1,"%lu",956,D);;sids[5]=&LSetup(1,"%lu",960,D);;sids[6]=&LSetup(1,"%lu",964,D);;sids[7]=&LSetup(1,"%lu",968,D);;
sids[8]=&LSetup(1,"%lu",972,D);;sids[9]=&LSetup(1,"%lu",976,D);;sids[10]=&LSetup(1,"%lu",980,D);;sids[11]=&LSetup(1,"%lu",984,D);;
sids[12]=&LSetup(1,"%lu",988,D);;sids[13]=&LSetup(1,"%lu",992,D);;sids[14]=&LSetup(1,"%lu",996,D);;sids[15]=&LSetup(1,"%lu",1000,D);;

// configured triggers for relay output: reading bytes of local id's and words of system id's
lidr[0]=&LSetup(1,"%u",1184,B);;lidr[1]=&LSetup(1,"%u",1185,B);;lidr[2]=&LSetup(1,"%u",1186,B);;lidr[3]=&LSetup(1,"%u",1187,B);;
sidr[0]=&LSetup(1,"%u",1188,W);;sidr[1]=&LSetup(1,"%u",1190,W);;sidr[2]=&LSetup(1,"%u",1192,W);;sidr[3]=&LSetup(1,"%u",1194,W);;
if (systype==0){
	digitr[0]=&LSetup(1,"%u",1196,B);;digitr[1]=&LSetup(1,"%u",1197,B);;digitr[2]=&LSetup(1,"%u",1198,B);;digitr[3]=&LSetup(1,"%u",1199,B);;
}

/*----------------------------------------------------------------------------*/
function zpad(str,p) {
	rstr = "00000".substr(0,p-str.length)+str;
	return rstr;
}
/*----------------------------------------------------------------------------*/
function gen_ip_termid (a,x,color) {
	var lid,sid,port;
	document.write('<td bgcolor='+color+' align="center"><b>'+(x+1)+'</b><td bgcolor='+color+' align="center">');
	document.write('<input name=B'+(a)+' class=ib maxlength=3 size=1 value='+(lsip[x]&0xff)+' onChange=IPCheck(this)><b>.</b>');
	document.write('<input name=B'+(a+1)+' class=ib maxlength=3 size=1 value='+(lsip[x]>>8&0xff)+' onChange=IPCheck(this)><b>.</b>');
	document.write('<input name=B'+(a+2)+' class=ib maxlength=3 size=4 value='+(lsip[x]>>16&0xff)+' onChange=IPCheck(this)><b>.</b>');
	document.write('<input name=B'+(a+3)+' class=ib maxlength=3 size=4 value='+(lsip[x]>>24&0xff)+' onChange=IPCheck(this)>');
	if (systype==0) return;
	lid = (lids[parseInt(x/4)]>>((x%4)*8))&0xff;
	sid = (sids[parseInt(x/2)]>>((x%2)*16))&0xffff;
	document.write('<td bgcolor='+color+' align="center"><input id=lid'+x+' class=ib maxlength=2 size=3 value='+zpad(lid.toString(),2)+' onChange=IPCheck(this)><b>-</b>');
	document.write('<input id=sid'+x+' class=ib maxlength=3 size=4 value='+zpad(sid.toString(),3)+' onChange=IPCheck(this)>');
}
/*----------------------------------------------------------------------------*/
function gen_table_linked_stations() {
	var x,a;
	if (systype==2) return;
	if (systype==0) return;
	document.write('<tr><td>&nbsp;<tr><td colspan=5><b><font size=3>Linked Stations</font></b><br>')
	document.write('<table class=\"bottomBorder\" id=stations><tr><td align="center"><b>#</b><td align="center"><b>IP Address</b><td align="center"><b>TermID</b><td align="center"><b>#</b><td align="center"><b>IP Address</b><td align="center"><b>TermID</b>');
	for (a=540,x=0;x<16;++x,a+=4) {
		document.write('<tr>');
		gen_ip_termid(a,x,x%2?"#d0d0d0":"#ffffff");
		gen_ip_termid(a+(64),x+16,x%2?"#ffffff":"#d0d0d0");
	}
	document.write('</table>');
}
/*----------------------------------------------------------------------------*/
function gen_table_relay_output(numb) {
	var x,statnr;
	if (numb==-1 && systype==1) {document.write('<table><tr><td align="center"><b>Relay</b><td align="center"><b>Door TermID</b><td align="center"><b>Relay Action</b><td><td>');}
	else if (numb==-1 && systype==0) {document.write('<table><tr><td align="center"><b>Relay</b><td align="center"><b>Station Number</b><td align="center"><b>Relay Action</b><td><td>');}
	else if (numb==-1 && systype==2) {document.write('<table><tr><td align="center"><b>Relay</b><td align="center"><b>Station ID</b><td align="center"><b>Relay Action</b><td><td>');}
	else if (numb>=0) {
		document.write('<tr><td align="center"><b>'+(numb+1)+'</b>')
		if (systype==1) {
			document.write('<td><input id=lidr'+numb+' class=ib size=3 maxlength=2 value='+zpad(lidr[numb].toString(),2)+'>-');
			document.write('<input id=sidr'+numb+' class=ib size=4 maxlength=3 value='+zpad(sidr[numb].toString(),3)+'>');
		} else {
			statnr = lidr[numb]*1000+sidr[numb]
			document.write('<td align="center"><input id=statnr'+numb+' class=ic size=6 maxlength=5 value='+zpad(statnr.toString(),digitr[numb])+'>');
		}
	}
}
/*----------------------------------------------------------------------------*/
function gen_table_remote_callin(){
	if (systype==2) return;
	document.write('<tr><td>&nbsp;<tr>');
	document.write('<td colspan=5><b><font size=3>Remote Call-In</font></b><br>');
	document.write('<tr><td align="center"><b>Relay</b><td align="center"><b>Priority</b><td align="center"><b>Target ');
	if (systype==1) document.write('Door ');
	document.write('IP</b><td align="center"><b>Setup</b>');
	document.write('<tr><td align="center"><b>1</b>');
	document.write('<td align="center"><select name=B1220><option value=0 &LSetup(3,"%s",1220,B,0,"selected");>Normal</option><option value=1 &LSetup(3,"%s",1220,B,1,"selected");>Priority</option><option value=2 &LSetup(3,"%s",1220,B,2,"selected");>Urgent</option></select>');
	document.write('<td align="center"><input name=B1224 size=3 maxlength=3 value=&LSetup(1,"%u",1224); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1225 size=3 maxlength=3 value=&LSetup(1,"%u",1225); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1226 size=3 maxlength=3 value=&LSetup(1,"%u",1226); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1227 size=3 maxlength=3 value=&LSetup(1,"%u",1227); onChange=IPCheck(this)>');
	document.write('<td align="center"><input type=button value=" Destinations " onClick="popup_dest(0)">');
	document.write('<tr><td align="center"><b>2</b>');
	document.write('<td align="center"><select name=B1221><option value=0 &LSetup(3,"%s",1221,B,0,"selected");>Normal</option><option value=1 &LSetup(3,"%s",1221,B,1,"selected");>Priority</option><option value=2 &LSetup(3,"%s",1221,B,2,"selected");>Urgent</option></select>');
	document.write('<td align="center"><input name=B1228 size=3 maxlength=3 value=&LSetup(1,"%u",1228); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1229 size=3 maxlength=3 value=&LSetup(1,"%u",1229); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1230 size=3 maxlength=3 value=&LSetup(1,"%u",1230); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1231 size=3 maxlength=3 value=&LSetup(1,"%u",1231); onChange=IPCheck(this)>');
	document.write('<td align="center"><input type=button value=" Destinations " onClick="popup_dest(1)">');
	document.write('<tr><td align="center"><b>3</b>');
	document.write('<td align="center"><select name=B1222><option value=0 &LSetup(3,"%s",1222,B,0,"selected");>Normal</option><option value=1 &LSetup(3,"%s",1222,B,1,"selected");>Priority</option><option value=2 &LSetup(3,"%s",1222,B,2,"selected");>Urgent</option></select>');
	document.write('<td align="center"><input name=B1232 size=3 maxlength=3 value=&LSetup(1,"%u",1232); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1233 size=3 maxlength=3 value=&LSetup(1,"%u",1233); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1234 size=3 maxlength=3 value=&LSetup(1,"%u",1234); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1235 size=3 maxlength=3 value=&LSetup(1,"%u",1235); onChange=IPCheck(this)>');
	document.write('<td align="center"><input type=button value=" Destinations " onClick="popup_dest(2)">');
	document.write('<tr><td align="center"><b>4</b>');
	document.write('<td align="center"><select name=B1223><option value=0 &LSetup(3,"%s",1223,B,0,"selected");>Normal</option><option value=1 &LSetup(3,"%s",1223,B,1,"selected");>Priority</option><option value=2 &LSetup(3,"%s",1223,B,2,"selected");>Urgent</option></select>');
	document.write('<td align="center"><input name=B1236 size=3 maxlength=3 value=&LSetup(1,"%u",1236); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1237 size=3 maxlength=3 value=&LSetup(1,"%u",1237); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1238 size=3 maxlength=3 value=&LSetup(1,"%u",1238); onChange=IPCheck(this)><b>&nbsp;.&nbsp;</b><input name=B1239 size=3 maxlength=3 value=&LSetup(1,"%u",1239); onChange=IPCheck(this)>');
	document.write('<td align="center"><input type=button value=" Destinations " onClick="popup_dest(3)">');
}
/*----------------------------------------------------------------------------*/
function gen_table_ix_mobile(){
	if (systype==1) return;
	if (systype==2) return;
	document.write('<td colspan=5><b><font size=3>IX Mobile Server Functionality</font></b><br>')
	document.write('<table class=\"bottomBorder\" id=stations><tr><td align="center"><b>Device</b><td align="center"><b>IP Address</b>');
	for (a=540,x=0;x<8;++x,a+=4) {
		document.write('<tr>');
		gen_ip_termid(a,x,x%2?"#d0d0d0":"#ffffff");
	}
	document.write('</table>');
}

/*----------------------------------------------------------------------------*/
function add_field(type, name, value) {
	var myin = document.createElement("input");
    myin.type='hidden';
    myin.name=type+name;
    myin.value=value;
    document.forms['settings'].appendChild(myin);
}
function get_lidsids() {
	var lofs=860,lid,sofs=940,sid;
	for (x=0;x<32;x++) {
		lid = document.getElementById('lid'+x).value;
		sid = document.getElementById('sid'+x).value;
		add_field("B",lofs,lid); lofs++;
		add_field("W",sofs,sid); sofs+=2;
	}
}
function get_lidrsidrs() {
	var ofs=1184,lidr,sidr,digitr,dofs=1196;
	for (x=0;x<4;x++) {
		if (systype==1) {
			lidr = document.getElementById('lidr'+x).value;
			sidr = document.getElementById('sidr'+x).value;
		} else {
			lidr = document.getElementById('statnr'+x).value/1000;
			sidr = document.getElementById('statnr'+x).value%1000;
			digitr = document.getElementById('statnr'+x).value.length;
			add_field("B",dofs,digitr); dofs++;
		}
		add_field("B",ofs,lidr); 
		add_field("W",ofs+4+x,sidr);
		ofs++;
	}
}
function submitForm() {
	if (systype==1) get_lidsids();
	get_lidrsidrs();
	document.forms['settings'].submit();
}
/*----------------------------------------------------------------------------*/
function popup(page,title,w) {
	var h=480;
	var left=(screen.width/2) -(w/2);
	var top =(screen.height/2)-(h/2);
	var style = "top="+top+",left="+left+",width="+w+",height="+h+",titlebar=1,status=0,location=0,menubar=0,toolbar=0,scrollbars=1,resizable=0";	
	window.open(page,title,style);
}
function popup_mask(out) {
	output=out;
	popup("ryip44_uimask.html","Allowed Stations",640);
}
function popup_dest(inpt) {
	input=inpt;
	popup("ryip44_uidest.html","Call-in Destinations",640);
}
/*----------------------------------------------------------------------------*/
function setup() {
	hide_config_button(1);
	hide_config_button(2);
	hide_config_button(3);
	hide_config_button(4);	
}
function hide_config_button(id) {
	var val=document.getElementById("sel"+id).value;
	if (val<2 && systype==1) document.getElementById("bc"+id).style.visibility='visible'; //only IS needs config button; IX built in
	else document.getElementById("bc"+id).style.visibility='hidden';
	if (systype == 2){
		var nid = id - 1;
		if (val==5){
			document.getElementById("statnr"+nid).disabled=true;
			document.getElementById("statnr"+nid).value='';
		}
		else document.getElementById("statnr"+nid).disabled=false;
	}
}TBe�$�I(@       .@      4@      6@      8@      :@      <@      >@      @@       B@     7L@     KW@     _b@     sm@     ��@      ��@      ��@      ��@      ��@      ��@      ��@     ��@     	�@     �@     )�@      9A      RA      VA      ZA      ^#A      b0A  ��  f>A  \�  jNA  E�  naA  ��  rtA  ��  v�A  	�  z�A  n�  ~�A  h�  ��A  ��  ��A  ��  ��A  z�  ��A  ��  � B  ��  �B  ��  �#B  v�  �6B  q�  �KB  ��  �\B  _�  �pB  q�  ��B  ��  ��B  Q�  ��B  N�  ��B  _�  ��B  ��  ��B  ��  ��B  ��  �
C  -�  �C  q�  �,C  �  �:C  �  �NC  K�  �dC  ��  �tC     �zC      
�C     �C      b�C     f�C      ��C      >�C      ��C      F�C      J�C  P   N�C     �#�C      �$�C      ���C      ���C      ���C      ���C      ���C      ���C      ���C      ���C      ���C      ���C      ���C      ���C      �� D      ��D      ��
D      �$D      ��D      ��D      ��D      ��*D      ��0D      ��6D      ��;D      ��@D      ��ED      ��PD    UD   ZD  x`D  x�fD   $kD   $pD   $vD   '|D   ��D  # ��D  # ��D   9�D   9�D   9�D   9�D   =�D   M�D   V�D   V�D   ��D   ��D   ��D   FE   �E   � E   �!E   �" E   �#� 	2.2 02.27.2019 ?AIPHONE RY-IP44 ver. �  starting... ?Station IP:  \%A ?markers: (i) info, (w) warning, (e) error, (-) debug `	;`�  H`/	1 ?(e)  incorrect hardware type, exiting "F= ,<= %== !>= $?-STP:500 .	0	�/	`	%�`	& ?(i)  Aiphone system type is IX `	& ?(i)  Aiphone system type is IS `	* ?(i)  Aiphone system type is IPW-1A `	" `	%�`		 `	�F`	 �`	%�`		 `	'`	d �		Z��		  �		aiphone -STP:810 .	0	�/	�
	Z��
	  �
	aiphone F`	� �		Z� �		  �		admin -STP:800 .	0	�/	�
	Z�
 �
	  �
	admin `	%�`		 `	�F`	G -STP:500 .	0	�/	`	`>`	%�)``F`	-STP:500 .	0	�/	`	`C`	%�)``-STP:860 .	0	�/	`	`D`	%�``E`	%�Q```	?(-)  \%02d:  `\%lA `C`   \%02d- `D`\%03d `E``F-STP:1180 .	0	�/	`		%�`		%�`		%�`		%�`	`	`	 <`E
 <``?(-)  relay_cfg(0):  X`	?(-)  relay_cfg(1):  X`	?(-)  relay_cfg(2):  X`	?(-)  relay_cfg(3):  X`	`	`
`	%�```	%�	``	p �	 ``	%�`�	X`
`�```F	``#�`F `G	`F�	0 �`GF�	��F`	J ?(-)  relay_term-id( X`):  \%02d- `
`\%03d ```	* ?(-)  relay_statnum( X`):  �`	F ?(-)  relay_station_id( X`):  \%05d `
`�````	 `	, `	``	%�``F`	%�)`	%�*`	%�+`	%�,`	%�-`	%�1`	%�5`	%�9�	YY
�	YY
YY
�	 HTTP/1.0 ���	GET /CallUP.cgi?ID= �	&PW= �
&Kind= �	GET /SetURIUndo.cgi?ID= �	&PW= �
��	GET /SetURI.cgi?ID= �	&PW= �
�	��	��	��	�-STP:720 .	0	�/	`	o `	`H`	%�``H`	%�``H(`	%�)``H<`	%�=``F-STP:700 .	0	�/	`	%�`	%�`	%�	`	%�?(-)  uri_dest_enable_masks(0):  \%05d `?(-)  uri_dest_enable_masks(1):  \%05d `?(-)  uri_dest_enable_masks(2):  \%05d `?(-)  uri_dest_enable_masks(3):  \%05d `-STP:1240 .	0	�/	`	`	6``	%�``	%�Q6``	| H`H``a `I	 `I	�	�&TermID= E �	�. `	I`�	�\%02d `- \%03d `FF`	� H`H`H``� �	X`�``F	`H`#�`F `G	`F�	0 �`GF`I	 `I	�	�&TermID= E �	�. `	I`�	��FF`	%�``	%�y6``	} H`H``b `I	 `I	�	�&TermID= E �	�. `	I`�	�\%02d `- \%03d `FF`	� H`H`H``� �	X`�``F	`H`#�`F `G	`F�	0 �`GF`I	 `I	�	�&TermID= E �	�. `	I`�	��FF`	%�)``	%�� 6``	� H`H``d `I	 `I	�	�&TermID= E �	�. `	I`�	�\%02d `- \%03d `FF`	� H`H(`H``� �	X`�``F	`H(`#�`F `G	`F�	0 �`GF`I	 `I	�	�&TermID= E �	�. `	I`�	��FF`	%�=``	%�� 6``	� H`H``d `I	 `I	�	�&TermID= E �	�. `	I`�	�\%02d `- \%03d `FF`	� H`H<`H``� �	X`�``F	`H<`#�`F `G	`F�	0 �`GF`I	 `I	�	�&TermID= E �	�. `	I`�	��FF`�	��?(-)  seturi0$:  ��	��?(-)  seturi1$:  ��	��?(-)  seturi2$:  ��	��?(-)  seturi3$:  �?(i)  opening SIF TCP port... -TCN:0.0.0.0: X`.`	� `	?(-)  IX Mobile  \%01d:  `\%lA `>``?(i)  opening IX Mobile TCP port... -TCN:0.0.0.0: X`.F�?(i)  opening UDP port... -UDP:0.0.0.0: X`.``	 `D`	`	2`	 !0�`	%�`	AIP `	!?(-)  process_udp_evt(): processing event from  �`J	%�`	%�`	%�`	  `"`	H` `` `%``	 ` �I`	`	`	 `!�`	 `#�`	A `$�`	 `&�?(-)  X`!?(-)  udp_evt_begin_call() ` 	`	I`	`	`	`	, `	`5``	 t<`>`'F`	`	: `	 `	`J<`>`'F`	`J >`'F`!?(-)  udp_evt_begin_comm() `!	`	`	`� H`	`	`	`J <`>``	F`	`5``	 OI`	`	`	`	 <`>`'E! `	`	
 <`>`FF`!?(-)  udp_evt_door_release() `"	`	I`	`	`	`	M `	`5``	 �``	>`�'	 `	`	 <`E
 <`F`!?(-)  udp_evt_stay_alive() `#	`	`	`X H`	`	`	`J <`>``	F`	`5``	 �<`>`F`!?(-)  udp_evt_init_notice() `$	`	H``	I`	`	`	`	H `	`5``	 �`	`	 <`E
 <```	>`F`	`W H`	`	`	`J <`>``	F`	`5``	 <`>`FF`!?(-)  udp_evt_close_door() `%	`	H``	I`	`	`	`	H `	`5``	 1`	`	 <`E
 <```	>`F`!?(-)  udp_evt_monitoring() `&	`	I`	`	`	`	* `	`5``	 �<`>`FH`	`	`	`J <`>``	F`!`'`'	 `*`2`		 `'�: `'	3`KN`K	= ?(-)  check_tcp_evt(): SIF port connection established `K	= ?(-)  check_tcp_evt(): APP port connection established �	]`K`(`KH`(	i`K	L ?(-)  check_tcp_evt(): SIF event received, sending ack 1`KACK F`K	 `)`	` 3`K� �	]`K�	�Y ` `2C ?(e)  check_tcp_evt(): force close for timeout `1`K2FEF ?(-)  connected host changed! exiting check_tcp_evt() 2FAE2 ?(-)  check_tcp_evt(): remote peer closed F`'	!EA ?(e)  check_tcp_evt(): rx timeout, brutal close `1`KFF!: `(	`N	`O	` 0`L�`	2`L`. &�`N`�`N	`N``N	`M `(	�F` `O, ��!?(-)  process_app_evt(): processing event from  �`	)Z�`	)Z�`	`4`dI ?(w)  invalid program type  X` received, discarding data !F`	T ?(-)  process_app_evt(): APP keepalive received, sending ack 1ACK EZ ?(-)  process_app_evt(): invalid APP keepalive received, sending nak 1NAK F!?(-)  process_sif_evt(): processing event from  �`	)Z�`dI ?(w)  invalid program type  X` received, discarding data !F`	� `?	)Z�!`A	)Z�$`@	)Z�)`B	)Z�,?(-)  process_sif_evt(): src TermID:  \%02d- `?\%03d `A?(-)  process_sif_evt(): dst TermID:  \%02d- `@\%03d `BF`	� �	Z�!�	Z�)?(-)  process_sif_evt(): src Station Number:  �?(-)  process_sif_evt(): dst Station Number:  �F`	)Z�`	� ?(-)  process_sif_evt(): get all 20 dest TermID/Station Numbers `	`	@ `@`	)Z�)``B`	)Z�,`F`	 �	�Z�)`F``+!F`	 `,!H`	
`	 `-!`	 `.!`	d `/!`	W `0!?(-)  unhandled sif event:  X`, discarding !?(-)  sif_evt_begin_call() `+	`	I`	`	`	`	$ `	`5``	 �!<`F`!?(-)  sif_evt_begin_comm() `,	`	`	`Z `	`7``	  "I`	`	`	`	 <`E `	`	
 <`FF`!?(-)  sif_evt_end_comm() `.	`	`	`7``	 �"`	`
 <``!?(-)  sif_evt_door_release() `-	`	%�� 0?(-)  sif_evt_door_release(): contact state:  X``	I`	`	`	`	o `	`6``	 �#`	`4``	 �#`	7 ``	>`�� `	`	 <`E
 <`FF`!?(-)  sif_evt_chg_contact() `/	`	%�� 0`N ?(-)  sif_evt_chg_contact(): unhandled contact change event:  X`!F`	q `	``	 �$`?(-)  sif_evt_chg_contact(): no door release trigger active, discarding !F`	%�� 0?(-)  sif_evt_chg_contact(): contact state:  X``	)Z�� ?(-)  RY X`I`	`	6`	I`	`	`	`		`	`5`H`	`	``	` ?(-)  sif_evt_chg_contact(): door closed ``	`	`	 <`E
 <`>`F`	 c&H`	`	f ?(-)  sif_evt_chg_contact(): door released ``	`	`	 <`E
 <`>`�� FF`E  ?(-)  Ignoring RY X`F!?(-)  sif_evt_init_notice() `0	`	I`	`	`	`	I `	`5``	2 `	`	 <`E
 <```	>`FE  `	`7``	
 <`F`!: /`P+`P	! -TCN:0.0.0.0: X`.�'F`P	" -TCN:0.0.0.0: X`.�'F!: `2	`	`Q	`R	H;� `Q`	I`6`R`Q`Q``� `R	J```Q	`S	6`QH`S`Ru H``S< ?(-)  contact closure  X`Q detected `3`QE+ ?(-)  contact  X`Q released FF`Q`	`F!: `3	?(-)  cclosed(): contact [ X`T] closed ``T	 !`	`9`T`9	� ?(-)  callin_set_uri success `	`:`T`:	� ?(-)  callin_callup success `	`;`T`;	1 ?(-)  callin_set_uri_undo success {*E/ `;	 `	`` p)E	 �*FFE/ `:	 `	`` ;)E	 �*FFE/ `9	 `	`` )E	 �*FF?(e)  call-in process failed after 3 retries, exiting. !?(-)  callin successful !: `4	`V	M�`V�`	� `W	 H`C`W`D`W`E`Ww H`C`W	`V`D`W	`?`E`W	`AP H``U6`W8 ?(-)  check_auth(): sender authorized `4	B,FFF`W?(e)  check_auth() : sender TermID not authorized F`	� `W	H`>`W`>`W	`V8 ?(-)  check_auth(): sender authorized `4	B,F`W?(e)  check_auth(): sender not authorized FF!:	 `5	`	� H`
`X	`?``X	`A\ `5	?(-)  check_assigned_src_termid(): relay  X`X assigned TermID matched EW ?(e)  check_assigned_src_termid(): relay  X`X assigned TermID unmatched FF`	`Y	`Z	`X`Y	`Y``Z`ZZ�`Y``X	�d `5	?(-)  check_assigned_src_termid(): relay  X`X assigned Station Number matched E_ ?(e)  check_assigned_src_termid(): relay  X`X assigned Station Number unmatched FF`	� H`
`X�``X	`J` `5	?(-)  check_assigned_src_termid(): relay  X`X assigned Station ID matched E[ ?(e)  check_assigned_src_termid(): relay  X`X assigned Station ID unmatched FF!: `6	`	� H`
`[	`@``[	`B\ `6	?(-)  check_assigned_dst_termid(): relay  X`[ assigned TermID matched EW ?(e)  check_assigned_dst_termid(): relay  X`[ assigned TermID unmatched FF`	: `\	`G	`[`\	`\``G`GZ�`\``[	�d `6	?(-)  check_assigned_dst_termid(): relay  X`[ assigned Station Number matched E_ ?(e)  check_assigned_dst_termid(): relay  X`[ assigned Station Number unmatched FF!: `	' `_	`G	`]`_	`_``G`GF`7	`^�?(-)  check_assigned_srcdst_termid(): checking all 20 SIF dest TermID's ... `	`	� H`
`]	`@```]	`B`k `7	?(-)  check_assigned_srcdst_termid(): relay  X`] multiple assigned TermID matched �5FF`	� Z�`_``]	�s `7	?(-)  check_assigned_srcdst_termid(): relay  X`] multiple assigned Station Number matched �5FF`E`	� H`
`]	`@``]	`Bb `7	?(-)  check_assigned_srcdst_termid(): relay  X`] assigned TermID matched �5FF`	� Z�`_``]	�j `7	?(-)  check_assigned_srcdst_termid(): relay  X`] assigned Station Number matched �5FFF`	� H`
`]	`?``]	`Ad `7	?(-)  check_assigned_srcdst_termid(): relay  X`] assigned TermID matched �5EZ ?(-)  check_assigned_srcdst_termid(): relay  X`] assigned TermID unmatched FF`	� Z�`_``]	�l `7	?(-)  check_assigned_srcdst_termid(): relay  X`] assigned Station Number matched �5Eb ?(e)  check_assigned_srcdst_termid(): relay  X`] assigned Station Number unmatched FF!: `8	�	TCP: \%lA ```:80 ?(-)  open_callin_socket(): connecting -�.4	J ?(e)  open_callin_socket(): error opening/connecting TCP handle !F`8	!: `9	H`6`a� `8`a`8	 !=`a�6�6�671�#�71�#�71�#�71�#�7`<`<	c `	)Z�``	 `9	E; `=`?(e)  callin_set_uri() : call error [ �] FE
 `9	`<F4 /EM ?(e)  callin_set_uri() : no URI TermID has been set/enabled, exiting F!: `:	`8`b`8	 !=``b%888M8�	�Normal ]8�	�Priority ]8�	�Urgent �	��1�#�`<`<	b `	)Z�``	 `:	E: `=`?(e)  callin_callup() : call error [ �] FE
 `:	`<F4 /!: `;	`8`c`8	 !1�#�`<`<	h `	)Z�``	 `;	E@ `=`?(e)  callin_set_uri_undo() : call error [ �] FE
 `;	`<F4 /!`<	`	` `	`	��  `	`]0�`	2`� &�``�`	```	``` �9`	$��`� `	$�Content-Length:  `3 `	)Z�``	```EB ?(e)  callin_get_http_reply() : incorrect http reply M;FFF`	T ` `�A ?(e)  callin_get_http_reply() : timeout error `<	M;FF�9E `	``<	F/!: `d <=`d�;�;�;�;�;�	ID/PW mismatch !�	incorrect argument !�	ineligible unit !�	overlapping CGI execution not possible !�	processing cannot be accepted !�	X`d!H`	`	V ?(e)  safety timer : no station keep alive message, closing relay 1 <`	F`	} ?(e)  safety timer : relay 1 detected door released, closing `	I`		`		 `			 <E <FF>!H`	`	W ?(e)  safety timer : no station keep alive message, closing relay 2 <`	F`	 ?(e)  safety timer : relay 2 detected door released, closing `	I`		`		 `		
 <E <FF>!H`	`	W ?(e)  safety timer : no station keep alive message, closing relay 3 <`	F`	� ?(e)  safety timer : relay 3 detected door released, closing `	I`		`		 `		
 <E <FF>!H`	`	W ?(e)  safety timer : no station keep alive message, closing relay 4 <`	F`	� ?(e)  safety timer : relay 4 detected door released, closing `	I`		`		 `		
 <E <FF>!_TMR_ HTYPE I L M N X Y Z RELAY_CFG RELAY_ALID RELAY_ASID RELAY_ADIG DOOR_RELEASE_TRIGGER IOSTATES IOSTATES_OLD SYSTYPE PORT_SIF PORT_UDP PORT_APP ALLOWED_MASK DEST_ENABLE_MASKS CALLIN_SOURCES CALLIN_SOURCES_PR URISET CLEN CALLIN_RETRIES MSG DRELEASE ANY_CALL_SRC CHECK_UDP_EVT PROCESS_UDP_EVT UDP_EVT_BEGIN_CALL UDP_EVT_BEGIN_COMM UDP_EVT_DOOR_RELEASE UDP_EVT_STAY_ALIVE UDP_EVT_INIT_NOTICE UDP_EVT_CLOSE_DOOR UDP_EVT_MONITORING CHECK_TCP_EVT GET_TCP_MSG PROCESS_APP_EVT PROCESS_SIF_EVT SIF_EVT_BEGIN_CALL SIF_EVT_BEGIN_COMM SIF_EVT_DOOR_RELEASE SIF_EVT_END_COMM SIF_EVT_CHG_CONTACT SIF_EVT_INIT_NOTICE CLOSE_REOPEN_TCP PROCESS_CONTACTS CCLOSED CHECK_AUTH CHECK_ASSIGNED_SRC_TERMID CHECK_ASSIGNED_DST_TERMID CHECK_ASSIGNED_SRCDST_TERMID OPEN_CALLIN_SOCKET CALLIN_SET_URI CALLIN_CALLUP CALLIN_SET_URI_UNDO CALLIN_GET_HTTP_REPLY TRANSLATE_ERROR IPAPP SRCLID DSTLID SRCSID DSTSID IPLS LIDS SIDS DIFF A DIG BLANK SRCID MTYPE MSTRM MLEN MOFFS TMR_OUT MTYPE2 Q E F CCONT RELM TCP_SENDER K RELS POSS B RELD POSD RELSD MULTIPLE_DEST POSSD SCONT SUIN CUIN UUIN HTML_ERROR VER$ NUL$ _MIN$ _MSM$ TMP$ STP$ CRLF$ HTTP$ RELAY_ASTAT$ USERNAME$ PASSWORD$ SETURI0$ SETURI1$ SETURI2$ SETURI3$ TCPRMT$ EOH$ CUP$ CUU$ SRCNUMBER$ DSTNUMBER$ RELAY_A$ RELAY_STATN$ STAT0$ STAT1$ STAT2$ STAT3$ UDPRMT$ HTTP/1.0 200
Content-type: application/x-javascript

//<!-- &L(0,"*"); -->
var d_lid = new Array();
var d_sid = new Array();
var d_dig = new Array();
var d_msk = new Array();
var rsnum,ixgroup,ixstat;
var input = window.opener.input;
var systype = window.opener.systype;

/* setup 1240 to 1479 are for input destinations lists */
// lids inp 1
d_lid[0]=&LSetup(1,"%lu",1240,D);;d_lid[1]=&LSetup(1,"%lu",1244,D);;d_lid[2]=&LSetup(1,"%lu",1248,D);;d_lid[3]=&LSetup(1,"%lu",1252,D);;d_lid[4]=&LSetup(1,"%lu",1256,D);;
// lids inp 2
d_lid[5]=&LSetup(1,"%lu",1260,D);;d_lid[6]=&LSetup(1,"%lu",1264,D);;d_lid[7]=&LSetup(1,"%lu",1268,D);;d_lid[8]=&LSetup(1,"%lu",1272,D);;d_lid[9]=&LSetup(1,"%lu",1276,D);;
// lids inp 3
d_lid[10]=&LSetup(1,"%lu",1280,D);;d_lid[11]=&LSetup(1,"%lu",1284,D);;d_lid[12]=&LSetup(1,"%lu",1288,D);;d_lid[13]=&LSetup(1,"%lu",1292,D);;d_lid[14]=&LSetup(1,"%lu",1296,D);;
// lids inp 4
d_lid[15]=&LSetup(1,"%lu",1300,D);;d_lid[16]=&LSetup(1,"%lu",1304,D);;d_lid[17]=&LSetup(1,"%lu",1308,D);;d_lid[18]=&LSetup(1,"%lu",1312,D);;d_lid[19]=&LSetup(1,"%lu",1316,D);;
// sids inp 1
d_sid[0]=&LSetup(1,"%lu",1320,D);;d_sid[1]=&LSetup(1,"%lu",1324,D);;d_sid[2]=&LSetup(1,"%lu",1328,D);;d_sid[3]=&LSetup(1,"%lu",1332,D);;d_sid[4]=&LSetup(1,"%lu",1336,D);;
d_sid[5]=&LSetup(1,"%lu",1340,D);;d_sid[6]=&LSetup(1,"%lu",1344,D);;d_sid[7]=&LSetup(1,"%lu",1348,D);;d_sid[8]=&LSetup(1,"%lu",1352,D);;d_sid[9]=&LSetup(1,"%lu",1356,D);;
// sids inp 2
d_sid[10]=&LSetup(1,"%lu",1360,D);;d_sid[11]=&LSetup(1,"%lu",1364,D);;d_sid[12]=&LSetup(1,"%lu",1368,D);;d_sid[13]=&LSetup(1,"%lu",1372,D);;d_sid[14]=&LSetup(1,"%lu",1376,D);;
d_sid[15]=&LSetup(1,"%lu",1380,D);;d_sid[16]=&LSetup(1,"%lu",1384,D);;d_sid[17]=&LSetup(1,"%lu",1388,D);;d_sid[18]=&LSetup(1,"%lu",1392,D);;d_sid[19]=&LSetup(1,"%lu",1396,D);;
// sids inp 3
d_sid[20]=&LSetup(1,"%lu",1400,D);;d_sid[21]=&LSetup(1,"%lu",1404,D);;d_sid[22]=&LSetup(1,"%lu",1408,D);;d_sid[23]=&LSetup(1,"%lu",1412,D);;d_sid[24]=&LSetup(1,"%lu",1416,D);;
d_sid[25]=&LSetup(1,"%lu",1420,D);;d_sid[26]=&LSetup(1,"%lu",1424,D);;d_sid[27]=&LSetup(1,"%lu",1428,D);;d_sid[28]=&LSetup(1,"%lu",1432,D);;d_sid[29]=&LSetup(1,"%lu",1436,D);;
// sids inp 4
d_sid[30]=&LSetup(1,"%lu",1440,D);;d_sid[31]=&LSetup(1,"%lu",1444,D);;d_sid[32]=&LSetup(1,"%lu",1448,D);;d_sid[33]=&LSetup(1,"%lu",1452,D);;d_sid[34]=&LSetup(1,"%lu",1456,D);;
d_sid[35]=&LSetup(1,"%lu",1460,D);;d_sid[36]=&LSetup(1,"%lu",1464,D);;d_sid[37]=&LSetup(1,"%lu",1468,D);;d_sid[38]=&LSetup(1,"%lu",1472,D);;d_sid[39]=&LSetup(1,"%lu",1476,D);;

if (systype==0) {
	// digits inp 1
	d_dig[0]=&LSetup(1,"%lu",720,D);;d_dig[1]=&LSetup(1,"%lu",724,D);;d_dig[2]=&LSetup(1,"%lu",728,D);;d_dig[3]=&LSetup(1,"%lu",732,D);;d_dig[4]=&LSetup(1,"%lu",736,D);;
	// digits inp 2
	d_dig[5]=&LSetup(1,"%lu",740,D);;d_dig[6]=&LSetup(1,"%lu",744,D);;d_dig[7]=&LSetup(1,"%lu",748,D);;d_dig[8]=&LSetup(1,"%lu",752,D);;d_dig[9]=&LSetup(1,"%lu",756,D);;
	// digits inp 3
	d_dig[10]=&LSetup(1,"%lu",760,D);;d_dig[11]=&LSetup(1,"%lu",764,D);;d_dig[12]=&LSetup(1,"%lu",768,D);;d_dig[13]=&LSetup(1,"%lu",772,D);;d_dig[14]=&LSetup(1,"%lu",776,D);;
	// digits inp 4
	d_dig[15]=&LSetup(1,"%lu",780,D);;d_dig[16]=&LSetup(1,"%lu",784,D);;d_dig[17]=&LSetup(1,"%lu",788,D);;d_dig[18]=&LSetup(1,"%lu",792,D);;d_dig[19]=&LSetup(1,"%lu",796,D);;
}

// enable masks
d_msk[0]=&LSetup(1,"%lu",700,D);;
d_msk[1]=&LSetup(1,"%lu",704,D);;
d_msk[2]=&LSetup(1,"%lu",708,D);;
d_msk[3]=&LSetup(1,"%lu",712,D);;

/*----------------------------------------------------------------------------*/
function zpad(str,p) {
	rstr = "00000".substr(0,p-str.length)+str;
	return rstr;
}
/*----------------------------------------------------------------------------*/
function gen_dest_table() {
	var x,lid,sid,statn,digit;
	var arr_ofs_lid=input*5;
	var arr_ofs_sid=input*10;
	document.getElementById('inp').innerHTML=input+1;
	document.write('<table>');
	if (systype==1) document.write('<tr bgcolor=\"#e0e0e0\"><td width=40px align="center"><b>#</b><td width=240px align="center"><b>TermID</b><td width=60px align="center"><b>Enable</b>');
	else document.write('<tr bgcolor=\"#e0e0e0\"><td width=40px align="center"><b>#</b><td width=240px align="center"><b>Station Number</b><td width=60px align="center"><b>Enable</b>');
	for (x=0;x<20;++x) {
		document.write('<tr ');
		if (x%2) document.write('bgcolor=\"#e0e0ff\"');
		document.write('><td align="center"><b>'+(x+1)+'</b>');
		//alert(parseInt(x%4)*8);
		lid = ((d_lid[arr_ofs_lid+parseInt(x/4)]>>((x%4)*8))&0xff);
		sid = ((d_sid[arr_ofs_sid+parseInt(x/2)]>>((x%2)*16))&0xffff);
		if (systype==1) {
			document.write('<td align="center"><input maxlength=2 size=3 name=B'+(1240+(input*20)+x)+' value='+zpad(lid.toString(10),2)+'> - ');
			document.write('<input id=ss'+x+' maxlength=3 size=4 name=W'+(1320+(input*40)+x*2)+' value='+zpad(sid.toString(10),3)+'>');
		} else {
			digit = (d_dig[arr_ofs_lid+parseInt(x/4)]>>((x%4)*8))&0xff;
			statn=lid*1000+sid;
			document.write('<td align="center"><input id=statn'+x+' maxlength=5 size=6 value='+zpad(statn.toString(),digit)+'>');
		}
		document.write('<td align="center"><input id=cb'+x+' type=\"checkbox\" ');
		document.write((d_msk[input]&(1<<x))?"checked":"");
		document.write('/>');
	}
	document.write('</table>');
}
/*----------------------------------------------------------------------------*/
function checkISRemoteSite(rsid) {
	var val;
	val=document.getElementById("ss"+rsid.toString()).value;
	val=parseInt(val.substr(val.length-2));
	if (val>1) rsnum++;
	if (rsnum>1) {
		alert("More than 1 remote site is enabled!");
		return 0;
	}
	return 1;
}
function checkIXGroup(ixid) {
	var val;
	val=document.getElementById("statn"+ixid.toString()).value;
	if (val.length<3) ixgroup += 1;
	else ixstat = 1;
	if (ixgroup && ixstat) {
		alert("Both a group and station are enabled!");
		return 0;
	}
	if (ixgroup > 1) {
		alert("More than 1 group is enabled!");
		return 0;
	}
	return 1;
}
function add_field(type, name, value) {
	var myin = document.createElement("input");
    myin.type='hidden';
    myin.name=type+name;
    myin.value=value;
    document.forms['mask'].appendChild(myin);
}
function get_statns() {
	var lid,sid,digit;
	for (x=0;x<20;x++) {
		lid = document.getElementById('statn'+x).value/1000;
		add_field("B",1240+(input*20)+x,lid);
		sid = document.getElementById('statn'+x).value%1000;
		add_field("W",1320+(input*40)+x*2,sid);
		digit = document.getElementById('statn'+x).value.length;
		add_field("B",720+(input*20)+x,digit);	
	}
}
function submitDestTable() {
	var myin1=document.createElement("input");
	var myin2=document.createElement("input");
	var maskn=input;
	var x,maskh=0,maskl=0,val;
	rsnum=0;
	ixgroup=0;
	ixstat=0;
	for (x=0;x<16;x++) {
		val=document.getElementById("cb"+x).checked;
		if (val==true) {
			maskh|=(1<<x);
			if (systype==1){
				if (!checkISRemoteSite(x)) return;
			} else {
				if (!checkIXGroup(x)) return;
			}
		} else maskh&=~(1<<x);
	}
	myin1.type='hidden';
	myin1.name="W"+(700+(4*maskn));
	myin1.value=maskh;
	document.forms['mask'].appendChild(myin1);
	for (x=0;x<4;x++) {
		val=document.getElementById("cb"+(x+16)).checked;
		if (val==true) {
			maskl|=(1<<x); 
			if (systype==1){
				if (!checkISRemoteSite(x+16)) return;
			} else {
				if (!checkIXGroup(x+16)) return;
			}
		} else maskl&=~(1<<x);
	}
	myin2.type='hidden';
	myin2.name="W"+(700+(4*maskn)+2);
	myin2.value=maskl;
	document.forms['mask'].appendChild(myin2);	
	if (systype==0) get_statns();
	document.forms['mask'].submit();
	window.close();
}HTTP/1.0 200
Content-type: application/x-javascript

//<!-- &L(0,"*"); -->
var masks = new Array();
var output = window.opener.output;
masks[0]=&LSetup(1,"%lu",1200,D);;
masks[1]=&LSetup(1,"%lu",1204,D);;
masks[2]=&LSetup(1,"%lu",1208,D);;
masks[3]=&LSetup(1,"%lu",1212,D);;
/*----------------------------------------------------------------------------*/
function zpad(str,p) {
	rstr = "00".substr(0,p-str.length)+str;
	return rstr;
}
function ipn2str(ip) {
	var ret;
	ret =(ip&0xff).toString(10);
	ret+=".";
	ret+=((ip>>8)&0xff).toString(10);
	ret+=".";
	ret+=((ip>>16)&0xff).toString(10);
	ret+=".";
	ret+=((ip>>24)&0xff).toString(10);	
	return ret;
}
/*----------------------------------------------------------------------------*/
function gen_mask_table() {
	var x,ip;
	document.getElementById('ou').innerHTML=output+1;
	document.write('<table>');
	document.write('<tr bgcolor=\"#e0e0e0\"><td width=40px align="center"><b>#</b><td width=140px align="center"><b>IP Address</b><td width=80px align="center"><b>TermID</b><td width=40px align="center"><b> Flag </b>');
		for (x=0;x<32;++x) {
			document.write('<tr ');
			if (x%2) document.write('bgcolor=\"#e0e0ff\"');
			document.write('><td align="center"><b>'+(x+1)+'</b>');
			ip=window.opener.lsip[x];
			if (ip) {
				document.write('<td align="center">');
				document.write(ipn2str(ip));
				document.write('<td align="center">'+window.opener.document.getElementById("lid"+x).value+'-'+window.opener.document.getElementById("sid"+x).value);
			}
			else document.write('<td colspan=2 align="center">Not Configured');
			document.write('<td align="center"><input id=cb'+x+' type=\"checkbox\" ');
			document.write((masks[output]&(1<<x))?"checked":"");
			document.write("/>");
			if (!ip) document.getElementById('cb'+x).disabled = true;
		}
	document.write('</table>');
}
/*----------------------------------------------------------------------------*/
function submitMask() {
		var myin1=document.createElement("input");
		var myin2=document.createElement("input");
		var maskn=output; // 0,1,2,or3 for relay#
		var x,maskh=0,maskl=0,val;
		for (x=0;x<16;x++) {
			val=document.getElementById("cb"+x).checked;
			if (val==true) maskh|=(1<<x); else maskh&=~(1<<x);
		}
		myin1.type='hidden';
		myin1.name="W"+(1200+(4*maskn));
		myin1.value=maskh;
		document.forms['mask'].appendChild(myin1);
		for (x=0;x<16;x++) {
			val=document.getElementById("cb"+(x+16)).checked;
			if (val==true) maskl|=(1<<x); else maskl&=~(1<<x);
		}
		myin2.type='hidden';
		myin2.name="W"+(1200+(4*maskn)+2);
		myin2.value=maskl;
		document.forms['mask'].appendChild(myin2);
		document.forms['mask'].submit();
		window.close();
}HTTP/1.0 200
Content-type: text/html

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- &L(0,"*"); -->
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<script language=JavaScript src=util.js></script>
	<script language=JavaScript src=ryip44.js></script>
	<style type="text/css">
	table.bottomBorder { border-collapse:collapse; }
	table.bottomBorder td, table.bottomBorder th { border-bottom:1px dotted black;padding:5px; }
	.ib { width:35px; }
	.ic { width:50px; }
	</style>
</head>
<body onload="setup()">
<font size=2 style="font-family : Arial, Verdana, Helvetica, sans-serif">
<form name="settings" action=setup.cgi method=post>
<input type="hidden" name=L value=uisaved.html>
<table>
<tr>
	<td colspan=5><b><font size=3>APPLICATION SETUP</font></b>
	<script>gen_table_linked_stations()</script>	
<tr><td>&nbsp;
<tr>
	<td colspan=5><b><font size=3>Relay Output Functionality</font></b><br>
<tr>
	<td colspan=5><script>gen_table_relay_output(-1)</script>
	<script>gen_table_relay_output(0)</script>
	<td align="center"><select id=sel1 name=B1180 onChange="hide_config_button(1)">
		<option value=0 &LSetup(3,"%s",1180,B,0,"selected");>Door Release: Normally-Open</option>
		<option value=1 &LSetup(3,"%s",1180,B,1,"selected");>Door Release: Normally-Closed</option>
		<option value=2 &LSetup(3,"%s",1180,B,2,"selected");>Active While Calling From Source</option>
		<option value=3 &LSetup(3,"%s",1180,B,3,"selected");>Active While Communicating</option>
		<option value=4 &LSetup(3,"%s",1180,B,4,"selected");>Active While Calling From Source And Communicating</option>
		<script> if (systype==2) document.write('<option value=5 &LSetup(3,"%s",1180,B,5,"selected");>Active While Any Station Calling</option>'); </script>
		</select>
	<td align="center"><input id=bc1 type=button value=" Configure " onClick="popup_mask(0)">
<tr>
	<script>gen_table_relay_output(1)</script>
	<td align="center"><select id=sel2 name=B1181 onChange="hide_config_button(2)">
		<option value=0 &LSetup(3,"%s",1181,B,0,"selected");>Door Release: Normally-Open</option>
		<option value=1 &LSetup(3,"%s",1181,B,1,"selected");>Door Release: Normally-Closed</option>
		<option value=2 &LSetup(3,"%s",1181,B,2,"selected");>Active While Calling From Source</option>
		<option value=3 &LSetup(3,"%s",1181,B,3,"selected");>Active While Communicating</option>
		<option value=4 &LSetup(3,"%s",1181,B,4,"selected");>Active While Calling From Source And Communicating</option>
		<script> if (systype==2) document.write('<option value=5 &LSetup(3,"%s",1181,B,5,"selected");>Active While Any Station Calling</option>'); </script>
		</select>
	<td align="center"><input id=bc2 type=button value=" Configure " onClick="popup_mask(1)">
<tr>
	<script>gen_table_relay_output(2)</script>
	<td align="center"><select id=sel3 name=B1182 onChange="hide_config_button(3)">
		<option value=0 &LSetup(3,"%s",1182,B,0,"selected");>Door Release: Normally-Open</option>
		<option value=1 &LSetup(3,"%s",1182,B,1,"selected");>Door Release: Normally-Closed</option>
		<option value=2 &LSetup(3,"%s",1182,B,2,"selected");>Active While Calling From Source</option>
		<option value=3 &LSetup(3,"%s",1182,B,3,"selected");>Active While Communicating</option>
		<option value=4 &LSetup(3,"%s",1182,B,4,"selected");>Active While Calling From Source And Communicating</option>
		<script> if (systype==2) document.write('<option value=5 &LSetup(3,"%s",1182,B,5,"selected");>Active While Any Station Calling</option>'); </script>
		</select>
	<td align="center"><input id=bc3 type=button value=" Configure " onClick="popup_mask(2)">
<tr>
	<script>gen_table_relay_output(3)</script>
	<td align="center"><select id=sel4 name=B1183 onChange="hide_config_button(4)">
		<option value=0 &LSetup(3,"%s",1183,B,0,"selected");>Door Release: Normally-Open</option>
		<option value=1 &LSetup(3,"%s",1183,B,1,"selected");>Door Release: Normally-Closed</option>
		<option value=2 &LSetup(3,"%s",1183,B,2,"selected");>Active While Calling From Source</option>
		<option value=3 &LSetup(3,"%s",1183,B,3,"selected");>Active While Communicating</option>
		<option value=4 &LSetup(3,"%s",1183,B,4,"selected");>Active While Calling From Source And Communicating</option>
		<script> if (systype==2) document.write('<option value=5 &LSetup(3,"%s",1183,B,5,"selected");>Active While Any Station Calling</option>'); </script>
		</select>
	<td align="center"><input id=bc4 type=button value=" Configure " onClick="popup_mask(3)">
<tr>
	<script>gen_table_remote_callin()</script>
<tr><td>&nbsp;
<tr>
	<script>gen_table_ix_mobile()</script>
<tr><td>&nbsp;
<tr>
	<td colspan=5>
		<input type="button" value=" Apply Settings " onClick="submitForm()">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="Reset All" onClick="window.location.reload()">
<tr><td>&nbsp;
</form>
</table>
<body>
HTTP/1.0 200
Content-type: text/html

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- &L(0,"*"); -->
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<script language=javascript src=ryip44_dest.js></script>
</head>
<body>
<font size=2 face=Arial>
<table><tr>
<td bgcolor="#f2f2f2" valign="top">
<form name="mask" action=setup.cgi method=post target="appsetup">
<input type="hidden" name=L value=uisaved.html>
<br><b>Destinations for Remote Call-In
<br>Input <span id='inp'></span></b><br><br>
<script>gen_dest_table()</script>
<br><input type="button" value=" Apply Settings " onclick='submitDestTable()'> <input type="button" value=" Close " onclick='window.close()'><br><br>
</form>
<td bgcolor="#e8e8e8" valign="top" width="35%">
<p>
<b>Help</b><br><br>
This window allows the setup of the currently selected input's <em>Remote Call-In</em> destination table.<br><br>
<b>IX:</b> Up to 20 stations (<em>or</em> 1 group if Target IP is a master station) can be configured by entering the stations' Station Numbers (or a Group Number).<br><br>
<b>IS:</b> Up to 20 stations, including 1 remote site, can be configured by entering the stations' TermID's.<br><br>
An additional <em>enable/disable</em> option is available for each station so they can be enabled or disabled individually.<br><br>
Note: A disabled or blank TermID/Station Number is not added to the SetURI string.<br>

</p>
</table>
</body>
</html>HTTP/1.0 200
Content-type: text/html

<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<script language=JavaScript src=ryip44.js></script>
</head>
<body>
<font size=2 face=Arial>
<b>HELP</b><br><br>
<script> 
	if (systype == 1) {
		document.write('<hr size=1 width=100%>');
		document.write('<b>Linked Stations</b><br><hr size=1 width=100%><br>');
		document.write('<b>Linked Stations Table</b><br>');
		document.write('This table is used to set up a list of stations that can be <em>"allowed"</em> to access the <em>Door Release - ...</em> feature. If inserted here, stations can be made <em>allowed</em> for each relay output, using the "Configure" input button in the <em>Relay Functionality</em> section below.<br>');
		document.write('[Default: all entries as 0.0.0.0 : 00-000]<br><br>');
	}
</script>
<hr size=1 width=100%>
<b>Relay Output Functionality</b><br>
<hr size=1 width=100%><br>
<b>Relay</b><br>
Each relay can be configured to be used for a specific function.<br><br>
<script>
	switch (systype) {
		case 0:
			document.write('<b>Station Number</b><br>');
			document.write('If the correspondent relay is set as <em>Door Release - ...</em>, this field is used to determine if the door release instruction should be accepted or ignored. If the assigned Station Number matches the SIF event destination, the contact is changed.<br>');
			document.write('If the correspondent relay is set as <em>Active while ...</em>, this field is used to determine if the external signalling event should be accepted or ignored. If the assigned Station Number matches the SIF event source or destination, the contact is closed.<br>');
			document.write('[Default: 0]');
			document.write('<br><br>');
			document.write('<b>Relay Action</b><br>');
			document.write('<em>Door Release - Normally-Open</em>: Relay is activated if the incoming destination Station Number matches the assigned Station Number. On activation the contact is closed.<br>');
			document.write('<em>Door Release - Normally-Closed</em>: Relay is activated if the incoming destination Station Number matches the assigned Station Number. On activation the contact is opened.<br>');
			document.write('<em>Active While Calling From Source</em>: Relay is activated in the case of a <em>Begin Call</em> external signalling instruction, where the source Station Number matches the assigned Station Number. On activation the contact is closed.<br>');
			document.write('<em>Active While Communicating</em>: Relay is activated in the case of a <em>Begin Communication</em> external signalling instruction, where either the source or destination Station Number matches the assigned Station Number. On activation the contact is closed.<br>');
			document.write('<em>Active While Calling From Source And Communicating</em>: Relay is activated in the case of either a <em>Begin Call</em> or <em>Begin Communication</em> external signalling instruction, where the source (for <em>Begin Call</em>) or the source or destination (for <em>Begin Communication</em>) Station Number matches the assigned Station Number. On activation the contact is closed.<br>');
			document.write('[Default: Door Release - Normally-Open]');
			break;
		case 1:
			document.write('<b>TermID</b><br>');
			document.write('If the correspondent relay is set as <em>Door Release - ...</em>, this field is used to determine if the door release instruction should be accepted or ignored. If the assigned door TermID matches the SIF event destination, the contact is changed.<br>');
			document.write('If the correspondent relay is set as <em>Active while ...</em>, this field is used to determine if the external signalling event should be accepted or ignored. If the assigned door TermID matches the SIF event source or destination, the contact is closed.<br>');
			document.write('[Default: 00-000]');
			document.write('<br><br>');
			document.write('<b>Relay Action</b><br>');
			document.write('<em>Door Release - Normally-Open</em>: Relay is activated if the incoming destination TermID matches the <em>Assigned</em> door TermID, and the source TermID matches an <em>Allowed</em> master station. On activation the contact is closed.<br>');
			document.write('<em>Door Release - Normally-Closed</em>: Relay is activated if the incoming destination TermID matches the <em>Assigned</em> door TermID, and the source TermID matches an <em>Allowed</em> master station. On activation the contact is opened.<br>');
			document.write('<em>Active While Calling From Source</em>: Relay is activated in the case of a <em>Begin Call</em> external signalling instruction, where the source TermID matches the assigned door TermID. On activation the contact is closed.<br>');
			document.write('<em>Active While Communicating</em>: Relay is activated in the case of a <em>Begin Communication</em> external signalling instruction, where either the source or destination TermID matches the assigned door TermID. On activation the contact is closed.<br>');
			document.write('<em>Active While Calling From Source And Communicating</em>: Relay is activated in the case of either a <em>Begin Call</em> or <em>Begin Communication</em> external signalling instruction, where the source (for <em>Begin Call</em>) or the source or destination (for <em>Begin Communication</em>) TermID matches the assigned door TermID. On activation the contact is closed.<br>');
			document.write('[Default: Door Release - Normally-Open]');
			document.write('<br><br>');
			document.write('<b>Configure</b><br>');
			document.write('The <em>Configure</em> button is used to set up the <em>Allowed</em> master station list when <em>Door Release - ...</em> is configured as a relay action.');
			break;
		case 2:
			document.write('<b>Station ID</b><br>');
			document.write('If the correspondent relay is set as <em>Door Release - ...</em>, this field is used to determine if the door release instruction should be accepted or ignored. If the assigned Station ID matches the destination, the contact is changed.<br>');
			document.write('If the correspondent relay is set as <em>Active while ...</em>, this field is used to determine if the external signalling event should be accepted or ignored. If the assigned Station ID matches the event source or destination, the contact is closed.<br>');
			document.write('[Default: 0]');
			document.write('<br><br>');
			document.write('<b>Relay Action</b><br>');
			document.write('<em>Door Release - Normally-Open</em></b>: Relay is activated if the incoming destination Station ID matches the assigned Station ID. On activation the contact is closed.<br>');
			document.write('<em>Door Release - Normally-Closed</em>: Relay is activated if the incoming destination Station ID matches the assigned Station ID. On activation the contact is opened.<br>');
			document.write('<em>Active While Calling From Source</em>: Relay is activated in the case of a <em>Calling</em> external signalling instruction, where the source Station ID matches the assigned Station ID. On activation the contact is closed.<br>');
			document.write('<em>Active While Communicating</em>: Relay is activated in the case of a <em>Communicating</em> external signalling instruction, where the source Station ID matches the assigned Station ID. On activation the contact is closed.<br>');
			document.write('<em>Active While Calling From Source And Communicating</em>: Relay is activated in the case of either a <em>Calling or Communicating</em> external signalling instruction, where the source Station ID matches the assigned Station ID. On activation the contact is closed.<br>');
			document.write('<em>Active While Any Station Calling</em>: Relay is activated in the case of any <em>Calling</em> external signalling instruction. On activation the contact is closed.<br>');
			document.write('[Default: Door Release - Normally-Open]');
			break;
	}
</script>
<br><br>
<script>
	if (systype != 2) {
		document.write('<hr size=1 width=100%>');
		document.write('<b>Remote Call-In</b><br>');
		document.write('<hr size=1 width=100%><br>');
		document.write('<b>Relay</b><br>');
		document.write('Each relay input can be configured to start a <em>Remote Call-In</em>.<br><br>');
		document.write('<b>Priority</b><br>');
		document.write('Set the priority of the call.<br>');
		document.write('[Default: Normal]');
		document.write('<br><br>');
		document.write('<b>Target IP</b><br>');
		document.write("Set the target ");
		if (systype == 1) document.write('door ');
		document.write("station's IP address.<br>");
		document.write('[Default: 0.0.0.0]');
		document.write('<br><br>');
		document.write('<b>Setup</b><br>');
		if (systype == 0) {
			document.write('Set the list of Station Numbers to be called from the target.<br><br>');
			document.write('<hr size=1 width=100%>');
			document.write('<b>IX Mobile Server Functionality</b><br>');
			document.write('<hr size=1 width=100%><br>');
			document.write('<b>IX Mobile Server Table</b><br>');
			document.write('This table is used to set up a list of the IP Addresses of up to 8 devices with the IX Mobile app that the RY-IP44 can act as the server for.<br>');
			document.write('[Default: all entries as 0.0.0.0]<br><br>');
		}
		if (systype == 1) document.write("Set the list of master TermID's to be called from the target door.<br><br>");
	}
</script>
<hr size=1 width=100%>
<b>Commands</b><br>
<hr size=1 width=100%><br>
<b>Apply Settings</b><br>
Click to save all settings in non-volatile memory.<br>
<b>Note:</b> Device must reboot to use the newly applied values. Click the <em>reboot</em> link after <em>apply</em>.<br><br>
<b>Reset All</b><br>
Click to remove to any altered, unsaved settings. Page will reload and all changes will be lost.<br><br>
</html>
HTTP/1.0 200
Content-type: text/html

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- &L(0,"*"); -->
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<script language=javascript src=ryip44_mask.js></script>
</head>
<body>
<font size=2 face=Arial>
<table><tr>
<td bgcolor="#f2f2f2" valign="top">
<form name="mask" action=setup.cgi method=post target="appsetup">
<input type="hidden" name=L value=uisaved.html>
<br><b>Allowed Stations for Output <span id='ou'></span></b><br><br>
<script>gen_mask_table()</script>
<br><input type="button" value=" Apply Settings " onclick='submitMask()'> <input type="button" value=" Close " onclick='window.close()'><br><br>
</form>
<td bgcolor="#e8e8e8" valign="top" width="35%">
<p>
<b>Help</b><br><br>
This window allows you to set up a list of allowed stations for the <em>Door Release</em> function.<br><br>
Up to 32 stations can be configured by checking or unchecking the corresponding enable flag.<br><br>
<font color=red><b>NOTE:</b> If the <em>Linked Stations</em> list on the main page is modified, replacing existing stations' TermID's, enabled flags are always related to the same station position number (1 to 32), so they will automatically reapply to the new TermID.</font></p>
</table>
</body>
</html>