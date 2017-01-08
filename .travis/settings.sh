if [ -z "$TOP_DIR" ]; then
	echo "Including script must set TOP_DIR=value"
	return 1
fi

BUILD_DIR=$TOP_DIR/build
if [ ! -d $BUILD_DIR ]; then
	mkdir -p $BUILD_DIR
fi

# Conda package versions
BINUTILS_VERSION=2.26
GCC_VERSION=4.9.3

# CPU architectures which support is needed.
ARCHS="
	lm32
	or1k
	"
#	riscv

# FPGA toolchains which need installing.
FPGA_TOOLCHAINS="
	yosys
	xilinx-ise
	xilinx-vivado
	altera-quartus
	lattice-diamond
	sim
	"

# lite modules which are needed
LITE_REPOS="
	litex
	litedram
	liteeth
	litejpeg
	litepcie
	litesata
	litescope
	liteusb
	litevideo
	"
