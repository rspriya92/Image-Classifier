function c=classify(wt,input)
c=0;
pred=input*wt;
pred=heaviside(pred);
c=pred;
end