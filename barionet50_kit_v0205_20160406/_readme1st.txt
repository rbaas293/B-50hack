Update Kit
==========

Version overview
----------------

Type        File name             Version_Date
Firmware    bn50.rom              V02.05_20160406
WEB UI      bario50web.cob        V01.10_20160106
FW Ext. 1   sg.bin                V10.13_20160113
FW Ext. 2   bclio.bin             V02.06_20151028
Bootloader  exfull.rom            V99.27_20141216
BCL app     barionetbcl.cob       V01.23_20111205



Content
-------

The Update Kit comes in a ZIP file format and contains 5 sub folders:

A) update_rescue    update via web browser or rescue via serial cable
B) gold_unit        files for the Gold Unit update procedure
C) versionhistory   version history of each part
D) webuidevkit      web ui development kit
E) bcldevkit        BCL example applications and development kit
F) tools            helper tools for webuidevkit and bcldevkit


Documentation
-------------
This version of Barionet50 implements BCL language as described in the 
BCL Programmers Manual version 1.20.


Installation
------------

First extract the Update Kit using a tool like WinZIP or the like.



A1) How to update your device (needs a standard web browser)
------------------------------------------------------------

Please Note:
The update described below will NOT change the current configuration settings!
Reverting to Factory Defaults is recommended.

1. Open a browser and type the device's IP address into the URL field and hit
   the ENTER key. You can also use the Barix Discovery Tool to find the device.
   This is available in the Barix Web Site Downloads section under Software Tools.
   The Barix Discovery Tool will also find devices with no IP address. You can 
   identify your device by its MAC address printed on the base. 
2. Click on the UPDATE button to enter the update page.
3. Click on "Please click here to continue" to launch the update process.
   The device will restart in a special mode called Bootloader showing a number
   counting down. Upon start up the following screen appears ready for the
   update process. Boot loader and HW information appears after the word Update.
   This can be ignored. (The word Browse may differ depending on browser and language).
____________________________________________________
Update <Boot loader and HW information>             |
                                                    |
---------------------------------------------       |
Resource  Browse  No file selected                  |
                                       Upload       |
                                       Reboot       |
---------------------------------------------       |	
                                                    |
Advanced Update                                     |
---------------                                     |
____________________________________________________|

4. To upload an update click on "Browse" to locate the file you want to update.
   Browse to the folder "update_rescue" and choose the file compound.bin.
5. Once selected, click on "Upload". This process can take a few minutes.
   After a successful upload click on the "update" link and when the Update
   window reappears click the "Reboot" button. The device will reboot with the new
   firmware. Click on the here link to reload the main page.


A2) How to rescue your device under Windows using a serial port
---------------------------------------------------------------------

Please Note:
The update described below will CHANGE the current configuration settings!
So it is recommended to use this method only as a last resort.

1.  Unplug the power supply.
2.  Connect a serial crossover cable to your PC's serial port and to
    the devices serial port.
3.  Start one of the following scripts in the folder "update_rescue" 
    depending on the COM port you are using.
    Either use one of the prepared batch files for serial ports COM1-COM4
    or use the serial.bat file directly with a serial port parameter

    serial port         Use 
    -----------         -----------
    COM 1               serial1.bat
    COM 2               serial2.bat
    COM 3               serial3.bat
    COM 4               serial4.bat
    COM n               serial COMn

4.  A message 'Waiting for the device' will be shown on the bottom of the
    screen.
5.  Plug in the power supply now.
6.  Wait until a message 'SUCCESSFUL' appears on the second line.
7.  Close the rescue program.
8.  Unplug the power supply.
9.  Plug in the power supply.
10. Your device is set to factory defaults and should work now.
    If it does not work, please contact info@barix.com.
11. Reconfigure the device as required for your use.


A3) How to rescue your device under Linux and other POSIX systems using a serial port
---------------------------------------------------------------------------------
1.  Unplug the power supply
2.  Connect a serial crossover cable to your PC's serial port and to
    the devices serial port.
3.  Change directory to update_rescue/linux_mac (cd update_rescue/linux_mac)
4.  Start the program according to README
5.  Plug in the power supply as requested by the program.
6.  Wait until the program finishes
7.  Your device is set to factory defaults and should work now.
    If it does not work, please contact info@barix.com.
8.  Reconfigure the device as required for your use.


A4) To rescue your device on a MAC
----------------------------------
Please refer to the instructions in update_rescue/linux_mac/MAC_README.



B) Gold Unit
------------------

The folder "gold_unit" contains the files for batch loading of devices in 
production.



C) Version history
------------------

The folder "versionhistory" contains a version history text file for each part
of the Update Kit.



D) WEB UI Development Kit (to customize UI appearance)
------------------------------------------------------

Download the WEB UI Development Kit Manual from www.barix.com, read it
carefully and follow the steps to customize the devices UI (User Interface).



E) BCL Development Kit
----------------------

Contains a demo application and compilation tools. To learn how to use the
BCL development kit refer to the Barionet50 Manual you can 
download from www.barix.com. A quick howto follows.

E1) Requirements
----------------

The BCL Development Kit is distributed with necessary tools and scripts for
compilation running on both Linux and Windows platforms.

However on Linux operating systems other external programs are required:
  - the DOS emulator "dosemu" (see http://www.dosemu.org/)
  - the Windows emulator "wine" (see http://www.wine.org/) 
  - the Advanced TFTP client "atftp" (see http://freshmeat.net/projects/atftp/) 

All the mentioned programs are expected to be in the system path. If they are
not, modify the scripts accordingly.

E2) How to compile the BCL application and load into your device
----------------------------------------------------------------

To "tokenize" the BCL source code, to COB all files and
to upload the complete BCL application do:

1.  Switch the device into the update mode over the WEB interface:
    - Open a web browser window
    - Type in the IP address of your device
    - Click on the "Configuration" button on the top of the page
    - Click on the "Update" button on the top of the page
    - Click the "Please click here to continue" link in the lower frame
    - Wait until the counter counts down and the Update page appears
2.  Enter the "bcldevkit" directory and continue with either 2a (Windows users)
    or 2b (Linux users):
2a. On Windows type:
                      bcl <IP address> 
    e.g.: bcl 192.168.0.6
2b. On Linux type:
                      ./bcl.sh <IP address> 
    e.g.: ./bcl.sh 192.168.0.6
3.  Reboot the device by power cycling or hit the "Reboot" button in the browser

For more information, please refer to the BCL Programmers Manual.


E3) BCL Application
-------------------
There is a menu button "APPLICATION SETUP" in the main menu. Here you can 
configure the default application "Digital I/O Tunnel":

This Application permits digital inputs from one Barionet to be tunnelled to
digital outputs of another Barionet and vice versa. Both Devices have to be
configured in order to do tunnelling correctly. One or both Barionets can be
extended by connecting the Barix R6 Relay Extension module to the RS-485 port.
This I/O Tunnel application supports both the Barionet 50 and the legacy Barionet
and is backwards compatible with version B1.10. This allows for mixing hardware
and software. The Barionet 50 however is supported in the I/O Tunnel version
B1.20 and later.

Remote IP Address :
Input the 4 values of the desired remote IP address.
To disable the tunnel enter 0.0.0.0.

Tunneling UDP Port :
UDP port number used for tunnel data communication. Use the same port on the
remote Barionet. To disable the tunnel enter 0.

Send Interval :
Input the time in seconds between two status messages. In case no inputs have
changed (changes are sent immediately) a status message is sent to permit the
other side to detect a communication loss. The same value should be set on the
remote Barionet. Recommended value: 2..65535. To disable Loss checking enter 0.

The comunication loss will be triggered 1 second after the double time of the
remote stations send interval to allow 1 lost UDP packet eg. when interval is
5 seconds the com. loss will be triggered 11 seconds after the last received 
I/O status.

Output Action :
Choose an output for each remote input and the communication loss.
Eight inputs are featured on a legacy Barionet, four on the Barionet 50 (input 5
to 8 are always inactive).
Choose Relay 1 or 2 on a legacy Barionet and Relay 1 to 4 on a Barionet 50, 
Output 1 to 4 (legacy Barionet only) or Extension Relay 1 to 6 (only if a single
Relay Extension module Barix R6 is attached to the RS-485 bus).


F) Tools
--------
The folder "tools" contains the tokenizer, web2cob and additional conversion
tools.



G) Copyright information
------------------------

G1) GPL-covered files
---------------------
The file update_rescue/cygwin1.dll is copyright 2000-2005 Red Hat, Inc.

GPL files are free software; you can redistribute them and/or modify them
under the terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option) any
later version. These files are distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
Public License for more details. You should have received a copy of the GNU
General Public License along with this program in update_rescue/GPL; if not,
write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
Boston, MA  02110-1301, USA.

G2) Remaining files
-------------------
The remaining files are copyright (C) 2006-2015, Barix AG. All rights reserved.

-------------------------------------------------------------------------------
This document is copyright (C) 2015, Barix AG. All rights reserved.

Barix AG assumes no responsibility for errors or omissions in this document.
Nor does Barix make any commitment to update the information contained herein.

Other product and corporate names may be trademarks of other companies and are
used only for explanation and to the owners' benefit, without intent to
infringe.


