# 2v-5v
# input voltage is 5v
# VOUT: 200mV • (1 + R2/R1) – (IADJ • R2)
#VADJ: 200mV
#IADJ: 30nA AT 25°C
#OUTPUT RANGE: 0.2V TO 9.5V


def Voutput(Vout, R1):
    '''this function takes in the output voltage
    and returns the corresponding R'''
    '''in this case, assume R is 200 ohm'''
    #200mV • (1 + R2/R1) – (IADJ • R2)

    R1var = 0.2/R1

    R2 = (Vout - 0.2000000)/(0.0010000000 - 0.00000003)

    '''when R2 = 5ohm'''
    R2new = (Vout - 0.2000000)/(R1var - 0.00000003)

    print(R2new)

    return R2


if __name__ == "__main__":
    Voutput(0.5, 50000)
    Voutput(3, 50000)

    D:\Program-Files\AltiumProjects\Chip_testing_board_Arielle\LT3022Sch.py