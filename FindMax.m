function FindMax(shotn)

    maxInd = 42000;
    cnum = [8 17 31 41 50 61 70 84 94];

    for n=1:length(shotn)
        %for cnum=0:95
        for m=1:length(cnum)

            %Get data
            filename=strcat("PSsingle",int2str(shotn(1,n)),"-Ch",int2str(cnum(m)),".csv");
            file=csvread(filename);
            f=file(:,1);
            d=file(:,4);
            %f=f(1:maxInd);
            %d=d(1:maxInd);
            
            SeekMax(f,d,shotn(1,n),cnum(m));

        endfor

    endfor

endfunction
