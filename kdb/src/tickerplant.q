/- tick.q script taken from 
/- https://github.com/KxSystems/kdb-tick/blob/master/tick.q 

Test:([]time:();sym:();price:());

.tp.initGlobals:{
	.tp.tplogDir:`:/home/clarkem8/data/tplog;
	.u.L:.u.l:()!();
 };

.u.ld:{[tab]
    tplog:.u.L[tab]:` sv(.tp.tplogDir;`$string .u.d;tab);
	if[not type key tplog;
		.[tplog;();:;()]];
	.u.i:.u.j:-11!(-2;tplog);
	if[0<=type .u.i;
		-2 (string .u.L)," is a corrupt log. Truncate to length ",(string last i)," and restart";
		exit 1];
	.u.l[tab]:hopen tplog
 };

.u.tick:{
    .u.d:.z.d;
	.u.init[];
	if[not min(`time`sym~2#key flip value@)each .u.t;'`timesym];
	@[;`sym;`g#]each .u.t;
    .u.ld each .u.t;
 };

.u.endofday:{
	.u.end .u.d;
	.u.d+:1;
	if[.u.l;hclose l;.u.l:0(`.u.ld;.u.d)]
 };

.u.ts:{
	if[.u.d<x;
		if[.u.d<x-1;system"t 0";'"more than one day?"];
		.u.endofday[]]
 };

if[system"t";
	.z.ts:{
		.u.pub'[.u.t;value each .u.t];
		@[`.;.u.t;@[;`sym;`g#]0#];
		.u.i:.u.j;
		.u.ts .z.D
	};
	.u.upd:{[t;x]
		if[not -16=type first first x;
			if[d<"d"$a:.z.P;.z.ts[]];
			a:"n"$a;
			x:$[0>type first x;a,x;(enlist(count first x)#a),x]
		];
 		t insert x;
		if[.u.l;.u.l enlist (`upd;t;x);.u.j+:1];
	}
 ];

if[not system"t";
	system"t 1000";
 	//.z.ts:{.u.ts .z.D};
 	.u.upd:{[t;x] .u.ts"d"$a:.z.P;
 		if[not -16=type first first x;
			a:"n"$a;
			x:$[0>type first x;a,x;(enlist(count first x)#a),x]
		];
 		f:key flip value t;
		.u.pub[t;$[0>type first x;enlist f!x;flip f!x]];
		if[.u.l;.u.l enlist (`upd;t;x);.u.i+:1];
	}
 ];

.tp.initGlobals[]
.u.tick[];
