if -z "$TOP_DIR"; then
	echo "Including script must set TOP_DIR=value"
fi

BUILD_DIR=$TOP_DIR/build
CONDA_DIR=$BUILD_DIR/conda

# Conda package versions
BINUTILS_VERSION=2.26
GCC_VERSION=4.9.3

# FPGA compiling toolchains
FPGA_TOOLCHAINS="
	yosys
	xilinx-ise
	xilinx-vivado
	altera-quartus
	lattice-diamond
	sim
	"

# lite modules
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
