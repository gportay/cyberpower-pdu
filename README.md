# cyberpower-pdu(1)

## NAME

**cyberpower-pdu** - manages remote outlets

## SYNOPSIS

**cyberpower-pdu** [AGENT]

**cyberpower-pdu** [AGENT] [OUTLET_NUM|OUTLET_NAME]

**cyberpower-pdu** [AGENT] [OUTLET_NUM|OUTLET_NAME] [ACTION]

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

## Examples

Lists all outlets:

	$ cyberpower-pdu 127.0.0.1
	my_first_outlet
	your_second_outlet

Get status for the first outlet:

	$ cyberpower-pdu 127.0.0.1 my_first_outlet
	ON

Turn off the second outlet

	$ cyberpower-pdu 127.0.0.1 your_second_outlet off
	OFF

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
