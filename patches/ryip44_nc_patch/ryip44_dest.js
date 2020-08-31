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
}