#!/usr/bin/gnuplot -persist
reset
# générer un histogramme avec GNUPlot comparant les différentes versions pour chaque compilateur
filename = sprintf("%s/%s.png",compiler,compiler)
datpath = sprintf("%s/dotprod.dat",compiler)
cc_title = sprintf("dotprod performance",compiler)

set boxwidth 1

set datafile separator "\t"

set style data histograms

set title cc_title
set xlabel "Versions"
set ylabel "MiB/s"

set style fill solid

set terminal png size 1280,720


set output filename

plot datpath using 12:xticlabels(1) title "MiB/s" linecolor rgb "blue"
