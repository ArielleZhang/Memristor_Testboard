connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Genesys 2 200300AD1A5DB" && level==0} -index 0
fpga -file E:/newGenesysDDR/Vitis/1p0/pingpong_half/_ide/bitstream/Genesys_wrapper.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow E:/newGenesysDDR/Vitis/1p0/pingpong_half/Debug/pingpong_half.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
