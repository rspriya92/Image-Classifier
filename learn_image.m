function [weights,ct]=learn_image(data,n,target)
weights=ones(27,1);
pred=data*weights;
pred=heaviside(pred);
 ac=0.0;
 lr=0.5;
ct=1;
for i=1:n
    if(target(i)==pred(i))
        ac=ac+1.0;
    end
end
ac=ac/n;
while(ac<1)
    for i=1:27
        for j=1:n
         weights(i,1)=weights(i,1)+((target(j)-pred(j))*lr*data(j,i));
        end
    end
    pred=data*weights;
    pred=heaviside(pred);
    ac=0.0;
    
for i=1:n
    if(target(i)==pred(i))
        ac=ac+1.0;
    end
end
ac=ac/n;
ct=ct+1;
end
end