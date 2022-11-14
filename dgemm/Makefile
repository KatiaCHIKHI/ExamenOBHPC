CFLAGS=-g -Wall

OFLAGS=-O3
OFLAG0=-O0
OFLAG1=-O1
OFLAG2=-O2

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

opt: 
	gcc $(CFLAGS) $(OFLAG0) $(FILES) -o dgemm $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "resultats/gcc/dgemmO0.dat"
	$(MAKE) clean
	gcc $(CFLAGS) $(OFLAG1) $(FILES) -o dgemm $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "resultats/gcc/dgemmO1.dat"
	$(MAKE) clean
	gcc $(CFLAGS) $(OFLAG2) $(FILES) -o dgemm $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "resultats/gcc/dgemmO2.dat"
	$(MAKE) clean
	gcc $(CFLAGS) $(OFLAGS) $(FILES) -o dgemm $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "resultats/gcc/dgemmO3.dat"
	$(MAKE) clean


	clang $(CFLAGS) $(OFLAG0) $(FILES) -o dgemm $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "resultats/clang/dgemmO0.dat"
	$(MAKE) clean
	clang $(CFLAGS) $(OFLAG1) $(FILES) -o dgemm $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "resultats/clang/dgemmO1.dat"
	$(MAKE) clean
	clang $(CFLAGS) $(OFLAG2) $(FILES) -o dgemm $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "resultats/clang/dgemmO2.dat"
	$(MAKE) clean
	clang $(CFLAGS) $(OFLAGS) $(FILES) -o dgemm $(GNU_LFLAGS)
	taskset 0x1 ./dgemm 100 100 > "resultats/clang/dgemmO3.dat"
	$(MAKE) clean

plot:
	gnuplot -e "compiler = 'gcc'" plot.plt 
	gnuplot -e "compiler = 'clang'" plot.plt
	gnuplot "ccplot.plt"
	gnuplot -e "compiler = 'gcc'" "optplot.plt"
	gnuplot -e "compiler = 'clang'" "optplot.plt"

clean:
	@rm -Rf dgemm
