import math
import string
f = open("sinerom.mem","w")
for i in range(256):
    v = int(math.cos(2*3.1416*i/256)*127+127)   #cos(2pi*i/256)*127+127
                                                #creates a cos wave centred around 127 and min max of 0-256 respectively 
    if (i+1)%16 == 0:       #if i+1 is divisible by 16
        s = "{hex:2X}\n"    
    else:
        s = "{hex:2X} "
    f.write(s.format(hex=v))

f.close()