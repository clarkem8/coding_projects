/- Script for starting a q process

d:.Q.opt .z.x;
path:first[system"pwd"],"/";

loadScripts:{
	loadDir[hsym `$path,"common"];
	dir:path,d[`proc]0;
	loadDir[hsym `$dir];
    loadFile[dir,".q"];
 };

loadDir:{
    loadFile each 1_/:string (),.Q.dd[x;key x];
 };

loadFile:{
    -1 "Loading ",x;
	system"l ",x
 };

loadScripts[];
