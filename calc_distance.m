function d=calc_distance(QH,QS,QV,DH,DS,DV)
   d=0;
   hval=0;
   sval=0;
   vval=0;
   for i=1:3
    dh=abs(QH(1,i)-DH(2,i));
    dh=dh/(QH(1,i)+DH(2,i));
    hval=hval+dh;
   end
   
   for i=1:3
    ds=abs(QS(1,i)-DS(2,i));
    ds=ds/(QS(1,i)+DS(2,i));
    sval=sval+ds;
   end
   
   for i=1:3
    dv=abs(QV(1,i)-DV(2,i));
    dv=dv/(QV(1,i)+DV(2,i));
    vval=vval+dv;
   end
    d=hval+sval+vval;
end