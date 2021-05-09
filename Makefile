blinky: blinky.nim nim.cfg
	nim c -d:danger --opt:size --os:standalone blinky

blinky.hex: blinky
	avr-objcopy -O ihex -R .eeprom blinky blinky.hex

size: blinky
	avr-size -C --mcu=atmega32u4 blinky

upload: blinky.hex
	teensy_loader_cli --mcu=atmega32u4 -v -w blinky.hex