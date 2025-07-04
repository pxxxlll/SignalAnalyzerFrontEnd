onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib div0_opt

do {wave.do}

view wave
view structure
view signals

do {div0.udo}

run -all

quit -force
