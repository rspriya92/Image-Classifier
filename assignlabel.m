function label=assignlabel(QH_param,QS_param,QV_param,train_h,train_s,train_v,kvalue,test_size,target)
train_size=size(train_h,3);
dist=ones(1,train_size);
        tr_h=ones(3,3);
        tr_s=ones(3,3);
        tr_v=ones(3,3);
for j=1:train_size
    
        tr_h=train_h(:,:,j);
        tr_s=train_s(:,:,j);
        tr_v=train_v(:,:,j);
    dist(1,j)=calc_distance(QH_param,QS_param,QV_param,tr_h,tr_s,tr_v);
    dist(1,j)=abs(dist(1,j));
end
[sorted_distance,idx]=sort(dist,2);
idx=idx+test_size;
zero_count=0;
one_count=0;
for i=1:kvalue
    classlabel=target(idx(1,i));
    if(classlabel==0)
        zero_count=zero_count+1;
    else
        one_count=one_count+1;
    end
end
    if(zero_count>one_count)
        label=0;
    else
        label=1;
    end

end
