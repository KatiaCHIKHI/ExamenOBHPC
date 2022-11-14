CFLAGS=-g -Wall

OFLAGS=-O3

INTEL_LFLAGS=-qmkl
GNU_LFLAGS=-lm -lblas

FILES=main.c tools.c kernels.c

all: reduc

reduc:
ifeq ($(CC),icc)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
else
ifeq ($(CC),icx)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
else
ifeq ($(CC),gcc)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
	taskset 0x1 ./reduc 100 100 >"gcc/reduc.dat"
	gnuplot -e "compiler = 'gcc'" plot.plt 
else
ifeq ($(CC),clang)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
	taskset 0x1 ./reduc 100 100 >"clang/reduc.dat"
	gnuplot -e "compiler = 'clang'" plot.plt 
else
	@echo "ERROR: no compiler specified using CC. Possible values for CC: gcc, icc, icx, clang"
endif
endif
endif
endif


plot:
	gnuplot "ccplot.plt"


clean:
	@rm -Rf reduc
