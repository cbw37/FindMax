function SeekMax(f,d,shotn,channel)

    cutoff=10^5;
    gap=100;
    skip=200;

    %Start at max:
    writefilename = "FindMaxResults.csv";
    [max, midx] = max(d);
    fidx=f(midx);
    data=[shotn,channel,max,fidx];
    dataCheck=dlmread(writefilename);
    len = length(dataCheck(:,1));

    for i=1:len
        if(dataCheck(i,1)==shotn && dataCheck(i,2)==channel && dataCheck(i,4)!=fidx)
            write = true;
        elseif (dataCheck(i,1)==shotn && dataCheck(i,2)!=channel)
            write = true;
        elseif(dataCheck(i,1)!=shotn)
            write = true;
        else
            write = false;
        endif
    endfor

    if (write)
        dlmwrite(writefilename,data,"-append");
    endif

    lmc=0;
    lit=0;
    lcomp=0;
    lmin=max;

    while (lmin>cutoff)
        if(midx-gap-lit < 1)
            break
        endif

        [lmin,lmidx] = MinLim(f,d,[midx-gap-lit midx]);
        lval = (lmidx==midx-gap-lit);
        if(!lval)
            if (lmin==lcomp)
                lmc=lmc+1;
            else
                lcomp=lmin;
                lmc=1;
            endif
        endif
        if (!lval && lmc>=5)
            fl=f(1:lmidx);
            dl=d(1:lmidx);
            break;
        endif

        lit=lit+skip;
    endwhile

    rmc=0;
    rit=0;
    rcomp=0;
    rmin=max;

    while (rmin>cutoff)
        if(midx+gap+rit >length(f))
            break;
        endif

        [rmin,rmidx] = MinLim(f,d,[midx midx+gap+rit]);
        rval = (rmidx==midx+gap+rit);
        if(!rval)
            if (rmin==rcomp)
                rmc=rmc+1;
            else
                rcomp=rmin;
                rmc=1;
            endif
        endif
        if (!rval && rmc>=5)
            fr=f(rmidx:length(f));
            dr=d(rmidx:length(d));
            break;
        endif

        rit=rit+skip;
    endwhile

    if (exist("fl","var")>0 && exist("dl","var")>0)
        SeekMax(fl,dl,shotn,channel);
    endif
    if (exist("fr","var")>0 && exist("dr","var")>0)
        SeekMax(fr,dr,shotn,channel);
    endif

endfunction
