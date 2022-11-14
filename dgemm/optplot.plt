#!/usr/bin/gnuplot -persist
reset
# générer un histogramme avec GNUPlot comparant les optimisations par compilateur

filename = sprintf("resultats/%s/%sOPTflags.png",compiler,compiler)
datpath0 = sprintf("resultats/%s/dgemmO0.dat",compiler)
datpath1 = sprintf("resultats/%s/dgemmO1.dat",compiler)
datpath2 = sprintf("resultats/%s/dgemmO2.dat",compiler)
datpath3 = sprintf("resultats/%s/dgemmO3.dat",compiler)
cc_title = sprintf("dgemm performance for each optimisation flag of %s compiler ",compiler)

set boxwidth 1

set datafile separator "\t"

set style data histograms

set title cc_title 
set xlabel "Versions"
set ylabel "MiB/s"

set style fill solid

set terminal png size 1280,720

set output filename

plot datpath0 using 11:xticlabels(1) title "-O0" linecolor rgb "purple", \
     datpath1 using 11:xticlabels(1) title "-O1" linecolor rgb "pink", \
     datpath2 using 11:xticlabels(1) title "-O2" linecolor rgb "red", \
     datpath3 using 11:xticlabels(1) title "-O3" linecolor rgb "blue", \

