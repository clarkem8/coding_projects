/- .u.q script taken from 
/- https://github.com/KxSystems/kdb-tick/blob/master/tick/u.q

.u.init:{.u.w:t!(count .u.t:tables`.)#()};
.u.del:{.u.w[x]_:.u.w[x;;0]?y};
.u.sel:{$[`~y;x;select from x where sym in y]};

.u.pub:{[t;x]
	{[t;x;w]
		if[count x:.u.sel[x] w 1;
			(neg first w)(`upd;t;x)]
	}[t;x]each w t
 };

.u.add:{
	$[(count .u.w x)>i:.u.w[x;;0]?.z.w;
		.[`.u.w;(x;i;1);union;y];
		.u.w[x],:enlist(.z.w;y)];
	(x;$[99=type v:value x;.u.sel[v]y;@[0#v;`sym;`g#]])
 };

.u.sub:{
    if[x~`;:sub[;y]each t];
    if[not x in t;'x];
    .u.del[x].z.w;
	.u.add[x;y]
 };

.u.end:{(neg union/[.u.w[;;0]])@\:(`.u.end;x)};
.z.pc:{.u.del[;x]each .u.t};
