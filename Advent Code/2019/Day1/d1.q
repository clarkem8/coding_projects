/- Day 1

l:first (enlist "J";csv)0:`:data.csv;

/- Problem 1
show sum(floor l%3)-2;

/- Problem 2
show sum{(sum 1_{$[0<n:(floor x%3)-2;n;0]}\)x}each l;
