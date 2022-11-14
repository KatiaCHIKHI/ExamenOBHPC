CFLAGS=-g -Wall

OFLAGS=-O3

INTEL_LFLAGS=-qmkl
GNU_LFLAGS=-lm -lcblas

FILES=main.c tools.c kernels.c

all: dgemm

dgemm:
ifeq ($(CC),icc)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
else
ifeq ($(CC),icx)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(INTEL_LFLAGS)
else
ifeq ($(CC),gcc)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "gcc/dgemm.dat"
else
ifeq ($(CC),clang)
	$(CC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "clang/dgemm.dat"
else
	@echo "ERROR: no compiler specified using CC. Possible values for CC: gcc, icc, icx, clang"
endif
endif
endif
endif

clean:
	@rm -Rf dgemm
