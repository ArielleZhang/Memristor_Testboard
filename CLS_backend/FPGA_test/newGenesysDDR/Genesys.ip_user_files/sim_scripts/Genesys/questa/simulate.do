onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Genesys_opt

do {wave.do}

view wave
view structure
view signals

do {Genesys.udo}

run -all

quit -force
