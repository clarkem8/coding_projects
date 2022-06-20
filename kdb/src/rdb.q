/- Code for RDB process
/- Code code taken from code.kx r.q script 

upd:{[t;x]
    t insert x;
    .lg.info[`rdb;"Count of ",string[t]," is now ",string count value t];
 };

.u.rep:{(.[;();:;].)each x};
.u.rep (hopen `::5000)(`.u.sub;`;`);

/

/- end of day: save, clear, hdb reload
.u.end:{t:tables`.;
    t@:where `g=attr each t@\:`sym;
    .Q.hdpf[`$":",.u.x 1;`:.;x;`sym];@[;`sym;`g#] each t;
 };

/- init schema and sync up from log file;cd to hdb(so client save can run)
.u.rep:{
    (.[;();:;].)each x;
    if[null first y;:()];
    -11!y;
    system "cd ",1_-10_string first reverse y
 };

/- connect to ticker plant for (schema;(logcount;log))
.u.rep .(hopen `$":",.u.x 0)"(.u.sub[`;`];`.u `i`L)";
