CoB1��  uidefaults2.htmld�  uifitemp.htmlD�	  uisaved.html.bak�:  uihupdate.html��  updateex.htmln�  uihloader.html
�  config.bin3  uigstat.gifK>  BARIO50APPVERSION@�1  uihnetwork.htmlC�7  uirupdate.html,:  uigd.gifS*f  uiftime.html�}g  Barionet_MIB.zip$,n  uigconf.gifkPp  uisaved.htmlc�q  uifreboot.html�s  data.txt��t  uifappsetup1.htmlWlv  uifstatus.htmlT �w  uigg.gif�x  uistatus.html ��  uihdefaults.htmlc،  uidefaults.html� ;�  uifloader.htmli�  4to0.gif���  uireboot3.htmle	�  notauthorized.htmlpn�  uihsecurity.html
ޙ  uisnmp.html[�  uifsecurity.htmlYC�  uifcontrol.html
n��  index.html�
�  uiglogo.gif���  uitime.htmlSp�  uiftemp.html���  uihtime.html� H�  uigs.gif���  uihtemp.html� ��  d1.gif�s�  uinetwork.html�  uihreboot.html�8�  uiupdate.htmlW��  uifupdate.htmlw �  uirloader.html
O�  uifio.html�� uitemp.htmlg� uiconfig.htmlW3 uifserial.html�� uihcontrol.htmlTT' util.js	o�. uiio.html�: uisecurity.html�J uihsnmp.htmlSQ uifsnmp.html�YR uigmconf.gif� Z uigl.gifg�Z uifdefaults.html
�$\ uihio.html� �] update.html$�^ uistatusn.htmle�o uimenu.html�<{ Barionet.MIBY� uifnetwork.html]i� uistatus2.html�Ɲ uimenu0.html�|� uireboot.html�W� uicontrol.html��� uiserial.htmli�� uigmstat.giff� uihstatus.htmlut� uireboot2.html� �� d0.gif��� uihserial.html HTTP/1.0 200
Content-type: text/html

<html>
<head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>  
  <meta http-equiv="refresh" content="2; url=uireboot.html">
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
    <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF><br>
	<p><font size="3" face="Arial"><b>Settings reverted to factory defaults.</b></font>
</html>HTTP/1.0 200
Content-type: text/html

<html>
<head>
<title>BARIX Barionet configuration</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<frameset rows="116,*,0" frameborder="NO" border="0" framespacing="0">
  <frame src="uimenu.html" name="menu" scrolling="NO" noresize marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uiftemp.html" name="config" marginwidth=5 marginheight=5 noresize frameborder=0 framespacing=0>>
  <frame src="UntitledFrame-2" name="empty" scrolling="no" noresize></frame>
</frameset><noframes></noframes>
</html>
<html>
<head>
<style type="text/css">	
div.lpadding {
          padding-left: 20px;
}	
</style>
</head>
<div class="lpadding">
<font  size="4" face="Arial"><b><br>Settings saved. To activate, please reboot unit!<br><br>
<font  size=3><a href="setup.cgi?L=uireboot2.html&R" >Reboot</a></b></font> 
</div> 
</html>HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
  </font></b><font size="2" face="Arial"><br>
<b>Versions</b><br>
Provides the information about the currently running firmware.<br>
<br>
<b>Update</b><br>
Please visit <a href="http://www.barix.com/downloads/" title="Barix support download section" target="_blank">Barix support download web page</a> and verify whether your Barionet is up to date.<br>
Download an available update package and read the file <em>&quot;ReadMe.txt&quot;</em> for
instructions on how to use.<br><br>
<b>WEB usage table</b> (for programmers using tftp)<br>
<table border=0 cellspacing=0>
  <tr>
    <td><font size=2>8K</td>
    <td><font size=2>Firmware</td>
  </tr>
  <tr>
    <td><font size=2>WEB1..3&nbsp;</td>
    <td><font size=2>resource files, Web UI, Help</td>
  </tr>
  <tr>
    <td><font size=2>WEB4</td>
    <td><font size=2>Sample BCL application Digital I/O Tunnel (incl. Web setup)</td>
  </tr>
  <tr>
    <td><font size=2>WEB5..23</td>
    <td><font size=2>Free for own BCL application / Web UI application</td>
  </tr>
  <tr>
    <td><font size=2>WEB24..28</td>
    <td><font size=2>Reserved</td>
  </tr>
  <tr>
    <td><font size=2>WEB29</td>
    <td><font size=2>Firmware extension (sg.bin)</td>
  </tr>
  <tr>
    <td><font size=2>WEB30</td>
    <td><font size=2>I/O drivers</td>
  </tr>
</table>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>
 <title>Update Advanced</title>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body class="lpadding" BGCOLOR=#ffffff vlink=#ffffff link=#ffffff><font face="Arial">
<h1><font face="Arial">Update Advanced</font></h1>

<table>
 <tr>
  <td>
   <hr>
  </td>
  <td>
   <hr>
  </td>
 </tr>
<form enctype="multipart/form-data" action="/rc.cgi" method=POST>
 <tr>
  <td>
    <font face="Arial">Target
    </font></td>
  <td>
   <input type="text" name="target" value="" size="5" maxlength="5">
  </td>
 </tr>
 <tr>
  <td>
    <font face="Arial">Resource</font>  </td>
  <td>
   <input type="file" name="file" value="" size="50">
   <input type="submit" value="Upload File">
  </td>
 </tr>
</form>
</table>
</body>
</html> 
HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor=#CCCCCC link=#000000 vlink=#000000 alink=#000000>
<b><font size=2 face="Arial, Helvetica, sans-serif">Help<br><br>
Updating files</b><br>
Visit the <a href=http://www.barix.com target=_blank>Barix website</a> to obtain the desired update. Unpack and save to a local drive.<br><br>
To upload a resource click on "Browse..." to locate the file you want to update.<br>
Once selected, click on "Upload".<br>
This process can take a few minutes.<br><br>
After a successful upload the following text appears:<br><br>
"Resource" successfully loaded. <br><br>
Click on <U>update</U> before updating the next component or <br>unplug the power supply to reboot the device.<br><br>
If you choose "update" you may upload another resource or click the "reboot" button.<br>
If you choose to reboot the following text appears:<br><br>
rebooting...<br><br>
Click <U>here</U> to reload the main page.<br><br>
The device takes a few seconds to reboot. If you have a fixed IP address or DHCP resolves to the IP address used before, the main page will appear.
</body>
</html>    �           '             '                                                                                                                                                                                                                                                                                                                                                                                                                                                                               HTTP/1.0 200
Content-type: image/gif

GIF89a� J �  �����׼}��&5!� � ,    � J  ���������ڋ�޼���H�扦�ʶ���L��������
�D��
��h��1`@2�+5��W�d�X�$U�X����X���������F7 w ��'U�x�rX�%'5�P�G�I�vi8z�)� )�P�R�:��e@H
`+����["{�fk�[�{�f2�Vl�d���Z���ݸ�ڹ
����-��Y��̹����n��Y�� >N��e�o����f`�0�;��N�?�Y��m��ĨIcő$K�<�2�ʕ,QrI��#�p�BVӴ�啙�jN���O�����L��'�nM�״��~Ѵ�95<6K�����ګC��8S�.
��&�i�rq�����?��!��(�.'X��'w-"�7�:�y,���X�Z3�re�[畒J�Ah���]k@�3����A���_��b�l+��lj����f���y���"Y.ͻ;�Fv�7���2k�u-��~����������dފ����_E��q\�O�>����ֺͫ?�O<�p	g�|�ٷ[h�d�q�Ղ�%�_.�ew�Q��nu��O���@Me��̈́H"���"@��"`x#a�U^F�4�ܳG��3W�yE��ND�~U��b��Y)=˕�V�G�%sʢ�1��Tq�8�-6Ƅb!vB`)_�&qM�R�~�	h��Jh���h��.�h��>
i��NJi��^�i��n�i��~
j���Jj����j���Zh ;0110
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
Vers  Date     Who  What
A1.00 13.05.09 AD - initial revision based on barionet 2.02
      09.06.09 PK - removed I/O Protocol setting from the I/O Setup page
      10.06.09 PK - Input polarity configuration removed - does not apply on Barionet 50
                  - kept the uiio.html for information and future use (no config options available)
      28.07.09 PK - default syslog level 1
      06.08.09 PK - added number of temperature sensors into the temp page
      21.08.09 PK - target frame in "Update" changed from _blank to _top
      27.08.09 PK - updated help page of "Update"
      23.09.09 PK - fixed wrong default values for local ports of serial intefaces (bugfix #064.14)
                  - updated serial helps, added default settings
		              - "Control" page reorganized
		              - added software flow control to RS232 settings
A1.01 30.09.09 DB - deleted RS-422 from serial config and help
                  - cosmetic changes on I/O, CONTROL and TEMP config pages
                  - reverted defaults "BCL Program Name" to empty (legacy)
      05.10.09 DB - fixed link color in update page, fixed UI version display
      06.10.09 PK - uihupdate.html updated
      08.10.09 PK - WEB UI version is printed via a dynamic mark (feature #064.26)
                  - more version informations added (bootloader, drivers)
01.02 19.10.09 PK - minor change on the Update page: version information
01.03 12.01.10 PK - #064.29: SAVE button removed
      27.01.10 KS - Bug #14.03 Barionet.mib/zip updated with systax error fixes
01.04 01.02.10 PK - #64.46: added WEB password and a new tab "security"
      03.02.10 PK - config.bin size increased to 138 to also cover the WEB password
01.05 11.03.10 PK - config.bin size increased to 512 to clean for future parameters
01.06 22.03.10 PK - Setup version increased from 02 to 03
                  - corrected non-working config.bin defaults
      26.04.10 PK - bugfix #64.57: wrong rate at 230400 bauds - was in fact 187500
      02.11.10 PK - fixed wrong input numbering in uiio.html
      11.11.10 PK - #064.62: logout page changed to "please close the browser"
      24.11.10 PK - typo correction in the security help: "passowrd"
01.07 03.12.10 PK - #64.64: removed 1 user login limitation and removed "Logout" button from all pages
      08.12.10 PK - typo corrections in the "Security" help and configuration page
01.08 23.11.11 JP - #64.66: URL for barix and download section was missing on barix logo.
                            URL is updated.
01.09 12.11.12 AD - added frame name to application config frame, to allow form targeting.
01.10 09.04.15 KS - uimenu0.html: incorrect "alt" changed to "title". Hover should now show text
      20.04.15 KS - uimenu.html:  incorrect "alt" changed to "title". Hover should now show text
      20.04.15 KS - global edit color: #8f2635(red) -> #FFFFFF(white)
      20.04.15 KS - {uicontrol,uiio,uinetwork,uisecurity,uiserial,uisnmp,uitemp,uitime}.html tabs->black
      20.04.15 KS - {uigmconf,uigmstat}.gif changed background to white
      24.04.15 KS - uimenu.html: rewritten to use div and inline menu (intermediate change)
      24.04.15 KS - uimenu0.html: rewritten to use div and inline menu (intermediate change)
      27.04.15 KS - uiglogo.gif updated with new logo (Barionet removed)
      27.04.15 KS - uimenu.html: device config gif removed, Barionet defined as text under BARIX.
      27.04.15 KS - uimenu0.html: device status gif removed, Barionet defined as text under BARIX.
      28.04.15 KS - uimenu0.html: removed incorrect area hover
      28.04.15 KS - index.html removed extra >s
      28.04.15 KS - uigd.gif replaced with new front panel, uistatus.html updated accordingly
      04.05.15 KS - uigd.gif converted to show 4 input LEDs, surrounding text removed
      04.05.15 KS - uimenu,uimenu0.html updated styles and layout: font and type to Barionet 50
      04.05.15 KS - uistatus,uistatus2,uistatusn.html updated styles and layout
      05.05.15 KS - uireboot3, uihdefaults, uihupdate .html: cosmetic changes.
      11.05.15 KS - uimenu,uimenu0.html Barix smaller, font ->3, bottom aligned, left padding via CSS
      12.05.15 KS - left padding set to 20px for the following 22 files (see ls and grep command line):
                    (ls *.html|grep -v uih|grep -v uif|grep -v update.html|grep -v index|grep -v uiconfig)
      12.05.15 KS - uimenu0.html added more meaningfull title: CONFIGURE & MANAGE DEVICE
      12.05.15 KS - uimenu,uimenu0.html changed barionet 50 hover:  VISIT THE BARIX WEBSITE - DOWNLOADS
      21.05.15 KS - #64.78 & #64.90 uifappsetup1: 1 added to html, new method 4 added for @name selection
      21.05.15 KS - uimenu.html Application -> Application Setup
      06.01.16 PK - #064.94: added B198b0 control to enable virtual traps
*/
HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
  </font></b><font size="2" face="Arial"><br>
  <b>IP Address<br>
  </b>Enter the 4 values of the desired device IP address e.g.:<br>
  <em>&quot;0.0.0.0&quot;</em> for automatic discovery (DHCP, IPzator&#8482;,
  AutoIP).<br>
    <em>&quot;192.168.0.12&quot;</em> for
a static IP address.<br>
<br>
<b>Netmask<br>
</b>Enter the 4 values of the desired netmask e. g.:<br>
<em>&quot;0.0.0.0&quot;</em> will use the standard netmask matching the IP address<br>
<em>&quot;255.0.0.0&quot;</em> for a class A network<br>
<em>&quot;255.255.0.0&quot;</em> for a class B network<br>
<em>&quot;255.255.255.0&quot;</em> for a class C network<br>
<b><br>
Gateway IP Address<br>
</b>Enter the 4 values of the desired Gateway IP address e. g.:<br>
<em>&quot;0.0.0.0&quot;</em> for no Gateway<br>
    <em>&quot;192.168.0.1&quot;</em> for
a specific Gateway in order to access the Internet or a WAN<br>
<br>
<b>DNS Server IP Address</b><br>
Enter the 4 values of the desired Domain Name Server IP address to enable URL domain name to IP address look up e. g.:<br>
<em>&quot;0.0.0.0&quot;</em> for no DNS Server<br>
<em>&quot;192.168.0.1&quot;</em> for a reachable DNS Server<br>
<br>
<b>DHCP Host Name</b><br>
Name of the device sent in DHCP request. If left empty, a name based on the device's MAC address is generated automatically (a &quot;C&quot; followed by the last 6 digits of the MAC address, e.g. &quot;C8041B8&quot;). Enter up to 15 Characters.</font>
</body>
</html>HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",21);
<head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>
<meta http-equiv=refresh content="0; url=/rc.cgi?L=uifloader.html&c=100">
<meta http-equiv="pragma" content="no-cache"></head>
<body class="lpadding" vlink=#000000 link=#000000 alink=#000000>
<font size=2 face="Arial, Helvetica, sans-serif">
Please click <a href=rc.cgi?L=uifloader.html&c=100>here</a> if your browser doesn't support forwarding or refresh if there is no response.
</body>
</html>HTTP/1.0 200
Content-type: image/gif

GIF89a�8�     �   � ��   �� � ���������   � ��   �� � �����                                                                             3  f  �  �  � 3  33 3f 3� 3� 3� f  f3 ff f� f� f� �  �3 �f �� �� �� �  �3 �f ̙ �� �� �  �3 �f �� �� ��3  3 33 f3 �3 �3 �33 33333f33�33�33�3f 3f33ff3f�3f�3f�3� 3�33�f3��3��3��3� 3�33�f3̙3��3��3� 3�33�f3��3��3��f  f 3f ff �f �f �f3 f33f3ff3�f3�f3�ff ff3fffff�ff�ff�f� f�3f�ff��f��f��f� f�3f�ff̙f��f��f� f�3f�ff��f��f���  � 3� f� �� ̙ ��3 �33�3f�3��3̙3��f �f3�ff�f��f̙f��� ��3��f�����̙���� ��3��f�̙��̙���� ��3��f�����̙���  � 3� f� �� �� ��3 �33�3f�3��3��3��f �f3�ff�f��f��f�̙ ̙3̙f̙�̙�̙��� ��3��f�̙�������� ��3��f����������  � 3� f� �� �� ��3 �33�3f�3��3��3��f �f3�ff�f��f��f��� ��3��f����������� ��3��f�̙�������� ��3��f���������,    �8 � � Hp���*L�p�ÆJ�Hq�Ŋ/j��q�Ǆ >��Hr�ɒ(O�L�r�˖0_ʌIs�͚C��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�O�S�,A�cѦU{V�Y�o׺��,۶f붅{W�߾��ڍ�W�޹y���� _Å�U�8���:�>�\2eɛw�,Y4hͨo^�Y5�Ȭ=���z��Пa�>L;��ݦ}WL��p�<��Zμys?a�K�N����سk�.�t�ܳ��^; ���C���}���ǻ�O�����/������ (`|S���@����0�`�2!5V(��bH�f��������"�H�,���.��*����2�H�<���>	$���?")��F&��O6	�RVɤ�fa�h����4�[�e�h��f�l��f�p�)g�t�ig�xީg�|��g���)h��jh���h��.�h�.:O-磘B�馚v�駞�
ꨢ�Jꩦ���y:� �;��R����jk��ުk����k���*l�Tb��!!d�(ye��m��N+��Vj�-��n�m��Z����rK��Xm��[n��Rf�tk��ޫo����o� �+�"�вm���/�p�?,q�o�jA<�zc�O�q� ,r�$�|h�Ǌ� ������-��n�4�l��5�|��:����9�sˋʋ1�̚\��J7���NGu��T��Rg=��\o�u�`�j�=i���h��v�l��v�|���W���C���>��ݷ�B�-x����w�����=�Nf�	�۔Ony�_Nq�	��f�k�袗N���񬧛�z밿.{�r�,ˉ�θ���������.���'O|��:�p�.}��Oo}�sN7�jb��އ����+䬓�����~�g�N�@ܳ����#�|���-�����?Z�䟈w4�%�}�_'(��i�`X��+��r�i�+[�>�����&���:G?�P�/�aeX�ڰ�8��u��1�y:!S��PH��FL���$:1�O�"#�*�p�4���E,��W��(�.�(e,l����5����r��B�7��w�#�d����{� ��8:��c�"��D:Ҍ�\�$�8�H��Ll� 7�Nr��r��'=I�Q��{cb�J��S��������XIHڲ����.-��[�җS�$_ILX�#�,��Lc:������jR�*$yr��6���f8��o���|�0o��vZ�6��z�Ӟ�LU*����~�����,�7�n�Ӡ-�B�#st�E�:�	ЊԢ�T&�.�Q�v�����G=Jґ:s�BshB
ѕ*2�0u�Lw�Җfq��4iIw�S<jԁ<jO���}攨CM*R)8P�ڔ�P��S�ՙVu�2ũH��ԮrU}?5�W��U��/�j4kYתV̡T�W�+U�jU�b��r��ʹ�V����]ZX�	X������ն�)�(>�1��d�Ǯ�M���}&���;uz�u�ر6U�y{@*p���~sˈ췥P��6,~�-��C�)\(y��V��ڵ�5�+^��\-����b�M,2�=7#!i���{[ �_Ү�&����A�M#r �]6��!�--i1:Xzz��]����4ǡ��N��q��O�i��?��d�[����$E+t�5��d%y���(2ai�#NP����Z�<]�Ry�K��jK�i!�g�ӷ�6���Q��;+geL!ڱ����XjDF1��������PV�̞[>jLw�`!X9d7}X%!���+��r��ш~���y��4i}UUd�I�B)Л꼕7�9Y�BsQ��`��5*c�����l���B̼����<q��r�M1Bi�N(]�Pox�1��j�ژ�|��w
D�Y��(��Q��RG�k(�=
��<��B�^t��,ef��O�$�M%���K��vl���$�j��0��ބ��ys�4�(g#Ft��9�Q���f3���c��h�uf8��d��A�7f)�~'G[�=%�-;��h��I�%da>�.��#$nvn��	����������u��g��WOY��㮁R?��'�%�d3�p�.yBE�#��]ۂ?E�N����}�fS��@�����b�,hN׽tX.h���aG9tKN�7�\!%F�CZ~&�t��x�g�M���VV�G���t����-�����3�(cZz���w�8>�����)+K,��5�=�e8�����7�I�&q��Ni^�߳�r�=M���y3��j���.|T�s�_����Pm�.\�;�B�2��"/|'o����nu���X?$�ũ��+�������独2��q�<�RWd�m�}�{�c���&Ħ`�h�p��ks3yx�!F�y�W��4~��yf�z)�z/F�g|(wy�Ձ/wj�]�'r)Fy�c7oxJ6W3%��f}��by&sRyQ���Or}��}���ᗄ�'Qxa�V(\s3Q?�J+8je�~ӵxrg^-H'�$�2x����Ry�z�uk�V��pC�|[�R1r�Z�g5d7�h�I�������Mϗ��Q�&#���q��h�Grш]�v�"D��I��%���a&s����{Jvs�?7h����Ylp� 7��#?�Pׄ��}�%�KX�JHSO8n�2��uu"h/(�8��9\�]����V/��h���Dj�)���l�ՋVqw��ul�t������(�%����
�e�^��j�x�f��˒�Q�v�G{�g�ˇ�������A5�W�h}���e|A1td��3bp�Ux!	�����2)yPXe�Z��R��(�������F(�&:)r([��T���t���oX +�����~��EG�7'I�"bp��l�Ɣf)>�G�h���,c�e�W�W]��vm`j琙X�[h�1W$'�b y�gA��RxH�}b������ZDQ%D!\�h`}�!>��L��Y5��	�ۗ�&����]&�e�|��|�^@�'91f��t�8Y�8\I��iGN�)��ޖ�@A�ѓp����;x���q�֙�'|�Y�����C��T8��'���i�w'�r�9'9�ph��K�r�x�y͉���5{|^Q�$l{F�q������7��6`1I���3�ؠ/Yu�h1����I���Z)�p�W�e�c��8���!�u�u�k�o��yș���=��)ٸb�����Z��[�ib1`��e���&,�n3*���p�y_ˁvS�T
xU��Xx��-V��U��\z�f��b*!d:x�Grg��>��dz'o��fڤx
6�	<q�(��(R�,ƢD�'*�����p�EIJs�'�����=5꤃jX�����������J9uЖ��L�qUGI�:��z��zuZ��Z��t�����*Ai����������٪�S�:����
����n���:��JB�Z��J��3�Ě�����
�ݺ���?�i�ښ��Z9Һ�Zӫ�����6��:��Z�����ڪ�Z�;�NӮ;��0�z����í��Gǯ�Z�˪���$�K۰�ac� ;�{+�J�([���k�-{�/�P.�����)�{�*[q��8۳9K+6��B�ò�T��4�J�4۴K�B5I�C;�V��Ui*�Z�4'K�^���r�)�ő��L��N��l�G�`��rۏ;kxs{�q��	�}҂~�'��%+^	C���9��~�^�;����xk�u�;Ӧ�ۥ2{!��_�+\�W|��!��[S�t�K�mz�?�!����{���RqS���%�j��m��iķv�n�Q]��1z�!�u��X$�Ѽƫg�[��{��o�A��(�V��������8�t�dgTl�`��L
jy�Sd�+!�`7Ⱦ������X �K��&]�h��h�i���n��v+��+��&���e�œ(!m�u�7��o�a��br� ,�bk�86z
q��}�%k�H�Q;����;J)]`!�my�uw>r�98����&���lѲĶ��J|�G�)��Z�э��ny����!siW�h��_�1Y���]�˽�˽���X/�!M$!�h�H�%\�6��B�م!W^g"&�sJ���3������e<<!��,�}�6p�H{b�t��`�'SE�Li���\b�� 2w��Kff�d����i���*i`!s�X�|<̪b�M�c���E��晻�FD��⾝|��a\|F������$��$�,�jҼ�O|�Ŋ��%ŋFūj{�%i� ���J&���9�~����������+���*�e�H��G��d�$L�Ma�ko�,�1j0-����s3TϬ|�W��{�� �,!�tg�{Z8�+�v�;�}���XQ
�	B���<h�e7�����[Eo����ϖ��b�ʁ ��:��n��F�ЭR���bx�0Ѡ��`R�F����2dc\�?��+�єL/d��m� �(��my�k;H�%�$�̹��P�؈�ؼ�[w�`�`�1�}�7r_,�L�ϫ�v���,��la\i��)���X�a`M�c�"+(��]�qGv>dl�Ѿ�c;�hғ\h7��,�|�r�q��O� H�J��dM�{[qd���n�8}�Č�����)�n���v�w�|z������s�o☄�Ԭ���[k���wM��Ղ����Zi��=���v=�HkZ�ǟ�&ߌ��2� �!��؁�����Q��;�(���&�b<I��m%�aA�Ʀ&�������ҩՒB�k�W�)������]l�!^֐�%r]�	\�"M������ͪ5����<�& �r>�5�������zJ� u�����^�����)�ٜGf��ȶiU���m�x��g~͘�W���a��'��C�����D�������-��ɂ�R�����<�#n$a�t=��X�^�n�������m��b+����;����)��&>��i�b�]�٦m�˔W�+�F���j\�>ہ�c����1����Ƞ�T-m;P��M]�F^Δ���/Mǽ�r}�<��+�~�9�X^ܼ��:���a��qN�_|k�N�-�|�6�ǉ��N����X,�����-�Ύ���iu�������V��F�g�}�']�4��eR�6BĚ���H�f���|��~�m۱��u$�^���)��<v4�����S.<k�xl���?��j����~��G��7����k4��h��ha_�,&X���q�j�dv����k�'OH&u��K�/���꿛m��=���gfЏ�~�.�$]���g��Þˏ߷�����Z_�����ʹMG&�������3ϊ����Z��O��N�u6ou:?���\_����B������'����������?��������������f9����o��g��|����Z���������������������������� AM���,x�`B�.|�PbC�'F�x�bF�=n��QdǅM�DyReJ�+]�DH� � �ش���Ζ=y���P�E�5��R�M�>u�T�U�^���V�]�~�JrdH�eWR�r�fM����Vn\�s���{Wo^�{���Wp`�3�✢s�b7��Xrdʓ-W�|Y�Ҵ8�Rth�eɞm:5�ҬU�^���׵]ǔm;��ݽi���[wp�Í?.9��<q��6g��թ_���v�ݹ��\yײ�]=x��ݷ��^~|��#�>_}�����?�μ� HO��Ln��F:�A	l��	!$�B�"԰Ci��C=�,/,����cK��0Fg��Fo��S+O��lG!�$rH#�D�����H'���I)��rJ��:��O�PD������1�$�L3�dM7�|ӸQ��EŬ�2O<�ԳO>�j��=C�OC��<4QDUT�:��QF'��RJ/��*��S59
��@E�sTS��TOU%u�R_uUP�X��NLo�W]s�+Vw�p�Bw%�Wc�E�X���4Yg�}6Zh�%����Um�u�n��\o�L�[s�=w\�heR�H���Zy�7;q�C	-����z��7�gu`�F�`��V�t�}8bt'Vb��,�b�+��b9g���f&ya�KFY��Ͳ��3�X܌�Ś;����d�`��h����ZN9Vi�mZ٘qN���7��$��l�H��κ냥��a��&����-;��~��'���ۛ��Hm��A�՝{�tz����\����jԾ�uq
�)`i�j�}�{Ȃ�7�6�z��M*|t�3�2��%�aԭL%-��� �R�������]�B߼��L�t��N�s��S^���>��LŦ��o�qr���-k��|����9|(x�_�^Ƽ�������	�b����b���e�5���;3щI�g���&� D �����s$�-X��	V0}��7(B�P}&LAHh�/=*!���.�d�}R_	��:�/0�{ ��b>��D FD��
d����w}���x�B���L�Yh�D���&���;,^�$���â/)*&��;b��F! R�Ox5ʄ���[��w�"a���#�� 84�P0q��x3:203�bࢨĞ �(ILL�܂��������h�(⎏��I)��0��&���W�WJ�=�]�����>j��sL���$�S%���E���Ȑ!�̸פc��~H\#9G1���Z�\]x�%�Y��y�)�a*S'�d$��H>�%�:�,7��ڕw�$�\�IP{2�*���4H�Ou�ØOIł��~����DZj����$�O�&��ß�hATF���jd7[I�m��{�|h��YOP�T_�� �)���T��� �ɠ�n��l�	�<�]s�=�L��YR{�%�>�6���Z����+'ݝ84�d�vac+�X�82�$�c0ͣ4���<�s��?^k�A
(CY���z�sq͹<�`ҋ��#=YP�Q��4eM�JK:%��%�$9K���Դ�.���2ӆ%ՂK��ׂm�e�K���L�լ�W�TV�0'E5����ݮ��r3%�J�-ն0N��GY	�`%4.D�']ϨO���.�R+_�+ �c.��B��o��1�.:�ɒ�~�d�v��?���U+�P��֥!~e�6�J�U���U/���WMMM�K7��>׿��W����5s�y��r�j�Z��0�!��;�j���$�$�/��	1$QꘚZ񤴄�a�@}��+'%��Ѹf,�֔��2`��[�����)�L�L�u�e�n���~��^E/K���xؙq-c�h�UƴMLmPV{<3t��:5N�xӹڏn٤��WIW��B���]����UJ�U�ۆӥ�4��(`S���:h���N��n &D�AzP*vˀ������qc�۷N
yzn�;������{�y���E7�$Ma�B:���ϥ��8Q�$N}�
���1��&�,W�����j��^�e��=���4_B_���7�,�l�[e�^�~���X��-ǹ�s�s�������ϕ�q�y���Щt�����Y��7nճa����y�u��z]T�G�zع�(���?���Ӿv�sf_�S��5����9#��A�r�K�B�.���=��{���d�h'w|�y�S7����W$B�s�����E���x�����N�������'}��bz�u1��W���{�J6�:�-C���[۟�
2	���7ގ�i���D���O}��=}*#?<ۿ>�������?��Ϟý�s��e�ӟ�߾����;:����O�����+%����#-	پ�+@��;������6Y@	$��k����@T����@<�����KA�K�s�	d�l>�1�#�<@��D@��AA����jB\���A!�-����&��"L��W�峢�BB>���+��%|�&L?-;B�_!�+4C��B4��8$�9D�$D�Ӽ*�C#�D���64�7|&CL�5L�>tBps���Ht�ITDI���?��?|��O��?1�B���S4�T�?�3���@v[�{EP�� �S��P�E�R�E[�EN*n��c|>/�@FP,&D����=�J�A��l��7���>T�o4ĹG4�`�F<G�H��cD�hG��Ź�:~�F��K��5�5T�BU��TD�	�Gg\�rG�(��SH}�C~tF��B6\H�w�G�@Hsԥm�Hm����H䊑��7C�/�S�{ӥ�\I@��:��S�N�Ĝ���C�f\��;�H�?��B��?�0FZ�лŤD���E�Eݫ(��Ǟ���]lJ�4�(�`��XlJ��q˯&���[���=�l�������l4Ù�ë��ɮ�Im+I�\D�4LwDL�\��/�S0�$���6c
�/�R�A�+��|Ǥ�L�L���C@!MLL7$�<���\GG���Lz:�}4ͼ�Mnd��4���k܊�<Lcr����!̊�L�����I�"��ʵ��_�?���3�|�d˲E����
Y���J�����J�dF��I��dO�$D��4�t2*���F��4��M@�M�4��$��H\SN�l��P-�t�(�� �OH�P��>]�����#��PY2��LQ
UC� P�S͊�PQ;Q��8������ɪ�%P�;�}��NN�\�#}D��%|�i�笼�S��R���~�΢�RT�N����l�Q�JO���2m��8�4�O��O7���<5��ʜ�w��]$L��Oi�K]�(M� ���m�-Җ`Rw\R�RF���4(|̖�LA͋����ʹA�����']��L�]ՖLTmT-����=���Q�5�^%�W5�X͗Ge���S��J=QeUU)�BN��h����N�AnS@�V/��)j�1��TϠ��4O;��g\�r�H�R)sJtW��Jv��i�� ��ƻ�N�U�Հ�-� V�V�RP�Tc=Q�Uf�P����L]�~���ž��̀Վ5��GTu�dV���ML��VX]T��U���t=��C�U]
�uW�uU�V��̓͗�M�e���V�tNǬ��׌%8���/Jz��6��O{}E�1�,{�7}����`�S!˲=A��ڰ]�*�8�͛�X <V��Y�Y5Z��H�dU_�������eY%<�T����lV������qܜE�v<HI"mHEܑ&�%Mh�[}ܼ�ܒXCZYM��Z�܁�Ih\�V=� �R��[ڱUZ�Q��L��Z��X�Zo=��S������Bke�8m[2�ĳm��q��%^�m�Y�t5ލK�}�ͺ}���ѥ��Ľ�ӌߦ�Y�bP���x�ٷP� nLzd܊M]��T�$F�4��Vײ�xdMrlSk8��t�����|tD54]x������u_�8Rv
-�_�ꋂda�X����T�����av���DY	�����d�	y੥#)b�Ԑ�EF�-�C�
�:�;+��b	�EI�va��O8���.n�/�;�@�O��ī:@����r��B-P�U`���N��"�?��dǈ�;��C�9�9`�K��޷U-$lb'�B�m��W�U�� D��H��A���mP�|_�J����0e�|�}���Z^�Z&e������]��]~K`�:_�e`� ��d�Va����k�l)<��f�K��}�ōf�[_9�W:��p�k��k\q�Wŋ�\F9�a�q�
��yFgz�(&9�eV��0�����!�!~�w�d�e����zfhp��xz����'~胣�}�h���hk�������&�j�h�VߒV�fi����^�n�e{胐���������h�꺻8y�颞i���_�=�F��T�9~�v��(!���2�����뱆Y��j�F볞
d�b�S봆k���o��~kw.��r��8:��&���k��fT��k�f�V�i]��nlęk��l��ly�f��k{�=�.��lѾ�l��.����f��f��v��q�֦헩l���ܞm����1hgnkf���&m�&��F��ޏ>������=$�s�8�޲����n��m�����n��is>���U���#�`}4o�c�a9�9���+D��N��f�&���4������~o���OC�Dc4
a/>�uJ4���F���o��o	O�]����'��gG�W�g�w�������&��on�T��G��� �!�� r"?��$�%g�&w�'��(��)��*��+��,��'�.��/��0�1��2'�37�4G�5W�6g�7w�8��9��:��;��<��=��>��?��@�A�B'�C��-W�Eg�Fw�G��H��I��H'�7r��8'�L����N��/��R'�S�KGuNW�Tg�Qw�}iuXuY�u[�uQ�uW�tS��M��1��[�uQ��`��UG�U?vc/�L_�Yv[OvivP��a�vb�ug�vh�vm�vaW�p/wpGwN��ug�vw�w��x��y��  ;HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uitime.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihtime.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: application/zip

PK    ���H���"�  �    Barionet.MIBUT	 x)Wx)Wux �  �  �W�o�6~V���<%��Y��.��8J�v�=Kڽ�s�E������ݑ�-+N�%�&����v�%�+�ē�_���]xg�����sڞ���b%aX��T�l@h��Lg%���=WE.�^���53���%�1�,[���}{2��F���������6�U�oI�	.Y�����Ar��^>O#�/E��)�$�*�YS[��f[��8���ጤ^q#�j�rХ��Պ�F�6L`����\@&r^!�ݮ���D�J���k�3�tӥ0��C����2�:팔�����~��g �)��aX�Ei�҈�H�{�������݁�����	#��.X�A�:P�>��lo���ݾ��Z�"c��(����F�&��Q|%O��ri��<}�΢���p~m����p��d����p܆c'D>�1�˗����t2����v�߸*��\;ޮ���f7#���]xLvr�)����4xT������l8�!��o�I�Y��c��֒Q�ųp|[�َ�����l
NyM.��Xɔg`0�J���R���c�𼁳PrK��>�a4
C
~�thn:��fV��B����<1���X0)�7�aO�0!S�d��]Ò=����vE�_�v;��`pfçFJ=�6c+�
̡s���H+�o@t]SA�7Z���2,7�70�����]�Xț��Ӏ!t��VE�[�r��EU�Rֲ�R���X&0���*���7�;�i�\x��5��5.mAx���&f6���S����=,$ni�0k����ܣ�Q���|��^��=��<4�
%�����=x�6�w,�e-�7�v�Q����+:�\���]N�
�:���BY�#�"�5~X=ϋ����W�qp��Qv�g�d8Q��Ҷ̳����B�E*�yD�Y8��n{'��a�a��?�GM��,�k�X���R�K��T��N��u/!��N��)%)&�m����%����y�%�Ch\@	-l�+$� ��g'��ޣV�rHmpr/R��J9�x��Z��c{��Q��`<
`rc� 7���~�8�`��z�Gr�d��6��N��	:E	�R��'�	����Ʃ�hM �e��Qy� d���,PX�2)�A<$�B��2r}�r�i��s�������Oe�
�!�T<�yl;�UN��F�K8����Nu�BHd���T�
k֖ۡ��6>����gh�ҵr�Y�Y�����꒘���E�������eJ�o���T����ޱr���qX���\͹� �v�}S�h��/�YN^'�2�)k���?jKR*�!S�Z�XԚ^Y�a�h|,�]Ez��6�"��`6��Q��A������ z�U�Ĥ%uM�JS�U���`Hl�o���=��5�P����r��=�\�[�F%��ǐ瑗�Z�+�JwrU©-�����ǯ5�3���=�$~^Җ+���f]�ή���������PK    ���H���"�  �           ��    Barionet.MIBUT x)Wux �  �  PK      R       HTTP/1.0 200
Content-type: image/gif

GIF89aP J �  �����׼}��&5!� � ,    P J  ���������ڋ�޼���H�扦�ʶ�+��2��7"�3��'�uB��x���a�+&�����	�Ыx<> �U�@{���=7��Y�J����c ��շ��G���(ȅ���ذɇ��T��g�������T���� U:�iKk(�j�$�X`�**�K8Z9���z� '
���<�V��)*���V7H��f̴P>� �#��S.��J'd�N��<�0�qsp���CU�x��!kb1��:��#W(8W�9��JC*5j�fEc涙�F�Έ�F�y�C^ ����;�K16�WM�N�h.���:�E��A	��Yȸm��fl�jJ�>�
$:@o�sd0}��y���۩{�M;����`"kw�31kC���p��v;��ݤ�z�5�$#��
[�~;��ٴk۾�;��ݼ{��<���ċ?�<���̛;�]  ;HTTP/1.0 200
Content-type: text/html

<html>
<head>
<style type="text/css">	
div.lpadding {
          padding-left: 20px;
}	
</style>
</head>
<div class="lpadding">
<font size="4" face="Arial"><b><br>Settings saved. To activate, please reboot unit!<br><br>
<font size=3><a href="setup.cgi?L=uireboot2.html&R" >Reboot</a></b></font> 
</div> 
</html>HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uireboot.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame name="help" src="uihreboot.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/plain

&L(0,"*",1);MAC=&LIO(1,"%H",0);
001=&LIO(1,"%u",1); 
002=&LIO(1,"%u",2);
101=&LIO(1,"%u",101);
102=&LIO(1,"%u",102); 
103=&LIO(1,"%u",103);  
104=&LIO(1,"%u",104);
201=&LIO(1,"%u",201);  
202=&LIO(1,"%u",202);  
203=&LIO(1,"%u",203); 
204=&LIO(1,"%u",204); 
205=&LIO(1,"%u",205);   
206=&LIO(1,"%u",206);   
207=&LIO(1,"%u",207);   
208=&LIO(1,"%u",208);   
 
 HTTP/1.0 200
Content-type: text/html

<html><!--&L(0,"*",21);-->
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="&LSetup(4,"%s",100,S);uiappsetup1.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0 name="appsetup">
  <frame src="&LSetup(4,"%s",100,S);uihappsetup1.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uistatus.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihstatus.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: image/gif

GIF89a  �  ���   !�     ,       D ;HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*");
<head><meta http-equiv="refresh" content="4; url=uistatus.html" http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">	
<!--
body.lpadding {
          padding-left: 20px;
}	
a:link, a:visited, a:active	 {
	word-spacing: 0;
	font-weight: bold;
	color: #000000;	
	text-decoration: underline;
	text-decoration-color: #000000;
}
a:hover {
	text-decoration: none;
	color: #ff2a2a;	
}
-->
</style>
</head>
<body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF><font face=Arial><br>
<font size=3><b>DEVICE STATUS</b> &nbsp; &nbsp; &nbsp; <font size=2> Refresh rate: &nbsp; 4 sec. &nbsp; &nbsp; 
 <a href="uistatus2.html" title="refresh this page every 2 seconds" target="_self"> 2 seconds</a> &nbsp; &nbsp;
 <a href="uistatusn.html" title="do not refresh this page" target="_self">no refresh</a>
</font>
<div id="Layer1" style="position:absolute; left:20px; top:64px; width:602px; height:184px; z-index:1"><img src="uigd.gif" width="601" height="247"></div>
<div id="Layer2" style="position:absolute; left:181px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",201);.gif"></div>
<div id="Layer3" style="position:absolute; left:230px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",202);.gif"></div>
<div id="Layer4" style="position:absolute; left:279px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",203);.gif"></div>
<div id="Layer5" style="position:absolute; left:327px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",204);.gif"></div>
<div id="Layer6" style="position:absolute; left:376px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=1,999 target="empty"><img src="d&LIO(1,"%u",1);.gif"></a></div>
<div id="Layer7" style="position:absolute; left:426px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=2,999 target="empty"><img src="d&LIO(1,"%u",2);.gif"></a></div>
<div id="Layer8" style="position:absolute; left:477px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=3,999 target="empty"><img src="d&LIO(1,"%u",3);.gif"></a></div>
<div id="Layer9" style="position:absolute; left:526px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=4,999 target="empty"><img src="d&LIO(1,"%u",4);.gif"></a></div>
<div id="Layer22" style="position:absolute; left:20px; top:340px; width:155px; height:22px; z-index:2">
<strong><font size="2" face="Arial, Helvetica, sans-serif">TEMPERATURE   </font></strong><br></div>
<div id="Layer28" style="position:absolute; left:80px;  top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",601,5,0,8);</b></font></div>
<div id="Layer29" style="position:absolute; left:130px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",602,5,0,8);</b></font></div>
<div id="Layer30" style="position:absolute; left:180px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",603,5,0,8);</b></font></div>
<div id="Layer31" style="position:absolute; left:230px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",604,5,0,8);</b></font></div>
<div id="Layer32" style="position:absolute; left:280px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",605,5,0,8);</b></font></div>
<div id="Layer33" style="position:absolute; left:330px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",606,5,0,8);</b></font></div>
<div id="Layer34" style="position:absolute; left:380px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",607,5,0,8);</b></font></div>
<div id="Layer35" style="position:absolute; left:430px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",608,5,0,8);</b></font></div>
<div id="Layer36" style="position:absolute; left:510px; top:370px; width:39px; height:22px; z-index:2">
 <font size="2" face="Arial, Helvetica, sans-serif"><b><A href="uifitemp.html" title="Show 1-wire Temperature Settings"  target="_top">Temperature_IDs</A></b></font>
</div>
</body>
</html>
	HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
  </font></b><font size="2" face="Arial"><br>
  <font size="2" face="Arial"><b>Defaults<br>
  </b>Click on &quot;Defaults&quot; to revert all settings except &quot;Network
  configuration&quot; to
  factory defaults.<br>
  <br>
  The screen will show &quot;Settings reverted to factory defaults.&quot; and the load
  the
&quot;Reboot&quot; page.<br>
  </font><font size="2" face="Arial"><br>
  To apply the change click on &quot;Reboot&quot;<br>
  </font><br>
<font size="2" face="Arial">The screen will show &quot;Device will boot now.
Please wait.&quot; and after this a succesfull boot will be indicated. A further menu selection can then be made.</font>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
  <head>
  <style type="text/css">
    body.lpadding {
          padding-left: 20px;
}	
</style> 
</head>
<body class="lpadding" BGCOLOR=#ffffff vlink=#000000 link=#000000><br>
<table border="0" cellspacing="0">
  <tr>
    <td height="15" valign="baseline"><font size="3" face="Arial"><b>Defaults</b></font></td>
    <td valign="baseline"><font size="2" face="Arial">&nbsp; </font></td>
  </tr>
  <tr>
    <td height="3" colspan="2"><img src="uigg.gif" width="550" height="1">    </td>
  </tr>
  <tr>
    <td valign="baseline" bordercolor="#CCCCCC">&nbsp;</td>
    <td valign="baseline">&nbsp;</td>
  </tr>
  <tr>
    <td valign="baseline" bordercolor="#CCCCCC"><font size="2" face="Arial"><b><a href="setup.cgi?L=uidefaults2.html&F" >Factory
    defaults</a></b></font></td>
    <td valign="baseline"><p><font size="2" face="Arial">Reverts
          all settings except &quot;Network configuration&quot; to factory defaults.<br>
      
      To apply the change reboot the device
    </font></p>
    </td>
  </tr>
</table>
</body>
</html> 
HTTP/1.0 200
Content-type: text/html

<html>
<head><title>Barionet Update</title></head>
<frameset cols="640,*" frameborder=no border=0>
	<frame src=uirloader.html>
	<frame src=uihloader.html>
</frameset>
</html>
HTTP/1.0 200
Content-type: image/gif

GIF89a  �    """333AAADDDOOOUUUfffkkkwww���������������������������������                              !�Built with GIF Movie Gear 3.0 !� d   ,       8`%�di�(i��h p�1:�@��滟>ot��L�H娂DLQqG#R�k���V[]�7 !� d   ,       >`%�di�� ,�<�ڶ�)�,L��3ר��D�t�Y�@�f�Ұ-1�"%V;r�p%�/,v���Q !� d   ,       A`%�di�fC ,ќ++�9�5�6�\��%���!�!��H&�y��M����ߒ�v��$�Z]	 !� d   ,       -`%�di�(�*�+�Vp ����3�ú�o�1ciS6�A��b�B !� 
   ,       d`%�di��s ��
+���K�@Q<��4�1D�d�dED�h!#����R�
Ց���d^u+fa��g��:��u8KB�~B%82:$Z35)+ v"! ;HTTP/1.0 200
Content-type: text/html

<html>
<head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>
</head>
    <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF><br>
	<p><font size="3" face="Arial"><b>Device has succesfully booted.<br><br>
Please click on a menu item above to continue.</b></font>
</html>HTTP/1.0 200
Content-type: text/html

<html>
  <head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>  
    <script language=JavaScript src=util.js></script>
  </head>
<body class="lpadding"><br>
<font size=2 face="Arial, Helvetica, sans-serif"><b>Your are not authorized!
</body>
</html>HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
  </font></b><font size="2" face="Arial"><br>
<b>Set Password (no password yet)</b><br>
Type new password in "New Password" and "Confirm Password" input box and press OK.
<br><br>
<b>Change Password</b><br>
Provide "Old Password" to authenticate.<br>
Type new password in "New Password" and "Confirm Password" 
input box and press OK.<br><br>
<b>Clear Password</b><br>
Provide "Old Password", leave "New Password" and "Confirm Password" blank.
Press OK to clear the password.
</font>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",2);
  <head>
    <style type="text/css">
    body.lpadding {
          padding-left: 20px;
    }
    </style>
    <script language=JavaScript src=util.js></script>
  </head>
  <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0">
    <font size=3 face=Arial>
	<form action=setup.cgi method=get target=_top>
		<table width=640 height="55" border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td valign="middle"><font size=3><b>&nbsp;SETTINGS</td>
			</tr>
		</table>
	</form>
    <table width=720 cellpadding="0" cellspacing="0" bgcolor=#000000>
      <tr align="center">
        <td width=80 height=30 background="uigl.gif"><font size=1><a href="uifnetwork.html" title="NETWORK SETTINGS" target="config">NETWORK</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifserial.html" title="SERIAL SETTINGS" target="config">SERIAL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifio.html" title="INPUT/OUTPUT SETTINGS" target="config">I/O</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifcontrol.html" title="CONTROL/INFO/DEBUG SETTINGS" target="config">CONTROL</a></td>
        <td width=80 background="uigs.gif"><font size=1>SNMP</td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftime.html" title="NTP TIME SETTINGS" target="config">TIME</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftemp.html" title="1-WIRE TEMPERATUR SENSOR SETTINGS" target="config">TEMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsecurity.html" title="PASSWORD SETTINGS" target="config">SECURITY</a></td>
        <td width="80" valign="bottom" bgcolor="#FFFFFF"><img src="uigg.gif" width="80" height="1"></td>
      </tr>
    </table><br>
	<table>
      <form action=setup.cgi method=get>
        <input type="hidden" name=L value=uisaved.html>
        <tr>
          <td><b><font size=2>Trap Receiver</td>
          <td><font size=2>
            <input name=B48 size=3 maxlength=3 value=&LSetup(1,"%u",48); onChange=IPCheck(this)><b> . </b>
        <input name=B49 size=3 maxlength=3 value=&LSetup(1,"%u",49); onChange=IPCheck(this)><b> . </b>
        <input name=B50 size=3 maxlength=3 value=&LSetup(1,"%u",50); onChange=IPCheck(this)><b> . </b>
        <input name=B51 size=3 maxlength=3 value=&LSetup(1,"%u",51); onChange=IPCheck(this)> (0.0.0.0 for no traps)</td>
        </tr>
        <tr>
          <td><b><font size=2>Repeat time</td>
          <td><font size=2>
            <input name=W68 size=5 maxlength=5 value=&LSetup(1,"%u",68,W); onChange=IntCheck(this)> seconds</td>
	    </tr>
        <tr>
          <td><font size=2><b><br>Digital Input</td>

          <td><font size=2><b><br>Trap</td>
        </tr>
        <tr>
          <td><b><font size=2>Input #1</td>
		  <td>
            <select size=1 name=B65b0>
              <option value=1&LSetup(3,"%s",65,b0,1," selected");>Yes</option>
              <option value=0&LSetup(3,"%s",65,b0,0," selected");>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td><b><font size=2>Input #2</td>
		  <td>
            <select size=1 name=B65b1>
              <option value=1&LSetup(3,"%s",65,b1,1," selected");>Yes</option>
              <option value=0&LSetup(3,"%s",65,b1,0," selected");>No</option>
            </select>
          </td>
        <tr>
          <td><b><font size=2>Input #3</td>
          <td>
            <select size=1 name=B65b2>
              <option value=1&LSetup(3,"%s",65,b2,1," selected");>Yes</option>
              <option value=0&LSetup(3,"%s",65,b2,0," selected");>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td><b><font size=2>Input #4</td>
		  <td>
            <select size=1 name=B65b3>
              <option value=1&LSetup(3,"%s",65,b3,1," selected");>Yes</option>
              <option value=0&LSetup(3,"%s",65,b3,0," selected");>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td><font size=2><b><br>Virtual Inputs</td>
          <td><font size=2><b><br>Trap</td>
        </tr>
        <tr>
          <td><b><font size=2>Enable traps</td>
		  <td>
            <select size=1 name=B198b0>
              <option value=1&LSetup(3,"%s",198,b0,1," selected");>Yes</option>
              <option value=0&LSetup(3,"%s",198,b0,0," selected");>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td><br>
            <input name="submit" type="submit" value=" OK ">
            <input name="reset" type="reset" value=" Cancel ">
          </td>
        </tr>
      </form>
    </table>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uisecurity.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihsecurity.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uicontrol.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihcontrol.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<head>
<title>BARIX Barionet 50 status page</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<frameset rows="116,*,0" frameborder="NO" border="0" framespacing="0">
  <frame src="uimenu0.html" name="menu" scrolling="NO" noresize marginwidth="5" marginheight="5" frameborder="0" framespacing="0">
  <frame src="uifstatus.html" name="config" marginwidth="5" marginheight="5" noresize frameborder="0" framespacing="0">
  <frame src="UntitledFrame-3" name="empty" scrolling="no" noresize>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: image/gif

GIF89a�T �     �   � ��   �� � ���������   � ��   �� � �����                                                                             3  f  �  �  � 3  33 3f 3� 3� 3� f  f3 ff f� f� f� �  �3 �f �� �� �� �  �3 �f ̙ �� �� �  �3 �f �� �� ��3  3 33 f3 �3 �3 �33 33333f33�33�33�3f 3f33ff3f�3f�3f�3� 3�33�f3��3��3��3� 3�33�f3̙3��3��3� 3�33�f3��3��3��f  f 3f ff �f �f �f3 f33f3ff3�f3�f3�ff ff3fffff�ff�ff�f� f�3f�ff��f��f��f� f�3f�ff̙f��f��f� f�3f�ff��f��f���  � 3� f� �� ̙ ��3 �33�3f�3��3̙3��f �f3�ff�f��f̙f��� ��3��f�����̙���� ��3��f�̙��̙���� ��3��f�����̙���  � 3� f� �� �� ��3 �33�3f�3��3��3��f �f3�ff�f��f��f�̙ ̙3̙f̙�̙�̙��� ��3��f�̙�������� ��3��f����������  � 3� f� �� �� ��3 �33�3f�3��3��3��f �f3�ff�f��f��f��� ��3��f����������� ��3��f�̙�������� ��3��f���������!�   ,    �T  � QH����*\�p�?�"J�H��ŋ'Rc�Qa�� CF�H��Ɏ�P�2�Ʉ1n|��#K�3i.�9R�ϟ(y��Ѕ1�=ʴ��)�V*�h���U�
�"ujE���KV�P�^��6�ڷ%�u�T�ŬZ�����*E�����ʷ���+VxXda�~AN){v*]�\�.�|�2⌓�ȹ4��D/m��,��ZQ'6m��h����L�6T��iF�3v��@=��M[�툰���i�s��=Q{]�ŝ���~�z�����%_�%�ӱ�e{�l���9����~���GF���E�5�F�	R����i~a��)Hz��T P�w�b�I� Y5�b�E��I)J��Q!�� S5J�b`1.E[�i�(ZQ*�"d��buB�� ZG����M��b�$�h"�!a	#KU�U⍛��[ܝ�Zd&� f@�x&YS�4#��ͩV�Mi9Q�>-(dqʩ�xԩ�d��*)�Umݹ�]t��(�ϱWh}�:�����YJ�S�}�1Ū����C���
�����$p�zQ�}=zԭ|�UѠ*�ԦCQ��I�QC�bȆ�W*~Pkm��^�m�ت*H�2�+U��j��MթԳ/��n�!J5�2�Ѳ}欣��JS���X�D�t[�$�&o���n�����J�p�nܯ��Ջ�ǝ)������P�'lK`=��Tǒ�O�
�FsAWU���j|�G�lи��ظ��,�A+��GFt�EkL�E�dӻ65u�U��TD�vD�XG�M�V����\w���IVv����t���5���]��"�M��k!��@<E���n,8Im�]�䊩K��P�r�QS�[�w֔N��[�5ɘ�����yk�ÞW�����~y��9�}�_��2���zƣ�<N����%�R}B���:�>�d��.5�?�-�����|�Բ����gL��H�N��*s�u��h⾟T�|��y��8�M�t��ޛx�m��K߄8w9��1��g�7
Z��>q��6��y� K2	%��dʄ(� n��=�Q�����S�����0:� "���4��T]�AE*F��U�"�E*�N,��2g�%�Y<�N�dƒ +z�3`f��6v&�ƻ �3;2Ć�"��4��)���A�����L�� �4���
Eb��a2dr#Ʉ�K~&A*��H�HL6�0!l)B�:����|}(�[ZP��tQz�wKT��['���xe��T�I���bY���1��k�
��D&G�iKk�&��4�hM�Sf�����iL�����b;s��D���%�gB�=?�3EEA��90Bf�L
���&*ъR���'(�i��8E��85�͟H0x�\�?�ٿ��0��'�:/�jܤ�F��t�m�8M(�F:&� r=a {�Q~���	U�Mh�D�5�3b�0"N�X��\���L�zH��P��BJr?%R���S"e�Y�y�Ӏ��h�l]��I��ơ��cb;��
�r�Q�U#դ�1��$����(0RԲdaE镝6���F+cZ��դ�+�.Ui����U�Y5�f)���賣�iy����3�R�a[ע���kA���:OI���S	�H�L5�ao4�j�K3��Rk��
��ORۻ���v*�=MW(��܎�zl=�s5�߾����]j~����g��3gc�;���5�D1�^�y���p�Ns�V�S���!�R l�rM<\���cL��8�Ԃ/Oz[%�Z�Q���}�:��Hlw�l/k��P�f�Uc�	�_*��JF�;�'����+~E�+�t�I�o�����M���&�����f6Y��iY~tmC�ȑ�=�t�����F��a��'��B��v�������Iw�ʂk�b��������L�l����rRI����>��j+_mCj�o��kjݙz׷b�&�ԗ��|��+����z���=l��Q�Fk�齶y0���Tgʶ���<����s���������Co�>	u���;0R��6pz�:p�F�v�Q5L��ި%8��-�=E̶B��a^�%�/ht�%)=��x�_m��{��Byi�}�m�Ͷ��TN�9����¡La���E��!W@k��}ҹe���(}��Z�CRQu����g���i�F��k�} ;HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",2);
  <head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>  
    <script language=JavaScript src=util.js></script>
  </head>
  <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0">
    <font size=3 face=Arial>
	<form action=setup.cgi method=get target=_top>
		<table width=640 height="55" border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td valign="middle"><font size=3><b>&nbsp;SETTINGS</td>
			</tr>
		</table>
	</form>
    <table width=720 cellpadding="0" cellspacing="0" bgcolor=#000000>
      <tr align="center">
        <td width=80 height=30 background="uigl.gif"><font size=1><a href="uifnetwork.html" title="NETWORK SETTINGS" target="config">NETWORK</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifserial.html" title="SERIAL PORT SETTINGS" target="config">SERIAL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifio.html" title="INPUT/OUTPUT SETTINGS" target="config">I/O</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifcontrol.html" title="CONTROL/INFO/DEBUG SETTINGS" target="config">CONTROL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsnmp.html" title="SNMP SETTINGS" target="config">SNMP</a></td>
        <td width=80 height=30 background="uigs.gif"><font size=1>TIME</td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftemp.html" title="1-WIRE TEMPERATUR SENSOR SETTINGS" target="config">TEMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsecurity.html" title="PASSWORD SETTINGS" target="config">SECURITY</a></td>
        <td width="80" valign="bottom" bgcolor="#FFFFFF"><img src="uigg.gif" width="80" height="1"></td>
      </tr>
    </table><br>

    <table>
      <form action=setup.cgi method=get>
        <input type="hidden" name=L value=uisaved.html>
        <tr>
          <td><b><font size=2>NTP Server</td>
          <td><font size=2>
            <input name=B84 size=3 maxlength=3 value=&LSetup(1,"%u",84); onChange=IPCheck(this)><b> . </b>
            <input name=B85 size=3 maxlength=3 value=&LSetup(1,"%u",85); onChange=IPCheck(this)><b> . </b>
            <input name=B86 size=3 maxlength=3 value=&LSetup(1,"%u",86); onChange=IPCheck(this)><b> . </b>
            <input name=B87 size=3 maxlength=3 value=&LSetup(1,"%u",87); onChange=IPCheck(this)> (0.0.0.0 for none)</font></td>
        </tr>
        <tr>
          <td><b><font size=2>Onewire RTC</td>
          <td><font size=2>&LIO(3,"",-1);</font></td>
        </tr>
        <tr>
          <td><b><font size=2>Time Zone</font></b></td>
          <td><select size=1 name=B94>
              <option value=232&LSetup(3,"%s",94,B,232," selected");>-12 (Kwajalein,
              Eniwetok)</option>
              <option value=234&LSetup(3,"%s",94,B,234," selected");>-11 (Samoa,
              Midway Islands)</option>
              <option value=236&LSetup(3,"%s",94,B,236," selected");>-10 (Hawaii)</option>
              <option value=238&LSetup(3,"%s",94,B,238," selected");>-9 (Alaska)</option>
              <option value=240&LSetup(3,"%s",94,B,240," selected");>-8 (US Pacific)</option>
              <option value=242&LSetup(3,"%s",94,B,242," selected");>-7 (US Mountain)</option>
              <option value=244&LSetup(3,"%s",94,B,244," selected");>-6 (US Central)</option>
              <option value=246&LSetup(3,"%s",94,B,246," selected");>-5 (US Eastern)</option>
              <option value=248&LSetup(3,"%s",94,B,248," selected");>-4 (Atlantic,
              Caracas, La Paz)</option>
              <option value=249&LSetup(3,"%s",94,B,249," selected");>-3:30 (Newfoundland)</option>
              <option value=250&LSetup(3,"%s",94,B,250," selected");>-3 (Buenos
              Aires, Brasilia)</option>
              <option value=252&LSetup(3,"%s",94,B,252," selected");>-2 (MidAtlantic)</option>
              <option value=254&LSetup(3,"%s",94,B,254," selected");>-1 (Azores)</option>
              <option value=0&LSetup(3,"%s",94,B,0," selected");>0 (Greenwich,
              London, Lisabon, Dublin)</option>
              <option value=2&LSetup(3,"%s",94,B,2," selected");>+1 (West Europe,
              Berlin, Paris, Rome, Madrid)</option>
              <option value=4&LSetup(3,"%s",94,B,4," selected");>+2 (East Europe,
              Athens, Cairo, Harare, Israel)</option>
              <option value=6&LSetup(3,"%s",94,B,6," selected");>+3 (Moscow)</option>
              <option value=7&LSetup(3,"%s",94,B,7," selected");>+3:30 (Tehran)</option>
              <option value=8&LSetup(3,"%s",94,B,8," selected");>+4 (Abu Dhabi,
              Baku, Muscat)</option>
              <option value=10&LSetup(3,"%s",94,B,10," selected");>+5 (Karachi,
              Islamabad, Ekaterinburg)</option>
              <option value=11&LSetup(3,"%s",94,B,11," selected");>+5:30 (Bombay,
              Calcutta, Madras, New Delhi)</option>
              <option value=12&LSetup(3,"%s",94,B,12," selected");>+6 (Dhaka,
              Almaty, Colombo)</option>
              <option value=14&LSetup(3,"%s",94,B,14," selected");>+7 (Bangkok,
              Hanoi, Jakarta)</option>
              <option value=16&LSetup(3,"%s",94,B,16," selected");>+8 (Beijing,
              Hong Kong, Singapore, Taipei, Perth)</option>
              <option value=18&LSetup(3,"%s",94,B,18," selected");>+9 (Tokyo,
              Osaka, Sapporo, Seoul, Yakutsk)</option>
              <option value=19&LSetup(3,"%s",94,B,19," selected");>+9:30 (Alelaide,
              Darwin)</option>
              <option value=20&LSetup(3,"%s",94,B,20," selected");>+10 (Brisbane,
              Melbourne, Sydney, Guam, Hobart)</option>
              <option value=22&LSetup(3,"%s",94,B,22," selected");>+11 (Solomon
              Is., Magadan, New Caledonia)</option>
              <option value=24&LSetup(3,"%s",94,B,24," selected");>+12 (Auckland,
              Wellington, Fiji, Kamchatka)</option>
            </select>
          </td>
          <td> <font size="2" face="Arial, Helvetica, sans-serif"> hours offset to UTC </font></td>
        </tr>
        <tr>
          <td> <br>
              <input name="submit" type="submit" value=" OK ">
              <input name="reset" type="reset" value=" Cancel ">
          </td>
        </tr>
      </form>
    </table>
    </body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uitemp.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihtemp.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
  </font></b><font size="2" face="Arial"><br>
<b>NTP Server IP Address</b><br>
Enter the 4 values of the desired NTP Server IP address e. g.:<br>
<em>&quot;0.0.0.0&quot;</em> for no NTP Server<br>
<em>&quot;192.168.0.1&quot;</em> for a NTP Server in a LAN<br>
When a valid NTP Server is given, the Barionet will set the internal clock accordingly
at start up and will synchronize again approximately every 10 hours.
<br>
<br>
<b>Onewire RTC</b><br>
If a Real-Time-Clock chip like the DS1904L is connected to the 1-wire bus then the bus address is shown. The internal clock will take the time from this RTC on start up..<br>
<br>
<b>Time Zone</b><br>
Enter the time zone information for your geographic location in order to display the correct local time.<br>
</body>
</html>
HTTP/1.0 200
Content-type: image/gif

GIF89aP  �  ������!�     ,    P   a������3ы�޼{n�G��yY!ʶn�Ʋ9�����n�����%!�B*;ƥ��TB��)uh�����{��g�q�l��k"�M������{��;?W  ;HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
</font></b><font size="2" face="Arial"><br>
  
<b>Built-in temperature sensor driver</b><br>
Enable or disable the built-in temperature sensor driver.<br>
The Barionet firmware contains a driver to automatically poll all attached 1-wire sensors and measure the temperature. By default the driver is enabled.<br>
In some cases though the BCL application might want to control the temperature sensors on its own. In that case, to avoid interference, the built-in driver can be disabled using this switch.<br>
<br>
Please note that temperature sensor addresses are still shown even if the driver is disabled.<br>
<br>
Default: <em>Enable</em><br><br>

 
<b>Dallas 1-wire&reg; Temperature sensors</b><br>
Temperature sensors can be attached to Barionet's 1-wire bus. This page shows addresses (unique IDs) of the detected temperature sensors (in the order of discovery).<br>
Up to 50 sensors can be attached, but only the first 8 are displayed. The complete list of addresses can be retrieved from IO registers 651 to 700.<br>

1-wire devices are detected at the boot-up time of the Barionet.  </font>
</body>
</html>
HTTP/1.0 200
Content-type: image/gif

GIF89a# " �  � ���,    # "  S������DXs�R{��8q��ꣶN�2���qb�H~<���:B��9"A���,)����fmDYTn1%�B>j<���;Q  ;HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",2);
  <head>
    <style type="text/css">
    body.lpadding {
          padding-left: 20px;
    }	
    </style> 
    <script language=JavaScript src=util.js></script>
  </head>
  <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0">
    <font size=3 face=Arial>
	<form action=setup.cgi method=get target=_top>
		<table width=640 height="55" border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td valign="middle"><font size=3><b>&nbsp;SETTINGS</td>
			</tr>
		</table>
	</form>
    <table width=720 cellpadding="0" cellspacing="0" bgcolor=#000000>
      <tr align="center">
        <td width=80 height=30 background="uigs.gif"><font size=1>NETWORK</td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifserial.html" title="SERIAL PORT SETTINGS" target="config">SERIAL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifio.html" title="INPUT/OUTPUT SETTINGS" target="config">I/O</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifcontrol.html" title="CONTROL/INFO/DEBUG SETTINGS" target="config">CONTROL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsnmp.html" title="SNMP SETTINGS" target="config">SNMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftime.html" title="NTP TIME SETTINGS" target="config">TIME</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftemp.html" title="1-WIRE TEMPERATUR SENSOR SETTINGS" target="config">TEMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsecurity.html" title="PASSWORD SETTINGS" target="config">SECURITY</a></td>
        <td width="80" valign="bottom" bgcolor="#FFFFFF"><img src="uigg.gif" width="80" height="1"></td>
      </tr>
    </table><br>
    <table>
      <form action=setup.cgi method=get><input type="hidden" type="text" name=L value=uisaved.html>
      <tr>
        <td><b><font size=2>IP Address</b></td>
        <td><font size=2>
        <input name=B0 size=3 maxlength=3 value=&LSetup(1,"%u",0); onChange=IPCheck(this)><b> . </b>
        <input name=B1 size=3 maxlength=3 value=&LSetup(1,"%u",1); onChange=IPCheck(this)><b> . </b>
        <input name=B2 size=3 maxlength=3 value=&LSetup(1,"%u",2); onChange=IPCheck(this)><b> . </b>
        <input name=B3 size=3 maxlength=3 value=&LSetup(1,"%u",3); onChange=IPCheck(this)> (0.0.0.0 for DHCP)<br></td>
      </tr>
      <tr>
        <td><b><font size=2>Netmask</b></td>
        <td><font size=2>
        <input name=N0 size=3 maxlength=3 value=&LSetup(2,"%u",6,0); onChange=netMaskCheck(this)><b> . </b>
        <input name=N1 size=3 maxlength=3 value=&LSetup(2,"%u",6,1); onChange=netMaskCheck(this)><b> . </b>
        <input name=N2 size=3 maxlength=3 value=&LSetup(2,"%u",6,2); onChange=netMaskCheck(this)><b> . </b>
        <input name=N3B6 size=3 maxlength=3 value=&LSetup(2,"%u",6,3); onChange=netMaskCheck(this)> (0.0.0.0 = default)</td>
      </tr>
      <tr>
        <td><b><font size=2>Gateway</b></td>
        <td><font size=2>
        <input name=B12 size=3 maxlength=3 value=&LSetup(1,"%u",12); onChange=IPCheck(this)><b> . </b>
        <input name=B13 size=3 maxlength=3 value=&LSetup(1,"%u",13); onChange=IPCheck(this)><b> . </b>
        <input name=B14 size=3 maxlength=3 value=&LSetup(1,"%u",14); onChange=IPCheck(this)><b> . </b>
        <input name=B15 size=3 maxlength=3 value=&LSetup(1,"%u",15); onChange=IPCheck(this)> (0.0.0.0 for no gateway)</td>
      </tr>
      <tr>
        <td><b><font size=2>DNS Server</b></td>
        <td><font size=2>
        <input name=B88 size=3 maxlength=3 value=&LSetup(1,"%u",88); onChange=IPCheck(this)><b> . </b>
        <input name=B89 size=3 maxlength=3 value=&LSetup(1,"%u",89); onChange=IPCheck(this)><b> . </b>
        <input name=B90 size=3 maxlength=3 value=&LSetup(1,"%u",90); onChange=IPCheck(this)><b> . </b>
        <input name=B91 size=3 maxlength=3 value=&LSetup(1,"%u",91); onChange=IPCheck(this)> (0.0.0.0 for none)</td>
      </tr>
      <tr>
      	<td><b><font size=2>DHCP Hostname</td>
      	<td><font size=2><input name=S109 size=15 maxlength=15 value="&LSetup(1,"%s",109,S);"></td>
      </tr>
      <tr>
        <td>
          <br><input type="submit" value=" OK ">
          <input type="reset" value=" Cancel ">
        </td>
      </tr>
      </form>
    </table>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
  </font></b><font size="2" face="Arial"><br>
  <font size="2" face="Arial"><b>Reboot<br>
  </b>Click on &quot;Reboot&quot; to reboot the device.</font>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*");
  <head>
    <style type="text/css">
    body.lpadding {
          padding-left: 20px;
    }	
    </style> 
    <script language=JavaScript src=util.js></script>
  </head>
<body class="lpadding" 	BGCOLOR=#ffffff vlink=#000000 link=#000000><br>
<font face=Arial>
<table border=0 cellspacing=0>
	<tr>
		<td colspan=2><font size=3><b>Versions</b></td>
	</tr>
	<tr>
		<td height="3" colspan="2"><img src="uigg.gif" width="550" height="1"></td>
	</tr>
	<tr>
		<td colspan=2><font size=2>Please report this version information when requesting help from support@barix.com<br><br></td>
	</tr>
	<tr>
		<td><font size=2><b>Firmware</b></td>
		<td><font size=2>V&LSetup(1,"%1V",0);</td>
	</tr>
	<tr>
		<td><font size=2><b>Web UI</b></td>
		<td><font size=2>V&LSetup(9,"%02x","BARIO50APPVERSION",1);.&LSetup(9,"%02x","BARIO50APPVERSION",0);</td>
	</tr>
	<tr>
		<td><font size=2><b>Setup</b></td>
		<td><font size=2>V&LSetup(1,"%02x",4);.&LSetup(1,"%02x",5);</td>
	</tr>
	<tr>
		<td><font size=2><b>I/O Drivers</b></td>
		<td><font size=2>V&LSetup(15,"%02x");.&LSetup(16,"%02x"); 20&LSetup(20,"%02x");&LSetup(21,"%02x");&LSetup(22,"%02x");</td>
	</tr>
	<tr>
		<td><font size=2><b>Bootloader</b></td>
		<td><font size=2>V&LSetup(7,"%02x");.&LSetup(8,"%02x");</td>
	</tr>
	<tr>
		<td colspan=2><font size=3><b><br>Update</b></td>
	</tr>
	<tr>
		<td height="3" colspan="2"><img src="uigg.gif" width="550" height="1"></td>
	</tr>
	<tr>
		<td colspan=2><font size=2><p>Please read the help instructions on the right side first.</p>
		Before you click the link below note that the update process can only be canceled by power cycling the device.<p>
		Clicking the back button in your browser will produce invalid content.</p>
		<a href="update.html" target="_top">Please click here to continue</a></font></td>
	</tr>
</table>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uiupdate.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihupdate.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",1);
<head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>
<meta http-equiv=refresh content="5; url=update.html">
<meta http-equiv="pragma" content="no-cache"></head>
</head>
<body class="lpadding" vlink=#000000 link=#000000 alink=#000000>
<p><font size=2 face="Arial, Helvetica, sans-serif"><b>The device is restarting now. Please wait.</b><p>
<img src=4to0.gif><br><br>
<font size=1>Please click <a href=update.html>here</a> after the countdown if your browser doesn't support forwarding.
</body>
</html>HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uiio.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihio.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",0);
  <head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>	
    <script language=JavaScript src=util.js></script>
  </head>
  <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0">
    <font size=3 face=Arial>
	<form action=setup.cgi method=get target=_top>
		<table width=640 height="55" border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td valign="middle"><font size=3><b>&nbsp;SETTINGS</td>
				<td align="right" valign="middle"></td>
			</tr>
		</table>
	</form>
    <table width=720 cellpadding="0" cellspacing="0" bgcolor=#000000>
      <tr align="center">
        <td width=80 height=30 background="uigl.gif"><font size=1><a href="uifnetwork.html" title="NETWORK SETTINGS" target="config">NETWORK</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifserial.html" title="SERIAL SETTINGS" target="config">SERIAL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifio.html" title="INPUT/OUTPUT SETTINGS" target="config">I/O</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifcontrol.html" title="CONTROL/INFO/DEBUG SETTINGS" target="config">CONTROL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsnmp.html" title="SNMP SETTINGS" target="config">SNMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftime.html" title="NTP TIME SETTINGS" target="config">TIME</a></td>
        <td width=80 background="uigs.gif"><font size=1>TEMP</td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsecurity.html" title="PASSWORD SETTINGS" target="config">SECURITY</a></td>
        <td width="80" valign="bottom" bgcolor="#FFFFFF"><img src="uigg.gif" width="80" height="1"></td>
      </tr>
    </table><br>
    <table>
    <form action=setup.cgi method=get><input type="hidden" type="text" name=L value=uisaved.html>
  <tr>
    <td><b><font size=2>Built-in temperature sensor driver</td>
    <td>
       <select size=1 name=B199b0>
             <option value=0&LSetup(3,"%s",199,b0,0," selected");>Enable</option>
             <option value=1&LSetup(3,"%s",199,b0,1," selected");>Disable</option>
       </select>
    </td>
  </tr>
  <tr><td>&nbsp;</td></tr>

  <tr>
    <td><b><font size=2>Temperature sensor&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><b><font size=2>One-Wire Address</td>
  </tr>
   <tr>
    <td><b><font size=2>Sensor #1</td>
    <td><font size=2 face=courier>&LIO(3,"",0);</td>
  </tr>
  <tr>
    <td><b><font size=2>Sensor #2</td>
    <td><font size=2 face=courier>&LIO(3,"",1);</td>
  </tr>
  <tr>
    <td><b><font size=2>Sensor #3</td>
    <td><font size=2 face=courier>&LIO(3,"",2);</td>
  </tr>
  <tr>
    <td><b><font size=2>Sensor #4</td>
    <td><font size=2 face=courier>&LIO(3,"",3);</td>
  </tr>
  <tr>
    <td><b><font size=2>Sensor #5</td>
    <td><font size=2 face=courier>&LIO(3,"",4);</td>
  </tr>
  <tr>
    <td><b><font size=2>Sensor #6</td>
    <td><font size=2 face=courier>&LIO(3,"",5);</td>
  </tr>
  <tr>
    <td><b><font size=2>Sensor #7</td>
    <td><font size=2 face=courier>&LIO(3,"",6);</td>
  </tr>
  <tr>
    <td><b><font size=2>Sensor #8</td>
    <td><font size=2 face=courier>&LIO(3,"",7);</td>
  </tr>
    </table>
  <table>
  <tr>
    <td><b><font size=2>Temperature sensors detected:&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><font size=2 face=courier>&LIO(3,"",-2");</td>
  </tr>
      <tr><td>&nbsp;</td></tr>
	  <tr>
        <td>
          <input type="submit" value=" OK ">
          <input type="reset" value=" Cancel ">
       </td>
      </tr>
  </form>
  </table>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<head>
<title>BARIX Barionet configuration</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<frameset rows="116,*,0" frameborder="NO" border="0" framespacing="0">
  <frame src="uimenu.html" name="menu" scrolling="NO" noresize marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uifnetwork.html" name="config" marginwidth=5 marginheight=5 noresize frameborder=0 framespacing=0>>
  <frame src="UntitledFrame-2" name="empty" scrolling="no" noresize></frame>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uiserial.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihserial.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help</b><br>
<br>
<font size=2><b><u>GENERAL</u></b><br><br>
<b>WEB server port</b><br>
Defines the webserver port of the device.<br>
If set to <em>"0"</em>( invalid port ), the default HTTP port (80) is used.<br>
Default: <em>"80"</em><br><br>
<b>BCL Program Name</b><br>
Enter the name (up to 8 characters without extension ".tok") of the BCL application to be started at power on or after reboot.<br>
If left empty the default BCL application (barionet.tok) is started.<br>
Default: <em>""</em><br><br>
<b>Lockdown mode</b><br>
Locks different protocol access to the device (command port, web access etc.). See manual for details. <br>
If set to <em>"0"</em> all access is granted.<br>
Default: <em>"0"</em><br><br>
<b>Modbus/TCP Timeout</b><br>
Defines the time in seconds after which a Modbus/TCP connection on port 502 will be closed due to inactivity.<br>
Enter <em>&quot;0&quot;</em> for no timeout (default).<br>
Enter <em>&quot;1&quot;</em> to <em>&quot;255&quot;</em> to enable the Timeout.<br><br>
<b><u>COMMAND API</u></b><br><br>
The Barionet 50 features a Command API, which can be accessed via UDP as well as via TCP.<br> <br>
<b>UDP command port</b><br>
UDP port for the command API. Value <em>"0"</em> disables the UDP command API.<br>
Barix uses the port <em>"12301"</em> on other products.<br>
Default: <em>"0"</em><br>
<b><br>TCP command port</b><br>
TCP port for the command API. Value <em>"0"</em> disables the TCP command API.<br>
Barix uses <em>"12302"</em> on other products.<br>
Default: <em>"0"</em><br><br>
<b>Timeout</b><br>
After the defined number of seconds of inactivity on the TCP command port, the Barionet 50 automatically disconnects the peer.<br>
Enter a value <em>&quot;1&quot;</em> to <em>&quot;255&quot;</em> to enable the timeout.<br>
Enter <em>&quot;0&quot;</em> for no timeout (default).<br><br>
<font size=2 face="Arial"><b><u>I/O STATE INFO</u></b><br><br>
The Barionet 50 can be configured to send I/O state change information via UDP and TCP. Cylic state reports via UDP can be configured as well.<br><br>
<b>UDP info send to<br>
</b>Input the 4 values of the desired destination IP address where the I/O state change information should be sent to using UDP e.g.:<br>
<em>&quot;0.0.0.0&quot;</em> for no info<br>
<em>&quot;192.168.0.12&quot;</em> for
a specific UDP target<br>
<em>&quot;192.168.0.255&quot;</em> for
a subnet UDP broadcast<br>
<b><br>UDP destination port<br>
</b>Define the port to be used when sending I/O
status change information. To enable both IP and port must be set.<br>
<b><br>
UDP interval<br>
</b>Define the time interval in seconds for cyclic I/O state reports (besides I/O state change information).<br> <br>
<b>TCP initial I/O state subscriptions</b><br>
The device can be configured to send I/O state change information to an established TCP command socket.If selected (<em>"Local I/O"</em>), the 4 relays and 4 digital inputs of the Barionet 50 are subscribed to the state reporting. <br>
In addition, the current state of the 4 digital inputs and 4 relays is sent when the TCP connection is established.<br>
To avoid the initial subscription select <em>"None"</em>.<br>
Default: <em>"Local I/O"</em><br><br>

<b>TCP add I/O state subscriptions</b><br>
Defines if a "getio" or �setio� command sent via the TCP command socket will subscribe the respective I/O for future state change messages (<em>"With getio/setio"</em>) or not (<em>"None"</em>). The subscription will be active as long the TCP command connection is established. 
The disconnection can be forced by the host or by a timeout (see parameter TCP command port / Timeout above).<br>
Default: <em>"None"</em><br><br>
<b><u>SYSLOG</u></b><br><br>
<b>Syslog Server IP Address<br>
</b>Syslog is a well known reporting protocol using UDP port 514 and is a standard component of most UNIX systems. Freeware Syslog receivers for Windows can be found on the Internet.<br>
Enter the 4 values of the desired Syslog Server IP address e. g.:<br>
<em>&quot;0.0.0.0&quot;</em> for subnet broadcast of Syslog messages<br>
<em>&quot;192.168.0.1&quot;</em> for a dedicated Syslog deamon<br>
<br>
<b>Syslog Debug Level</b><br>
Enter the level of Syslog debug information e. g.:<br>
<em>&quot;0&quot;</em> for no debug information<br>
<em>&quot;1&quot;</em> for system debug information (default setting)<br>
<em>&quot;2&quot; to &quot;9&quot;</em> for user defined BCL debug information<br>
<br>
<b>Support Mode/Flags</b><br>
Change this value only if asked for by a Barix support technician for in depth debugging. <br>
Default: <em>&quot;0&quot;</em> for no support debug information</font>
</body>
</html>
HTTP/1.0 200
Content-type: application/x-javascript

function PortCheck(I){
  d =parseInt(I.value, 10);
  if ( !( d<65536 && d>=0) ) {
    alert('Port value is out of range [0 - 65535]');
    I.value = I.defaultValue;
  }
}

function IntCheck(I){
  d =parseInt(I.value, 10);
  if ( !( d<65536 && d>=0) ) {
    alert('Value is out of range [0 - 65535]');
    I.value = I.defaultValue;
  }
}

function ByteCheck(I){
  d =parseInt(I.value, 10);
  if ( !( d<256 && d>=0) ) {
    alert('Value is out of range [0 - 255]');
    I.value = I.defaultValue;
  }
}

function IPCheck(I){
  d =parseInt(I.value, 10);
  if ( !(d<256 && d>=0) ) {
    alert('IP value is out of range [0 - 255]');
    I.value = I.defaultValue;
  }
}

function IP0to254(I){
  d =parseInt(I.value, 10);
  if ( !(d<255 && d>=0) ) {
    alert('IP value is out of range [0 - 254]');
    I.value = I.defaultValue;
  }
}

function IP1to254(I){
  d =parseInt(I.value, 10);
  if ( !(d<255 && d>0) ) {
    alert('IP value is out of range [1 - 254]');
    I.value = I.defaultValue;
  }
}

function CheckMetric(I){
  d =parseInt(I.value, 10);
  if ( !(d<16 && d>=0) ) {
    alert('Hop count value is out of range [0 - 15]');
    I.value = I.defaultValue;
  }
}

function netMaskCheck(I){
  d =parseInt(I.value, 10);
  if( !(d==0 || d==128 || d==192 || d==224 || d==240 || d==248 || d==252 || d==254 || d==255 )) {
    alert('Incorrect NetMask value!!!');
    I.value = I.defaultValue;
  }
}

function netMaskCheck3(I){
  d =parseInt(I.value, 10);
  if( !(d==0 || d==128 || d==192 || d==224 || d==240 || d==248 || d==252 || d==254 )) {
    alert('Incorrect NetMask value!!!');
    I.value = I.defaultValue;
  }
}

function Go(x) {
   parent.frames[3].location.href = x;
   document.forms[0].reset();
   document.forms[0].elements[0].blur();
}
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",2);
  <head>
    <style type="text/css">
    body.lpadding {
          padding-left: 20px;
    }	
    </style> 
    <script language=JavaScript src=util.js></script>
  </head>
  <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0">
    <font size=3 face=Arial>
	<form action=setup.cgi method=get target=_top>
		<table width=640 height="55" border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td valign="middle"><font size=3><b>&nbsp;SETTINGS</td>
			</tr>
		</table>
	</form>
    <table width=720 cellpadding="0" cellspacing="0" bgcolor=#000000>
      <tr align="center">
        <td width=80 height=30 background="uigl.gif"><font size=1><a href="uifnetwork.html" title="NETWORK SETTINGS" target="config">NETWORK</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifserial.html" title="SERIAL SETTINGS" target="config">SERIAL</a></td>
        <td width=80 background="uigs.gif"><font size=1>I/O</td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifcontrol.html" title="CONTROL/INFO/DEBUG SETTINGS" target="config">CONTROL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsnmp.html" title="SNMP SETTINGS" target="config">SNMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftime.html" title="NTP TIME SETTINGS" target="config">TIME</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftemp.html" title="1-WIRE TEMPERATUR SENSOR SETTINGS" target="config">TEMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsecurity.html" title="PASSWORD SETTINGS" target="config">SECURITY</a></td>
        <td width="80" valign="bottom" bgcolor="#FFFFFF"><img src="uigg.gif" width="80" height="1"></td>
      </tr>
    </table><br>
	<table>
      <form action=setup.cgi method=get><input type="hidden" name=L value=uisaved.html>
        <tr>
              <td><font size=2><b>Interface &nbsp; &nbsp; &nbsp;</td>
              <td><font size=2><b>Pullup &nbsp; &nbsp; </td>
              <td><font size=2><b>Polarity &nbsp; &nbsp; </td>
        </tr>
        <tr>
              <td><b><font size=2>Input #1</td>
              <td><font size=2>ON</td>
              <td><font size=2>Low Active</td>
        </tr>
        <tr>
              <td><b><font size=2>Input #2</td>
              <td><font size=2>ON</td>
              <td><font size=2>Low Active</td>
        </tr>
        <tr>
              <td><b><font size=2>Input #3</td>
              <td><font size=2>ON</td>
              <td><font size=2>Low Active</td>
        </tr>
        <tr>
              <td><b><font size=2>Input #4</td>
              <td><font size=2>ON</td>
              <td><font size=2>Low Active</td>
        </tr>
      </form>
    </table>
    </body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",2);
  <head>
    <style type="text/css">
    body.lpadding {
          padding-left: 20px;
    }	
    </style> 
    <script language=JavaScript src=util.js></script>
  </head>
  <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0">
<SCRIPT type="text/javascript">

function check_password()
{
     if(  document.getElementById("p1").value != document.getElementById("p2").value)
     {
       alert('New Password and Confirm Password does not match!');
       document.getElementById("p2").value = "";
       document.getElementById("p1").value = "";
       document.getElementById("p1").focus();
       return false;
     }
     //check if password set
    if(document.getElementById("p0_row").style.display == 'none')
    {
        //passoword not set
        if(document.getElementById("p1").value == 0
            && document.getElementById("p2").value ==0)
        {
            return false;
        }
    }
    else
    {
        //password set
        if(document.getElementById("p0").value == "")
        {
            //Old password not provided
            alert("Provide Old Password to set/clear password!");
            return false;
        }

        if(document.getElementById("p1").value == 0
            && document.getElementById("p2").value ==0)
        {
            return confirm("Do you realy want to clear the password?");
        }
    }
    return true;
}

</SCRIPT>
    <font size=3 face=Arial>
	<form action=setup.cgi method=get target=_top>
		<table width=640 height="55" border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td valign="middle"><font size=3><b>&nbsp;SETTINGS</td>
			</tr>
		</table>
	</form>
    <table width=720 cellpadding="0" cellspacing="0" bgcolor=#000000>
      <tr align="center">
        <td width=80 height=30 background="uigl.gif"><font size=1><a href="uifnetwork.html" title="NETWORK SETTINGS" target="config">NETWORK</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifserial.html" title="SERIAL SETTINGS" target="config">SERIAL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifio.html" title="INPUT/OUTPUT SETTINGS" target="config">I/O</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifcontrol.html" title="CONTROL/INFO/DEBUG SETTINGS" target="config">CONTROL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsnmp.html" title="SNMP SETTINGS" target="config">SNMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftime.html" title="NTP TIME SETTINGS" target="config">TIME</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftemp.html" title="1-WIRE TEMPERATUR SENSOR SETTINGS" target="config">TEMP</a></td>
        <td width=80 background="uigs.gif"><font size=1>SECURITY</td>
        <td width="80" valign="bottom" bgcolor="#FFFFFF"><img src="uigg.gif" width="80" height="1"></td>
      </tr>
    </table><br>
     <table>
      <form action=setup.cgi method=get>
        <tr>
          <input type="hidden" name=L value=uisaved.html>
        </tr>
        <TR id="p0_row" &LSetup(3,"%s",125,W,0,"style='display:none;'"); >
            <TD>
                <font size=2><b>Old Password</b>
            </TD>
            <TD>
                <font size=2><INPUT id="p0" TYPE="password" NAME=P VALUE="" MAXLENGTH="12"  SIZE="12">
            </TD>
          </TR>
        <TR>
            <TD>
                <font size=2><b>New Password</b>
            </TD>
            <TD>
                <font size=2><INPUT id="p1" TYPE="password" NAME=P1 VALUE="" MAXLENGTH="12"  SIZE="12">
            </TD>
          </TR>
          <TR>
            <TD>
                <font size=2><b>Confirm Password</b>
            </TD>
            <TD>
              <font size=2><INPUT id="p2" TYPE="password" MAXLENGTH="12"  SIZE="12">
            </TD>
          </TR>
        <tr>
          <td>
          <br>
            <input type="submit" value="  OK  " onClick="return check_password();">
            <input type="reset" value="Cancel">
          </td>
        </tr>
    </form>
    </table>
    </body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help</b></font><br><br>
<font size="2" face="Arial"><b>SNMP</b><br>
Barix Barionet 50 can issue a specific SNMP trap triggered by a digital input.<br><br>
<b>Trap Receiver</b><br>
Enter the 4 values of the desired SNMP Trap receiver IP address  e.g.:<br>
<em>&quot;0.0.0.0&quot;</em> for no receiver<br>
<em>&quot;192.168.0.12&quot;</em> for a specific receiver<br>
<em>&quot;192.168.0.255&quot;</em> for a subnet SNMP broadcast<br>
<b><br>
Repeat time<br>
</b>When an input is active
the trap will be issued repeatedly with this time in seconds until the input
becomes inactive.<br>
Enter <em>&quot;0&quot;</em> to deactivate repetition (results in two traps being
sent, one
for
an input going active
and one for it going inactive)<br>
<b><br>
Trap<br>
</b>For each input select if a trap should be issued when the state changes.Default
setting is <em>&quot;No&quot;</em>.<br>
<br>
<b>Virtual Inputs</b><br>
Virtual input registers 205-300 can also send traps on change. Enable this option to trigger an SNMP trap
every time a virtual input register value changes.<br>
Default setting is <em>&quot;No&quot;</em>.<br>
<b><br>
SNMP definition file (Private MIB)<br>
</b>In order to use the SNMP functions a private MIB definition file called Barionet.MIB is needed.<br><br>
<a href="Barionet.MIB" target="_blank">View MIB in the browser</a> or <a href="Barionet_MIB.zip">download zipped MIB file</a>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uisnmp.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihsnmp.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: image/gif

GIF89aD �     $$$^^^�&5����>I�Xb���������������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ,    D  � H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�*A   �k�v-V,�� l=�v����V���#W���+P�Z�& �v`a���ek�܌b���ڗ��e轜Yo��7(Z��ӦO�%�@��T��*;g���
�X7o��sƪy�m �?w�+p�r�`�⽻"P�w�� D���q�w�F`�W�7o�����'�>���y��awƕ@7@X���XF\��}���x�V�a��ן��9�Q�EX!{�]�XYz%�"e�M���~q10[�[�(�c�7�Sz�-^eJ��a��� �!��s�UVՋ ���k�ՂL.���+F�ܚY-I�a�$ 3vW�anF_V뙨�y%(w�w�b��؛z�`�~�\ \)���I��zo�G�YF����a镠��"覨:ը�����6����F������M��U'u
\�Q�Y"[��+V�F�ݧ��ZYZ��g�6峽%8�]5�m�������q�N�,��eJ`�YZ)������^l� ��j:���
��+� �����m����v�k�* �6��N��U�r�v��a�v���j�򓎵������l�ǰ_	,����)Ro���u �k%'0�IkT4�7�X@t&�餋!<�[Uc�J[ȟV��G*��jت��)�ݹ�q�x���h���ي��|�f��V{2?�U�R��A	(p��1c��I�[ч��K'��A<�Eg�� �a��=��Q6fX�^6F&r%��u��Y��Ţ�'
�{˟�%�`a���"�z�Mӏ?�k�=ʪ�f���9L�������Y����O���>��ԡ�r\��9���Y\l��8�\*N\�M��:��e<�ʞ��6(y
_�ɒb£.ue5 CVb�6;ٙ�������`L� ƃ�詆i����w���U=�t�2�}O&W��h�g-�5g;6�Q���$c9�YQ�p8W�e:ډX�2̙\�I�zs�sQ�p���H�:��x̣���>��� I�B�L�"��F:򑐌�$'II� ;HTTP/1.0 200
Content-type: image/gif

GIF89aP  � ���   !�   ,    P   Z�����\������^��%�&v���|�{�l�����>�����	!h<�J�I{Ba�)�jUa�5�n���9r�<�Q뗺y��V  ;HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uidefaults.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame name="help" src="uihdefaults.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
  </font></b><font size="2" face="Arial"><br>
  <font size="2" face="Arial"><b>Pullup<br>
  </b>All digital inputs on Barionet 50 feature an internal pull-up resistor.<br>
<b><br>
Polarity<br>
</b>The digital inputs are low active and act as a contact closure (e.g. with a button).<br>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<head><title>Barionet Update</title><meta http-equiv="pragma" content="no-cache"></head>
<frameset cols="*" frameborder=no border=0>
	<frame src=uirupdate.html>
</frameset>
</html>
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*");
<head>
<style type="text/css">	
<!--
body.lpadding {
          padding-left: 20px;
}	
a:link, a:visited, a:active	 {
	word-spacing: 0;
	font-weight: bold;
	color: #000000;	
	text-decoration: underline;
	text-decoration-color: #000000;
}
a:hover {
	text-decoration: none;
	color: #ff2a2a;	
}
-->
</style>
</head>
<body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF><font face=Arial><br>
<font size=3><b>DEVICE STATUS</b> &nbsp; &nbsp; &nbsp; <font size=2> Refresh rate: &nbsp; stopped &nbsp; &nbsp; <a href="uistatus2.html" title="refresh this page every 2 seconds" target="_self">2 seconds</a> &nbsp; &nbsp; <a href="uistatus.html" title="refresh this page every 4 seconds" target="_self">4 seconds</a></font>
<div id="Layer1" style="position:absolute; left:20px; top:64px; width:602px; height:184px; z-index:1"><img src="uigd.gif" width="601" height="247"></div>
<div id="Layer2" style="position:absolute; left:181px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",201);.gif"></div>
<div id="Layer3" style="position:absolute; left:230px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",202);.gif"></div>
<div id="Layer4" style="position:absolute; left:279px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",203);.gif"></div>
<div id="Layer5" style="position:absolute; left:327px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",204);.gif"></div>
<div id="Layer6" style="position:absolute; left:376px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=1,999 target="empty"><img src="d&LIO(1,"%u",1);.gif"></a></div>
<div id="Layer7" style="position:absolute; left:426px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=2,999 target="empty"><img src="d&LIO(1,"%u",2);.gif"></a></div>
<div id="Layer8" style="position:absolute; left:477px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=3,999 target="empty"><img src="d&LIO(1,"%u",3);.gif"></a></div>
<div id="Layer9" style="position:absolute; left:526px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=4,999 target="empty"><img src="d&LIO(1,"%u",4);.gif"></a></div>
<div id="Layer22" style="position:absolute; left:20px; top:340px; width:155px; height:22px; z-index:2">
<strong><font size="2" face="Arial, Helvetica, sans-serif">TEMPERATURE   </font></strong><br></div>
<div id="Layer28" style="position:absolute; left:80px;  top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",601,5,0,8);</b></font></div>
<div id="Layer29" style="position:absolute; left:130px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",602,5,0,8);</b></font></div>
<div id="Layer30" style="position:absolute; left:180px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",603,5,0,8);</b></font></div>
<div id="Layer31" style="position:absolute; left:230px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",604,5,0,8);</b></font></div>
<div id="Layer32" style="position:absolute; left:280px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",605,5,0,8);</b></font></div>
<div id="Layer33" style="position:absolute; left:330px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",606,5,0,8);</b></font></div>
<div id="Layer34" style="position:absolute; left:380px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",607,5,0,8);</b></font></div>
<div id="Layer35" style="position:absolute; left:430px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",608,5,0,8);</b></font></div>
<div id="Layer36" style="position:absolute; left:510px; top:370px; width:39px; height:22px; z-index:2">
 <font size="2" face="Arial, Helvetica, sans-serif"><b><A href="uifitemp.html" title="Show 1-wire Temperature Settings"  target="_top">Temperature_IDs</A></b></font>
</div>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<HTML>
<head>
<style type="text/css">
<!--
body.lpadding {
    padding-left: 20px;
}	
a:link, a:visited, a:active	 {
	word-spacing: 0;
	font-weight: bold;
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: none;
	color: #ff2a2a;	
}    
ul {
    display: inline;
}
li {
    display: inline;
}
#naming { 	
    height:40px;
    width:200px;
    float:left;
    padding-top:20px;
}
#menu {
    height:15px;
    float:left;	
    padding-top:35px;
}
-->
</style>
</head>

<BODY class="lpadding" BGCOLOR=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0" topmargin="0">
<font size="3" face="Arial">
<div id="naming">
	<img src="uiglogo.gif" width="168" height="32" border="0" usemap="#navBARIX">
	<!--<img src="uigstat.gif" width="176" height="40	"> -->
	<map name="navBARIX">
		<area shape="RECT" coords="0,0,168,73" href="http://www.barix.com/" target="_blank" title="VISIT THE BARIX WEBSITE"> 		
	   <!--<area shape="RECT" coords="173,2,319,51" href="http://www.barix.com/downloads/" target="_blank" title="VISIT THE BARIX SUPPORT WEBSITE">-->
	</map>
	<a href="http://www.barix.com/downloads/" target="_blank" title="VISIT THE BARIX WEBSITE - DOWNLOADS"><b>Barionet 50 </b></a>
</div>

<div id="menu">
<ul> <b>
     <li><a href="index.html" target="_parent" title="BACK TO HOME"> Home </a> 
     <li> &nbsp &nbsp &nbsp
     <li><a href="uifnetwork.html"  target="config" title="DEVICE SETTINGS"> Settings </a>
     <li> &nbsp &nbsp &nbsp
     <li><a href="uifdefaults.html"  target="config" title="FACTORY DEFAULTS"> Defaults </a>
     <li> &nbsp &nbsp &nbsp
     <li><a href="uifreboot.html"   target="config" title="REBOOT DEVICE"> Reboot </a>
     <li> &nbsp &nbsp &nbsp
     <li><a href="uifupdate.html" target="config" title="DEVICE UPDATE"> Update </a>
     <li> &nbsp &nbsp &nbsp
     <li><a href="uifappsetup1.html" target="config" title="APPLICATION SETUP"> Application Setup</a>
     </b>
</ul> 
</div> 
        
<!--    
	<img src="uigmconf.gif" width="580" height="20" border="0" usemap="#navMENU">
	<map name="navMENU">
          <area shape="RECT" coords="0,0,76,20" href="uifnetwork.html" target="config" title="DEVICE SETTINGS">
          <area shape="RECT" coords="85,0,163,20" href="uifdefaults.html" target="config" title="FACTORY DEFAULTS">
          <area shape="RECT" coords="172,0,239,20" href="uifreboot.html" target="config" title="REBOOT DEVICE">
          <area shape="RECT" coords="277,0,340,20" href="uifupdate.html" target="config" title="DEVICE UPDATE">
          <area shape="RECT" coords="378,0,518,19" href="uifappsetup1.html" target="config" title="APPLICATION SETUP">
          <area shape="RECT" coords="529,0,580,20" href="index.html" target="_parent" title="BACK TO HOME">
      </map>
      </p>
-->              
</font>
</BODY>
</HTML>
-- The Barix Barionet MIB leaf
-- The Barix MIB Registration Authority is barix.mib
-- Version:	2.3 
-- Date:	4th March, 2014
-- Copyright (c) 2005-2014 Barix AG
--
-- Changes:
-- 20050322 KPS  Updated according to Barix MIB registration authority
-- 20050525 KPS  Cosmetic. Made sure comments start at beginning of line
-- 20100118 KPS  Cosmetic. Pointless changes to suit some new validation tools 
-- 20101207 PK   Added digitalInputNotification trap definition
-- 20110513 JP   extended IO space range up to 1200.
-- 20140304 KPS  DisplayString, PhysAddress removed since not used

--          BARIX-MIB DEFINITIONS ::= BEGIN      --
         BARIONET-MIB DEFINITIONS ::= BEGIN

          IMPORTS
                  enterprises
                          FROM RFC1155-SMI
                  OBJECT-TYPE
                          FROM RFC-1212
                    TRAP-TYPE
                          FROM RFC-1215;
                          
 --         DisplayString ::=
 --             OCTET STRING
          -- This data type is used to model textual information taken
          -- from the NVT ASCII character set.  By convention, objects
          -- with this syntax are declared as having
          --
          --      SIZE (0..255)

 --         PhysAddress ::=
 --             OCTET STRING
          -- This data type is used to model media addresses.  For many
          -- types of media, this will be in a binary representation.
          -- For example, an ethernet address would be represented as
          -- a string of 6 octets.

                          
 
 
                barix          OBJECT IDENTIFIER ::= { enterprises 17491 }
--                software       OBJECT IDENTIFIER ::= { barix 1 }          --
--                barionet       OBJECT IDENTIFIER ::= { software 1 }       --
               products       OBJECT IDENTIFIER ::= { barix 1 }
               barionet       OBJECT IDENTIFIER ::= { products 1 }

 
-- Barionet MIB, subject to change   --  
-- Parameters (Prefix  Par)          --
 
		bariState OBJECT-TYPE
			SYNTAX INTEGER (0..1)
			ACCESS read-only
			STATUS mandatory
			DESCRIPTION
				"a value which indicates the operational status
				 of the Barionet.
				 	0: down (The Barionet is in startup phase)
					1: up   (The Barionet has actual port data)"
			::= { barionet 1 }

-- The Barionet input table   --

		bariInputTable OBJECT-TYPE
			SYNTAX SEQUENCE OF BariInputEntry
			ACCESS not-accessible
			STATUS mandatory
			DESCRIPTION 
                  "A list of Barionet I/O variables, indexed 1..1200
                   The function of the various addresses can be looked up in the manual"
                        ::= { barionet 2 }

		bariInputEntry OBJECT-TYPE
			SYNTAX BariInputEntry
			ACCESS not-accessible
			STATUS mandatory
			DESCRIPTION
				"A specific digital input entry."
			INDEX   { bariInputIndex }
			::= { bariInputTable 1 }

		BariInputEntry ::= 
			SEQUENCE {
                bariInputIndex     INTEGER (1..1200),
				bariInputValue	   INTEGER (0..4294967295)
			}

		bariInputIndex OBJECT-TYPE
            SYNTAX  INTEGER (1..1200)
			ACCESS	read-only
			STATUS	mandatory
			DESCRIPTION
				"The variable number. one to 1200"
                        ::= { bariInputEntry 1 }
		

		bariInputValue OBJECT-TYPE
			SYNTAX	INTEGER
			ACCESS	read-write
			STATUS	mandatory
			DESCRIPTION
				"The current value of the variable "
                        ::= { bariInputEntry 2 }
				
-- Barionet trap definitions --

		digitalInputNotification TRAP-TYPE
			ENTERPRISE barionet
			VARIABLES { bariInputIndex,
				    bariInputValue
			}
			DESCRIPTION 
				"A digitalInputNotification trap is sent on change
				of a digital input state or as a notification of
				the current state of the input.

				The two variables are the input number (index into 
				the input table) and the input state at the time of 
				the notification."
			::=1
          END
HTTP/1.0 200
Content-type: text/html

<html>
<frameset cols="680,*" frameborder="NO" border="0" framespacing="0">
  <frame src="uinetwork.html" marginwidth=5 marginheight=5 frameborder=0 framespacing=0>>
  <frame src="uihnetwork.html" marginwidth=5 marginheight=5 frameborder=3 framespacing=5>>
</frameset><noframes></noframes>
</html>
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*");
<head><meta http-equiv="refresh" content="2; url=uistatus2.html"></head>
<style type="text/css">	
<!--
body.lpadding {
          padding-left: 20px;
}	
a:link, a:visited, a:active	 {
	word-spacing: 0;
	font-weight: bold;
	color: #000000;	
	text-decoration: underline;
	text-decoration-color: #000000;
}
a:hover {
	text-decoration: none;
	color: #ff2a2a;	
}
-->
</style>
</head>
<body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF><font face=Arial><br>
<font size=3><b>DEVICE STATUS</b> &nbsp; &nbsp; &nbsp; <font size=2> Refresh rate: &nbsp; 2 sec. &nbsp; &nbsp; <a href="uistatus.html" title="refresh this page every 4 seconds" target="_self">4 seconds</a> &nbsp; &nbsp; <a href="uistatusn.html" title="do not refresh this page" target="_self">no refresh</a></font>
<div id="Layer1" style="position:absolute; left:20px; top:64px; width:602px; height:184px; z-index:1"><img src="uigd.gif" width="601" height="247"></div>
<div id="Layer2" style="position:absolute; left:181px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",201);.gif"></div>
<div id="Layer3" style="position:absolute; left:230px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",202);.gif"></div>
<div id="Layer4" style="position:absolute; left:279px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",203);.gif"></div>
<div id="Layer5" style="position:absolute; left:327px; top:250px; width:29px; height:22px; z-index:2"><img src="d&LIO(1,"%u",204);.gif"></div>
<div id="Layer6" style="position:absolute; left:376px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=1,999 target="empty"><img src="d&LIO(1,"%u",1);.gif"></a></div>
<div id="Layer7" style="position:absolute; left:426px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=2,999 target="empty"><img src="d&LIO(1,"%u",2);.gif"></a></div>
<div id="Layer8" style="position:absolute; left:477px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=3,999 target="empty"><img src="d&LIO(1,"%u",3);.gif"></a></div>
<div id="Layer9" style="position:absolute; left:526px; top:250px; width:29px; height:22px; z-index:2"><A href=/rc.cgi?o=4,999 target="empty"><img src="d&LIO(1,"%u",4);.gif"></a></div>
<div id="Layer22" style="position:absolute; left:20px; top:340px; width:155px; height:22px; z-index:2">
<strong><font size="2" face="Arial, Helvetica, sans-serif">TEMPERATURE   </font></strong><br></div>
<div id="Layer28" style="position:absolute; left:80px;  top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",601,5,0,8);</b></font></div>
<div id="Layer29" style="position:absolute; left:130px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",602,5,0,8);</b></font></div>
<div id="Layer30" style="position:absolute; left:180px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",603,5,0,8);</b></font></div>
<div id="Layer31" style="position:absolute; left:230px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",604,5,0,8);</b></font></div>
<div id="Layer32" style="position:absolute; left:280px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",605,5,0,8);</b></font></div>
<div id="Layer33" style="position:absolute; left:330px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",606,5,0,8);</b></font></div>
<div id="Layer34" style="position:absolute; left:380px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",607,5,0,8);</b></font></div>
<div id="Layer35" style="position:absolute; left:430px; top:370px; width:29px; height:22px; z-index:2"><font size="2" face="Arial, Helvetica, sans-serif"><b>&LIO(2,"%.1F",608,5,0,8);</b></font></div>
<div id="Layer36" style="position:absolute; left:510px; top:370px; width:39px; height:22px; z-index:2">
 <font size="2" face="Arial, Helvetica, sans-serif"><b><A href="uifitemp.html" title="Show 1-wire Temperature Settings"  target="_top">Temperature_IDs</A></b></font>
</div>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<HTML>
<head>
<style type="text/css">	
<!--
body.lpadding {
    padding-left: 20px;
}	
a:link, a:visited, a:active	 {
	word-spacing: 0;
	font-weight: bold;
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: none;
	color: #ff2a2a;	
}

ul {
    display: inline;
}
li {
    display: inline;
}
#naming { 	
    height:40px;
    width:200px;
    float:left;
    padding-top:20px;
}
#menu {
    height:15px;
    float:left;	
    padding-top:35px;
}
-->
</style>
</head>

<BODY class="lpadding" BGCOLOR=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0" topmargin="0">
<font size="3" face="Arial">
<div id="naming">
	<img src="uiglogo.gif" width="168" height="32" border="0" usemap="#navBARIX">
	<!--<img src="uigstat.gif" width="176" height="40	"> -->
		<map name="navBARIX">
		<area shape="RECT" coords="1,2,168,73" href="http://www.barix.com/" target="_blank" title="VISIT THE BARIX WEBSITE"> 		
	   <!--<area shape="RECT" coords="173,2,319,51" href="http://www.barix.com/downloads/" target="_blank" title="VISIT THE BARIX SUPPORT WEBSITE">-->
	</map>
	<a href="http://www.barix.com/downloads/" target="_blank" title="VISIT THE BARIX WEBSITE - DOWNLOADS"> Barionet 50</a>
</div>



<div id="menu">
<ul> 
     <li><a href="uiconfig.html" target="_parent" title="CONFIGURE & MANAGE DEVICE"> Configuration </a> 
</ul>
</div>
</font>
</BODY>
</HTML>
HTTP/1.0 200
Content-type: text/html

<html>
  <head>
    <style type="text/css">
    body.lpadding {
          padding-left: 20px;
    }	
    </style> 
  </head>
<body class="lpadding" BGCOLOR=#ffffff vlink=#000000 link=#000000><br>
<table border="0" cellspacing="0">
  <tr>
    <td height="15" valign="baseline"><font size=3 face="Arial"><b>Reboot</b></font></td>
    <td valign="baseline"><font size="2" face="Arial">&nbsp; </font></td>
  </tr>
  <tr>
    <td height="3" colspan="2"><img src="uigg.gif" width="550" height="1">    </td>
  </tr>
  <tr>
    <td valign="baseline" bordercolor="#CCCCCC">&nbsp;</td>
    <td valign="baseline">&nbsp;</td>
  </tr>
  <tr>
    <td valign="baseline" bordercolor="#CCCCCC"><font size="2" face="Arial"><b><a href="setup.cgi?L=uireboot2.html&R" >Reboot
    </a></b></font></td>
    <td valign="baseline"><font size="2" face="Arial">Reboots
          the device.</font>
    </td>
  </tr>
</table>
</body>
</html> 
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",2);
  <head>
  <style type="text/css">
    body.lpadding {
          padding-left: 20px;
}	
</style>
    <script language=JavaScript src=util.js></script>
  </head>
  <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0">
    <font size=3 face=Arial>
	<form action=setup.cgi method=get target=_top>
		<table width=640 height="55" border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td valign="middle"><font size=3><b>&nbsp;SETTINGS</td>
			</tr>
		</table>
	</form>
    <table width=720 cellpadding="0" cellspacing="0" bgcolor=#000000>
      <tr align="center">
        <td width=80 height=30 background="uigl.gif"><font size=1><a href="uifnetwork.html" title="NETWORK SETTINGS" target="config">NETWORK</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifserial.html" title="SERIAL SETTINGS" target="config">SERIAL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifio.html" title="INPUT/OUTPUT SETTINGS" target="config">I/O</a></td>
        <td width=80 background="uigs.gif"><font size=1>CONTROL</td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsnmp.html" title="SNMP SETTINGS" target="config">SNMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftime.html" title="NTP TIME SETTINGS" target="config">TIME</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftemp.html" title="1-WIRE TEMPERATUR SENSOR SETTINGS" target="config">TEMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsecurity.html" title="PASSWORD SETTINGS" target="config">SECURITY</a></td>
        <td width="80" valign="bottom" bgcolor="#FFFFFF"><img src="uigg.gif" width="80" height="1"></td>
      </tr>
    </table><br>
	<table>
      <form action=setup.cgi method=get><input type="hidden" type="text" name=L value=uisaved.html>
	  <tr>
      	<td colspan="2">
      	<font size="2"><u><b>GENERAL<b></u></td>
      </tr>
      <tr>
        <td><b><font size=2>WEB server port</td>
        <td><input name=W8 size=5 maxlength=5 value=&LSetup(1,"%u",8,W); onChange=PortCheck(this)></td>
      </tr>
       <tr>
        <td><b><font size=2>BCL Program Name</td>
        <td>
          <input name=S100 size=8 maxlength=8 value=&LSetup(1,"%s",100,S); ></td>
	</tr>
      <tr>
        <td><b><font size=2>Lockdown mode</td>
        <td>
          <input name=W10 size=5 maxlength=5 value=&LSetup(1,"%u",10,W); onChange=PortCheck(this)></td>
        </tr>
	<tr>
        <td><b><font size=2>Modbus/TCP timeout</td>
        <td>
          <input name=B97 size=3 maxlength=3 value=&LSetup(1,"%u",97,B); onChange=ByteCheck(this)> <font size=2> seconds</td>
      </tr>
	<tr>
		<td colspan="2"><br><font size="2"><u><b>COMMAND API</b></u>
      <tr>
        <td><b><font size=2>UDP command port</td>
        <td>
          <input name=W56 size=5 maxlength=5 value=&LSetup(1,"%u",56,W); onChange=PortCheck(this)></td>
        </tr>
      <tr>
        <td><b><font size=2>TCP command port</td>
        <td>
          <input name=W62 size=5 maxlength=5 value=&LSetup(1,"%u",62,W); onChange=PortCheck(this)>
        <b><font size=2> &nbsp Timeout
          <input name=B96 size=3 maxlength=3 value=&LSetup(1,"%u",96,B); onChange=ByteCheck(this)>
        </b><font size=2> seconds</td>
      </tr>
	<tr>
		<td colspan="2"><br><font size="2"><u><b>I/O STATE INFO</b></u>
      <tr>
        <td><b><font size=2>UDP info send to</td>
        <td><font size=2>
        <input name=B52 size=3 maxlength=3 value=&LSetup(1,"%u",52); onChange=IPCheck(this)><b> . </b>
        <input name=B53 size=3 maxlength=3 value=&LSetup(1,"%u",53); onChange=IPCheck(this)><b> . </b>
        <input name=B54 size=3 maxlength=3 value=&LSetup(1,"%u",54); onChange=IPCheck(this)><b> . </b>
        <input name=B55 size=3 maxlength=3 value=&LSetup(1,"%u",55); onChange=IPCheck(this)> (0.0.0.0 for no info)</font></td>
      </tr>
      <tr>
        <td><b><font size=2>UDP destination port&nbsp;</td>
        <td colspan="3">
          <input name=W58 size=5 maxlength=5 value=&LSetup(1,"%u",58,W); onChange=PortCheck(this)></td>
        </tr>
      <tr>
        <td><font size=2><b>UDP interval</b></td>
        <td colspan="3">
          <input name=W60 size=5 maxlength=5 value=&LSetup(1,"%u",60,W); onChange=PortCheck(this)>
	  <font size=2> seconds</td>
		</tr>
      <tr>
        <td><b><font size=2>TCP initial I/O state subscriptions</td>
        <td>
           <select size=1 name=B71b0>
                  <option value=1&LSetup(3,"%s",71,b0,1," selected");>None</option>
                  <option value=0&LSetup(3,"%s",71,b0,0," selected");>Local I/O</option>
                </select>
        </td>
      </tr>
      <tr>
        <td><b><font size=2>TCP add I/O state subscriptions</td>
        <td>
           <select size=1 name=B71b1>
                  <option value=1&LSetup(3,"%s",71,b1,1," selected");>With getio/setio</option>
                  <option value=0&LSetup(3,"%s",71,b1,0," selected");>None</option>
                </select></td>
      </tr>
	<tr>
		<td colspan="2"><br><font size="2"><u><b>SYSLOG</b></u>
      <tr>
        <td><b><font size=2>Syslog Server</td>
        <td><font size=2>
        <input name=B80 size=3 maxlength=3 value=&LSetup(1,"%u",80); onChange=IPCheck(this)><b> . </b>
        <input name=B81 size=3 maxlength=3 value=&LSetup(1,"%u",81); onChange=IPCheck(this)><b> . </b>
        <input name=B82 size=3 maxlength=3 value=&LSetup(1,"%u",82); onChange=IPCheck(this)><b> . </b>
        <input name=B83 size=3 maxlength=3 value=&LSetup(1,"%u",83); onChange=IPCheck(this)></td>
      </tr>

      <tr>
        <td><b><font size=2>Syslog Debug Level</td>
        <td><font size=2>
         <select size=1 name=B92>
           <option value=0;&LSetup(3,"%s",92,B,0," selected");>0</option>
           <option value=1;&LSetup(3,"%s",92,B,1," selected");>1</option>
           <option value=2;&LSetup(3,"%s",92,B,2," selected");>2</option>
           <option value=3;&LSetup(3,"%s",92,B,3," selected");>3</option>
           <option value=4;&LSetup(3,"%s",92,B,4," selected");>4</option>
           <option value=5;&LSetup(3,"%s",92,B,5," selected");>5</option>
           <option value=6;&LSetup(3,"%s",92,B,6," selected");>6</option>
           <option value=7;&LSetup(3,"%s",92,B,7," selected");>7</option>
           <option value=8;&LSetup(3,"%s",92,B,8," selected");>8</option>
           <option value=9;&LSetup(3,"%s",92,B,9," selected");>9</option>
         </select>
         &nbsp<b> Flags </b><input name=B93 size=3 maxlength=3 value=&LSetup(1,"%u",93); >
        </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
	  <tr>
        <td>
          <input type="submit" value=" OK ">
          <input type="reset" value=" Cancel ">
       </td>
      </tr>
      </form>
    </table>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>&L(0,"*",2);
  <head>
    <style type="text/css">
    body.lpadding {
          padding-left: 20px;
    }	
    </style> 
    <script language=JavaScript src=util.js></script>
  </head>
  <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF leftmargin="0">
    <font size=3 face=Arial>
	<form action=setup.cgi method=get target=_top>
		<table width=640 height="55" border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td valign="middle"><font size=3><b>&nbsp;SETTINGS</td>
			</tr>
		</table>
	</form>
    <table width=720 cellpadding="0" cellspacing="0" bgcolor=#000000>
      <tr align="center">
        <td width=80 height=30 background="uigl.gif"><font size=1><a href="uifnetwork.html" title="NETWORK SETTINGS" target="config">NETWORK</a></td>
        <td width=80 background="uigs.gif"><font size=1>SERIAL</td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifio.html" title="INPUT/OUTPUT SETTINGS" target="config">I/O</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifcontrol.html" title="CONTROL/INFO/DEBUG SETTINGS" target="config">CONTROL</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsnmp.html" title="SNMP SETTINGS" target="config">SNMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftime.html" title="NTP TIME SETTINGS" target="config">TIME</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uiftemp.html" title="1-WIRE TEMPERATUR SENSOR SETTINGS" target="config">TEMP</a></td>
        <td width=80 background="uigl.gif"><font size=1><a href="uifsecurity.html" title="PASSWORD SETTINGS" target="config">SECURITY</a></td>
        <td width="80" valign="bottom" bgcolor="#FFFFFF"><img src="uigg.gif" width="80" height="1"></td>
      </tr>
    </table><br>
    <table>
      <form action=setup.cgi method=get><input type="hidden" name=L value=uisaved.html>
        <tr>
          <td>&nbsp;</td>
          <td><b><u><font size=2>RS-232</td>
          <td><b><u><font size=2>RS-485</td>
        </tr>
        <tr>
          <td><b><font size=2>Serial speed</td>
          <td><font size=2>
				<select size=1 name=B16>
					<option value=7 &LSetup(3,"%s",16,B,7,"selected");>300</option>
					<option value=6 &LSetup(3,"%s",16,B,6,"selected");>600</option>
					<option value=5 &LSetup(3,"%s",16,B,5,"selected");>1200</option>
					<option value=4 &LSetup(3,"%s",16,B,4,"selected");>2400</option>
					<option value=3 &LSetup(3,"%s",16,B,3,"selected");>4800</option>
					<option value=2 &LSetup(3,"%s",16,B,2,"selected");>9600</option>
					<option value=1 &LSetup(3,"%s",16,B,1,"selected");>19200</option>
					<option value=0 &LSetup(3,"%s",16,B,0,"selected");>38400</option>
					<option value=9 &LSetup(3,"%s",16,B,9,"selected");>57600</option>
					<option value=11 &LSetup(3,"%s",16,B,11,"selected");>76800</option>
					<option value=8 &LSetup(3,"%s",16,B,8,"selected");>115200</option>
					<option value=12 &LSetup(3,"%s",16,B,12,"selected");>230400</option>
				</select>
        Baud</font></td>
          <td><font size=2>
            <select size=1 name=B32>
					<option value=7 &LSetup(3,"%s",32,B,7,"selected");>300</option>
					<option value=6 &LSetup(3,"%s",32,B,6,"selected");>600</option>
					<option value=5 &LSetup(3,"%s",32,B,5,"selected");>1200</option>
					<option value=4 &LSetup(3,"%s",32,B,4,"selected");>2400</option>
					<option value=3 &LSetup(3,"%s",32,B,3,"selected");>4800</option>
					<option value=2 &LSetup(3,"%s",32,B,2,"selected");>9600</option>
					<option value=1 &LSetup(3,"%s",32,B,1,"selected");>19200</option>
					<option value=0 &LSetup(3,"%s",32,B,0,"selected");>38400</option>
					<option value=9 &LSetup(3,"%s",32,B,9,"selected");>57600</option>
					<option value=11 &LSetup(3,"%s",32,B,11,"selected");>76800</option>
					<option value=8 &LSetup(3,"%s",32,B,8,"selected");>115200</option>
					<option value=12 &LSetup(3,"%s",32,B,12,"selected");>230400</option>
				</select>
        Baud</font></td>
        </tr>
        <tr>
          <td><b><font size=2>Data bits</td>
          <td><font size=2>
            <select size=1 name=B17b6>
              <option value=0&LSetup(3,"%s",17,b6,0," selected");>8</option>
              <option value=1&LSetup(3,"%s",17,b6,1," selected");>7</option>
            </select>
          </font></td>
          <td><font size=2>
            <select size=1 name=B33b6>
              <option value=0&LSetup(3,"%s",33,b6,0," selected");>8</option>
              <option value=1&LSetup(3,"%s",33,b6,1," selected");>7</option>
            </select>
          </font></td>
        </tr>
        <tr>
          <td><b><font size=2>Parity bit</td>
          <td><font size=2>
            <select size=1 name=B17b5>
              <option value=0&LSetup(3,"%s",17,b5,0," selected");>Disabled</option>
              <option value=1&LSetup(3,"%s",17,b5,1," selected");>Enabled</option>
            </select>
            <select size=1 name=B17b4>
              <option value=0&LSetup(3,"%s",17,b4,0," selected");>Odd</option>
              <option value=1&LSetup(3,"%s",17,b4,1," selected");>Even</option>
            </select>&nbsp;
			</font></td>
          <td><font size=2>
            <select size=1 name=B33b5>
              <option value=0&LSetup(3,"%s",33,b5,0," selected");>Disabled</option>
              <option value=1&LSetup(3,"%s",33,b5,1," selected");>Enabled</option>
            </select>
            <select size=1 name=B33b4>
              <option value=0&LSetup(3,"%s",33,b4,0," selected");>Odd</option>
              <option value=1&LSetup(3,"%s",33,b4,1," selected");>Even</option>
            </select>
          </font></td>
        </tr>
        <tr>
          <td><b><font size=2>Stop bits</td>
          <td><font size=2>
            <select size=1 name=B17b7>
              <option value=0&LSetup(3,"%s",17,b7,0," selected");>1</option>
              <option value=1&LSetup(3,"%s",17,b7,1," selected");>2</option>
            </select>
          </font></td>
          <td><font size=2>
            <select size=1 name=B33b7>
              <option value=0&LSetup(3,"%s",33,b7,0," selected");>1</option>
              <option value=1&LSetup(3,"%s",33,b7,1," selected");>2</option>
            </select>
          </font></td>
        </tr>
        <tr>
          <td><b><font size=2>Flow control</td>
          <td><font size=2>
            <select size=1 name=B17b1-2>
              <option value=0&LSetup(3,"%s",17,b1-2,0," selected");>None</option>
              <option value=1&LSetup(3,"%s",17,b1-2,1," selected");>Software (XON/XOFF)</option>
              <option value=2&LSetup(3,"%s",17,b1-2,2," selected");>Hardware (RTS/CTS)</option>
            </select>
          </font></td>
		  <td><font size=2>n.a.</td>
        </tr>
        <tr>
          <td><b><font size=2>Local port</td>
          <td><input name=W18 size=5 maxlength=5 value=&LSetup(1,"%u",18,W); onChange=PortCheck(this)></td>
          <td><input name=W34 size=5 maxlength=5 value=&LSetup(1,"%u",34,W); onChange=PortCheck(this)></td>
        </tr>
        <tr>
          <td><b><font size=2>Disconnect Tout</td>
          <td><input name=B26 size=3 maxlength=3 value=&LSetup(1,"%u",26,B); onChange=ByteCheck(this)><font size=2> seconds</td>
          <td><input name=B42 size=3 maxlength=3 value=&LSetup(1,"%u",42,B); onChange=ByteCheck(this)><font size=2> seconds</td>
        </tr>
        <tr>
          <td><br>
            <input name="submit" type="submit" value=" OK ">
            <input name="reset" type="reset" value=" Cancel ">
            </tr>
      </form>
    </table>
    </body>
</html>
HTTP/1.0 200
Content-type: image/gif

GIF89aq  �  ������ZZZ�&5��ͩXb�>I                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ,    q   � H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I�b (X`@ʕQ� �L�؄���](t'N�( ��r�ЇH��$ �(y�ܪR P�Q��|ʔ� �c���mٜI���
�ҠMǦ�ʕ ׻N˴��*ηo�^e�q��z3u�4���l��j�R�-�"�+س]���,�'�̉���L8kc�hG�&���P����6��~�*T�J�C����v�ק�#J���[�%�[�n ʊ��(])u�%�˟O��������Ͽ��� � ;HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br><br>
<font size=2>Relay<br></b>
Click on the LED to toggle a relay.<br><br>
<b>Digital Inputs<br>
</b>The LED color next to the input number shows the digital input
status.<br>
<br><b>
Temperature<br>
</b>Shows the value (in degree Celsius) of the first 8 attached Dallas 1-wire&reg; temperature
sensors. The temperature sensors DS18B20, DS18S20, DS18B22 are recognised.<br>
The value of 256 degree Celsius signalises that the sensor is not connected or cannot be read.</font>
</body>
</html>
HTTP/1.0 200
Content-type: text/html

<html>
<head>
    <style type="text/css">	
      body.lpadding {
          padding-left: 20px;
      }
    </style>  
  <meta http-equiv="refresh" content="5; url=uireboot3.html">
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
    <body class="lpadding" bgcolor=#FFFFFF link=#FFFFFF vlink=#FFFFFF><br>
	<p><font size="3" face="Arial"><b>Device will boot now. Please wait.</b><br><br>
<font size="2">If you have changed the IP address type the new address in the URL address field of your browser now and hit the Enter key.
</font>
</html>HTTP/1.0 200
Content-type: image/gif

GIF89a# " � ������,    # "  S������DXs�R{��8q��ꣶN�2���qb�H~<���:B��9"A���,)����fmDYTn1%�B>j<���;Q  ;HTTP/1.0 200
Content-type: text/html

<html>
<body bgcolor="#CCCCCC">
<p><b><font face="Arial">Help<br>
  </font></b><font size="2" face="Arial"><br>
  <font size="2" face="Arial">Configure </font><font size="2" face="Arial"> the
  two serial ports.<br>
<br>
<b>Serial speed<br>
</b>Select the serial transmission speed in Baud (bits per second).<br>
Default: <em>&quot;9600&quot;</em><br>
<br>
<b>Data bits<br>
</b>Select the number of serial data bits.<br>
Default: <em>&quot;8&quot;</em><br>
<br>
<b>Parity bit<br>
</b>Select the parity bit settings.<br>
If enabled select Even or Odd parity.<br><br>
Default: <em>&quot;disabled&quot;</em><br>
<b>Stop bits<br>
</b>Select the number of serial stop bits.<br>
Default: <em>&quot;1&quot;</em><br>
<br>
<b>Flow control</b> (RS-232 only)<br>
Select the RS232 flow control. The options are: <em>"None"</em>, <em>"Software"</em> for XON/XOFF flow control or <em>"Hardware"</em> for RTS/CTS flow control.<br>
Default: <em>&quot;None&quot;</em><br>
<br>
<b>Local port</b><br>
Define the Port on which the serial gateway can be accessed using TCP.<br>
Default: <em>&quot;10001&quot;</em> for RS-232, <em>&quot;10002&quot;</em> for RS-485/422<br>
Enter <em>&quot;0&quot;</em> to disable TCP access and to free TCP handles for
 BCL application use<br><br>
<b>Disconnect Tout</b><br>
Defines the time in seconds after which the TCP connection to the local serial port will be closed due to inactivity.<br>
  Enter <em>&quot;0&quot;</em> to disable the Disconnect Timeout (default).</font>
  <br>  
  <font size="2" face="Arial">Enter <em>&quot;1&quot;</em> to <em>&quot;255&quot;</em> to enable the Disconnect Timeout.</font>

<p>
</body>
</html>
