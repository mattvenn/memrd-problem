# memrd example

I'm hoping someone can explain this behaviour to me. 
I have a number of [ADCs generated with a genvar loop](top.v).

If I use an array of regs to register the data, then the LEDS never show the
data. (line 13).

If I use an array of wires to connect the LEDS to the ADC values, the LEDs
work. (line 12).

yosys show (try `make show`) shows with the array of registers, memrd blocks are created. I don't know what these do...
