onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib mult_18x18_opt

do {wave.do}

view wave
view structure
view signals

do {mult_18x18.udo}

run -all

quit -force
