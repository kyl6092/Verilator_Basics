SIM_DIR := sim
SRC_DIR := src

SIMS := testfixture.v
SRCS := memory.v

TARGET_SRCS := ${addprefix ${SRC_DIR}/,${SRCS}}
TARGET_SIMS := ${addprefix ${SIM_DIR}/,${SIMS}}

all: ${SIM_DIR}/testfixture.v ${SRC_DIR}/memory.v
	verilator -Wall --binary --trace ${TARGET_SIMS} ${TARGET_SRCS}
	./obj_dir/Vtestfixture
	
clean:
	rm -rf obj_dir
	rm waveform.vcd