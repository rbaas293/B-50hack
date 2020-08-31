HTTP/1.0 200
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
}