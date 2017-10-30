#!/usr/bin/gnuplot
#
# Plotting a vector field for functions
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
# set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
#set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
#set output 'vector_fields2.png'

set output "task-orthogonaltrajektorien_und_richtungsfeld-skizze.tex"

set object rectangle from graph 0,0 to graph 1,1 behind fillcolor rgb '#eeeeff' fillstyle solid noborder

viewrad = 10

c = 2
a = 144
f(x) = sqrt((x**2-c**2)/2)

set table "tmp.txt"
set samples 200
plot [c:viewrad] f(x)
unset table

set table "tmp2.txt"
set samples 200
plot [-viewrad:-c] f(x)
unset table

set table "tmp3.txt"
set samples 200
plot [0.01:viewrad] a/(x**2)
unset table

set table "tmp4.txt"
set samples 200
plot [-viewrad:0.01] a/(x**2)
unset table

set terminal epslatex size 12cm,10cm

# unset key
# set key box opaque
set key outside tmargin
set border black

set size square

# unset tics
set xtics 0.5*viewrad
set ytics 0.5*viewrad

set format x '$%.2f$'
set format y '$%.2f$'

unset colorbox
set xrange [-viewrad:viewrad]
set yrange [-viewrad:viewrad]
# get an equal grid
# set size ratio -1
set samples 15    # x-axis
set isosamples 15 # y-axis
set palette defined ( \
    1 '#fffcf6', \
    2 '#fff7db', \
    3 '#fff4c2', \
    4 '#feecae', \
    5 '#f8ca8c', \
    6 '#f0a848', \
    7 '#c07860', \
    8 '#a86060', \
    9 '#784860', \
   10 '#604860')

# function for two sources with different charges
# r(x,y)     = sqrt(x*x+y*y)
# potentials
# v1(x,y)    = q1/(r(x-x01,y-y01))
# v2(x,y)    = q2/(r(x-x02,y-y02))
# v(x,y)     = v1(x,y)+v2(x,y)
# v(x,y)=ex(x,y)+ey(x,y)
v(x,y)=1
# sources
# e1x(x,y)   = q1*x/r(x,y)**3
# e1y(x,y)   = q1*y/r(x,y)**3
# e2x(x,y)   = q2*x/r(x,y)**3
# e2y(x,y)   = q2*y/r(x,y)**3
ex(x,y)    = 1
ey(x,y)    = -2*y/x
enorm(x,y) = sqrt(ex(x,y)**2 + ey(x,y)**2)
# vector functions
dx(x,y)    = scaling*ex(x,y)/enorm(x,y)
dy(x,y)    = scaling*ey(x,y)/enorm(x,y)

# source parameters
scaling = viewrad*0.11

plot '++' u ($1-dx($1,$2)/2.0):($2-dy($1,$2)/2.0):(dx($1,$2)):(dy($1,$2)):\
    (v($1,$2)) with vectors head size viewrad*0.05,20,30 filled lc 'black' lw 0.5 title 'Richtungsfeld',\
    "tmp.txt" u 1:2 with lines lc rgb '#ff5500' lw 4 title 'Hyperbel in $(x_0,y_0)$',\
    '' u 1:(-$2) with lines lc rgb '#ff5500' lw 4 title '',\
    "tmp2.txt" u 1:2 with lines lc rgb '#ff5500' lw 4 title '',\
    '' u 1:(-$2) w lines lc rgb '#ff5500' lw 4 title '',\
    "tmp3.txt" u 1:2 w lines lc rgb '#0055ff' lw 4 title 'Orthogonaltrajektorie in $(x_0,y_0)$',\
    "" u 1:(-$2) w lines lc rgb "#0099ff" lw 4 title 'Weitere Orthogonaltrajektorien',\
    "tmp4.txt" u 1:2 w lines lc rgb '#0099ff' lw 4 title '',\
    "" u 1:(-$2) w lines lc rgb "#0099ff" lw 4 title '',\
    "<echo '6 4'" with points pt 13 ps 2.5 lc rgb '#aa00cc' title 'Punkt $(x_0,y_0)$'