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
}