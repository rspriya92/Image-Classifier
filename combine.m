function value=combine(H,S,V)
value=ones(1,27);
data=ones(3,9);
data(:,1:3)=H(1:3,1:3);
data(:,4:6)=S(1:3,1:3);
data(:,7:9)=V(1:3,1:3);
value=data(:)';

end
