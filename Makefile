MAKEFLAGS += --no-builtin-rules --no-builtin-variables

.SUFFIXES :

.PHONY : all clean

all :
	agda Main.agda

bend :
	agda-compile Bend/bend.agda

clean :
	find . -name '*agdai' -delete
