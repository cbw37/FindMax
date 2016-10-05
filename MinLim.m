function [min,idx] = MinLim(vecx,vecy,lim)
	
    xmin = lim(1);
    xmax = lim(2);

    vecx = vecx(xmin:xmax);
    vecy = vecy(xmin:xmax);

	  [min, idx] = min(vecy);
    idx = idx-1+xmin;


endfunction
