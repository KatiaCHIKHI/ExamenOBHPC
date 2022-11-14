#!/usr/bin/gnuplot -persist
reset
# générer un histogramme avec GNUPlot comparant les versions par compilateur


set boxwidth 1

set datafile separator "\t"

set style data histograms

set title "reduc performance"
set xlabel "Versions"
set ylabel "MiB/s"

set style fill solid

set terminal png size 1280,720

set output "reducPlot.png"

plot "gcc/reduc.dat" using 12:xticlabels(1) title "gcc" linecolor rgb "purple", \
     "clang/reduc.dat" using 12:xticlabels(1) title "clang" linecolor rgb "pink",
