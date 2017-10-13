set xlabel 'Day in #year#'
set xrange [0:366]
set xtics out nomirror
set xtics 0,7,366 format ""
set mxtics 7
set xtics add ("Jan" 1, "Feb" 32, "Mar" 60, "Apr" 91, "May" 121, "Jun" 152, "Jul" 182, "Aug" 213, "Sep" 244, "Oct" 274, "Nov" 305, "Dec" 335)
show xtics

set ylabel 'total_size, MiB'
set yrange [0:]

set key top left
set key invert        # For stacked histogram
set key maxrows 5
set nogrid

set style data histograms
set style histogram rowstacked
set boxwidth 0.9 relative
set style fill solid 1.0 noborder

set terminal svg font "arial,14" size 960,480 dynamic
set output 'out.svg'

# Default for ls 6 is dark blue, but that is too close to pure blue for GFZ:
set style line 3 linecolor rgb "#00589C"
set style line 5 linecolor rgb "skyblue"
set style line 6 linecolor rgb "violet"
set style line 10 linecolor rgb "magenta"

plot '<cut -c9- days3.dat' using 3 title 'BGR' ls 2, \
     '' using  4 title 'ETHZ' ls 1, \
     '' using  5 title 'GFZ' ls 3, \
     '' using  6 title 'INGV' ls 4, \
     '' using  7 title 'IPGP' ls 6, \
     '' using  8 title 'KOERI' ls 1, \
     '' using  9 title 'LMU' ls 7, \
     '' using 10 title 'NIEP' ls 10, \
     '' using 11 title 'NOA' ls 5, \
     '' using 12 title 'ODC' ls 9, \
     '' using 13 title 'RESIF' ls 8

#set terminal dumb
#set output
#replot
