# Set prompt
ORIG_PS1="$PS1"
litex_prompt() {
	P="(LX P=$PLATFORM"

	if [ ! -z "$TARGET" ]; then
		P="$P T=$TARGET"
	fi
	if [ ! -z "$PROG" ]; then
		P="$P P=$PROG"
	fi

	BRANCH="$(git symbolic-ref --short HEAD 2> /dev/null)"
	if [ "$BRANCH" != "master" ]; then
		if [ x"$BRANCH" = x ]; then
			BRANCH="???"
		fi
		P="$P R=$BRANCH"
	fi

	PS1="$P) $ORIG_PS1"
}
PROMPT_COMMAND=litex_prompt
