#
# ATNF DAS (Data Aquisition System) control program gmake description file
#

# -----------------------------------------------------------------------------
# - Define macros
# ---------------
SHELL = /bin/csh

# library path must be in environment variable LD_LIBRARY_PATH or in ld.so.conf
# eg environment var -> setenv LD_LIBRARY_PATH /usr/local/LessTif/Motif2.0/lib

# note:
# XINCLUDEPATH and XLIBPATH are local to our site (ATNF Epping) login system.

# for LessTif version > 0.87.2
#XINCLUDEPATH= /usr/local/LessTif/Motif2.0/include -I/usr/X11/include -Iinclude
#XLIBPATH= /usr/local/LessTif/Motif2.0/lib -L/usr/X11/lib
XINCLUDEPATH=
XLIBPATH=

#  include debug_info
#LDFLAGS = -lXm -lXt -lX11 -lm
#OTHER_ARG = ${LDFLAGS}
LDFLAGS = 
OTHER_ARG = ${LDFLAGS}

LDFLAGS_afn =
OTHER_ARG_afn =

#CC = gcc
CC = g++

CFLAGS = -I$(XINCLUDEPATH) -O -Wall -ansi -pedantic -g
# -O0 disables optimisation, needed for debugging sometimes  (? not sure -
# this usually means other problems with gcc, as the -g option allows you to
# debug properly under optimised compilation)
# !debugging:
# CFLAGS = -I$(XINCLUDEPATH) -O -Wall -ansi -pedantic -c

CFLAGS_fn = -Iinclude -O -Wall -ansi -pedantic -g -c
# !debugging:
# CFLAGS_fn = -Iinclude -O -Wall -ansi -pedantic -c

#  include debug_macros

# -----------------------------------------------------------------------------
# - Targets, prerequisites and their build rules
# ----------------------------------------------
readSerialPort: readSerialPort.cpp
	${CC} ${CFLAGS} readSerialPort.cpp -o readSerialPort

#  include debug_targets

# -----------------------------------------------------------------------------
# - misc commands
# ---------------
clean:
	\rm readSerialPort
