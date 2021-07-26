.PHONY: sim
sim: riscv_decoder.v
	verilator -cc $< -Wall -Wno-fatal -CFLAGS "-std=c++11 -Wall -DTOPLEVEL_NAME=soc_domain -g -O0"

riscv_decoder.v: riscv_decoder.sv
	sv2v $< > $@

# The SystemVerilog reference file compiles
.PHONY: reference
reference: riscv_decoder.sv
	verilator -cc $< -Wall -Wno-fatal -CFLAGS "-std=c++11 -Wall -DTOPLEVEL_NAME=soc_domain -g -O0"
