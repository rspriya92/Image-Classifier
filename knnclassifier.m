function accuracy=knnclassifier(test_h,test_s,test_v,train_h,train_s,train_v,k,target)
accuracy=0.0;
test_size=size(test_h,3);
train_size=size(train_h,3);
        t_h=ones(3,3);
        t_s=ones(3,3);
        t_v=ones(3,3);
        tr_h=ones(3,3);
        tr_s=ones(3,3);
        tr_v=ones(3,3);
for i=1:test_size
    for j=1:train_size
        t_h=test_h(:,:,i);
        t_s=test_s(:,:,i);
        t_v=test_v(:,:,i);
        tr_h=train_h(:,:,j);
        tr_s=train_s(:,:,j);
        tr_v=train_v(:,:,j);
        dist(i,j)=calc_distance(t_h,t_s,t_v,tr_h,tr_s,tr_v);
        dist(i,j)=abs(dist(i,j));
    end
end
[sorted_distance,idx]=sort(dist,2);
idx=idx+test_size;
zero_count=0;
one_count=0;
for j=1:test_size
zero_count=0;
one_count=0;
   for i=1:k
    classlabel=target(idx(j,i));
    if(classlabel==0)
        zero_count=zero_count+1;
    else
        one_count=one_count+1;
    end
   end
    if(zero_count>one_count)
        label(j)=0;
    else
        label(j)=1;
    end

end
tp=0;
tn=0;
fp=0;
fn=0;
%red=positive  lilly=negative
for i=1:test_size
    if(label(i)==target(i))
        if(label(i)==0)
            tp=tp+1;
        else
            tn=tn+1;
        end
    else
        if(label(i)==1)
            fn=fn+1;
        else
            fp=fp+1;
        end
    end
end
accuracy=(tp+tn)/test_size;