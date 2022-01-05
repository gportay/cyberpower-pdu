# cyberpower-pdu(1)

## NAME

**cyberpower-pdu** - manages remote outlets

## SYNOPSIS

**cyberpower-pdu** [IP|HOSTNAME]

**cyberpower-pdu** [IP|HOSTNAME] [OUTLET_NUM|OUTLET_NAME]

**cyberpower-pdu** [IP|HOSTNAME] [OUTLET_NUM|OUTLET_NAME] [ACTION|RENAME <STRING>]

## DESCRIPTION

**cyberpower-pdu(1)** runs on top of [snmpwalk(1)] and [snmpset(1)] to manage
outlets.

## ACTIONS

**1** or **on**
	Turn On.

**2** or **off**
	Turn Off.

**3** or **reboot**
	Reboot.

**4** or **cancel**
	Cancel pending command.

## EXAMPLES 

Lists all outlets:

	$ cyberpower-pdu 127.0.0.1
	my_first_outlet		OFF
	your_second_outlet	ON

Get status for the first outlet:

	$ cyberpower-pdu localhost my_first_outlet
	ON

Turn off the second outlet

	$ cyberpower-pdu localhost 2 off
	OFF

Rename an outlet

	$ cyberpower-pdu 127.0.0.1 your_second_outlet rename new_name
	Renamed outlet 2 from your_second_outlet to new_name

## INSTALLATION

	$ sudo apt-add-repository multiverse && sudo apt-get update
	$ sudo apt install snmp snmp-mibs-downloader

## AUTHOR

Written by Gaël PORTAY *gael.portay@gmail.com*

## COPYRIGHT

Copyright (C) 2019 Gaël PORTAY

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

## SEE ALSO

[snmpwalk(1)], [snmpset(1)]

[snmpwalk(1)]: https://linux.die.net/man/1/snmpwalk
[snmpset(1)]: https://linux.die.net/man/1/snmpset
