
#for LT3022 voltage regulator, R1 is 200 ohm, R2 is variable resistor
# desired voltage output is :
#0.2-2V
#2-5V
#1-3V
#0.5-2V
#0.2-3.3V
#12-5V

#VOUT: 200mV • (1 + R2/R1) – (IADJ • R2)
#VADJ: 200mV
#IADJ: 30nA AT 25°C

def var_resistor(voutmin, voutmax):
    I_adj = 0.00000008
    
    R1 = 200.00000000
    R2_min = (voutmin - 0.20000000) / (0.20000000/R1 - I_adj)
    R2_max = (voutmax - 0.20000000) / (0.20000000/R1 - I_adj)

    print("The range of var-resistor for ", voutmin, "-", voutmax, " is ", R2_min, " to ", R2_max, "ohm.")

    return

if __name__ == "__main__":
    #input the voltage in V
    var_resistor(0.2,2)
    var_resistor(2,5)
    var_resistor(1,3)
    var_resistor(0.5,2)
    var_resistor(0.2,3.3)
    var_resistor(12,5)





