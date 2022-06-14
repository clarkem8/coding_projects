/- Script for starting a q process

d:.Q.opt .z.x;
path:first d`path;

/- This will be overwritten from common/log.q but using here
/- to log out script loading

.lg.o:{[tag;msg]
	-1 " : " sv(string[.z.p];"{INFO}";string[tag];msg);
 };

loadScripts:{
	loadDir[hsym `$path,"common"];
	dir:path,d[`proc]0;
	loadDir[hsym `$dir];
    loadFile[dir,".q"];
 };

loadDir:{
    loadFile each 1_/:string (),.Q.dd[x]each key x;
 };

loadFile:{
    .lg.o[`loadFile;"Loading ",x];
	system"l ",x;
 };

loadScripts[];
