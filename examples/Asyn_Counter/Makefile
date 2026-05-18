SIM_DIR := sim
SRC_DIR := src

SIMS := testfixture.v
SRCS := RippleCounter.v dff_wrapper.v

all: ${SIM_DIR}/testfixture.v ${SRC_DIR}/RippleCounter.v ${SRC_DIR}/dff_wrapper.v
	verilator -Wall --binary --trace ${addprefix ${SIM_DIR}/,${SIMS}} ${addprefix ${SRC_DIR}/,${SRCS}}
	./obj_dir/Vtestfixture
	
clean:
	rm -rf obj_dir
	rm waveform.vcd
