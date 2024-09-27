MAKEFLAGS += --no-builtin-rules --no-builtin-variables

.SUFFIXES :

.PHONY : all clean

all :
	agda Main.agda

clean :
	find . -name '*agdai' -delete
