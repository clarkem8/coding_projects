/- Data load
l:"I"$read0`:../data/d1.txt;

/- Part 1
show (*/)l raze where each 2020=l+/:l;

/- Part 2
show prd first m2 where 2020=sum each m2:l cross m1 where 2020>sum each m1:l cross l;
show prd first m2 where 2020=sum each m2:l cross raze l {x,/:m[x]}each til count m:where each 2020>l+/:l;
show prd first m2 where 2020=sum each m2:l cross distinct desc each raze l {x,/:m[x]}each til count m:where each (2020-min l)>l+/:l;
show prd raze n,m2 where 2020=m3+n:l first (where raze 2020=l+/:m3:sum each distinct desc each raze l {x,/:m[x]}each til count m:where each (2020-min l)>l+/:l)mod count l;
