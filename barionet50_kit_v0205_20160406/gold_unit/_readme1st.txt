Gold Unit Update Procedure
--------------------------

This folder contains all necessary files for updating the firmware via Gold
Unit. The Gold Unit update procedure is useful in case of large batch updates,
e.g. for OEMs and/or distributors.

Barix Gold Unit is a standard Exstreamer 100 device loaded with a special SW.
The Gold Unit has a USB memory stick attached which contains the binary files
to be loaded to the other devices.

The update operation is done via an Ethernet cross cable or an isolated switch
and optionally requires a serial Terminal running on a local PC for
monitoring.


How to update the firmware
--------------------------

1. Take a USB stick and format it with FAT16 (must be the first partition)

2. Copy all files from this directory (gold_unit/ in the rescue kit) to the
root directory of the USB stick

3. Plug in the USB stick to the Gold Unit

4. Apply power to the Gold Unit

5. Attach the unit to be updated to the Gold Unit via Ethernet connection
(direct cross cable or isolated switch) with DHCP enabled (no fixed IP
allowed).

6. Start the unit to be updated in the boot-loader mode (by keeping the reset
button pressed during start-up).

7. After a short delay (1-2seconds) the boot-loader comes up and the file
transfer will start automatically. The update operation will be completed in
few seconds.

Repeat steps 5 to 7 to update more devices.


Optionally use a serial Terminal on the unit to be updated to verify that the
download has started and finished properly.

