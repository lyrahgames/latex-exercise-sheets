k = 2.
N = 1050.
t0 = 0
Z0 = N / 21

A = Z0 / (N - Z0)

print k
print N
print Z0
print t0
print A

Z(x) = N*(1 - (1/(1 + A*exp(k*(x-t0)))))
M(x) = N - Z(x)

set terminal epslatex size 12cm,7cm
set output "task-eine_zombieapokalypse-skizze.tex"
set object rectangle from graph 0,0 to graph 1,1 behind fillcolor rgb '#eeeeff' fillstyle solid noborder
set key center right box lw 2 opaque

set xl '$t$'
set xrange [0:5]
set yrange [0:1060]

plot Z(x) with lines lc rgb '#ff5500' lw 4 title "$Z(t)$",M(x) with lines title "$M(t)$" lc rgb '#0055ff' lw 4