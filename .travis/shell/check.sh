function check_exists {
	TOOL=$1
	if which $TOOL 2>&1; then
		echo "$TOOL found at $(which $TOOL)"
		return 0
	else
		echo "$TOOL *NOT* found"
		return 1
	fi
}

function check_version {
	TOOL=$1
	VERSION=$2
	if $TOOL --version 2>&1 | grep -q $VERSION > /dev/null; then
		echo "$TOOL found at $VERSION"
		return 0
	else
		$TOOL --version
		echo "$TOOL (version $VERSION) *NOT* found"
		return 1
	fi
}

function check_import {
	MODULE=$1
	if python3 -c "import $MODULE"; then
		echo "$MODULE found"
		return 0
	else
		echo "$MODULE *NOT* found!"
		return 1
	fi
}

function check_import_version {
	MODULE=$1
	EXPECT_VERSION=$2
        ACTUAL_VERSION=$(python3 -c "import $MODULE; print($MODULE.__version__)")
	if echo "$ACTUAL_VERSION" | grep -q $EXPECT_VERSION > /dev/null; then
		echo "$MODULE found at $ACTUAL_VERSION"
		return 0
	else
		echo "$MODULE (version $EXPECT_VERSION) *NOT* found!"
		return 1
	fi
}
