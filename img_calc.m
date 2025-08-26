function [H_param,S_param,V_param] = img_calc(query_image) 


hsv_queryimage = rgb2hsv(query_image);

size_hsv_image = size(hsv_queryimage);

row = size_hsv_image(1);
column = size_hsv_image(2);

offset = floor(row/3);

partition1 = hsv_queryimage(1:offset,:,:);

partition2 = hsv_queryimage(offset + 1 : 2 * offset,:,:);

partition3 = hsv_queryimage(2 * offset +1:row,:,:);

partition1_h  = partition1(:,:,1);
partition1_s  = partition1(:,:,2);
partition1_v  = partition1(:,:,3);

partition2_h  = partition2(:,:,1);
partition2_s  = partition2(:,:,2);
partition2_v  = partition2(:,:,3);

partition3_h  = partition3(:,:,1);
partition3_s  = partition3(:,:,2);
partition3_v  = partition3(:,:,3);

H_param = [mean(mean(partition1_h)) mean(std(partition1_h)) skewness(skewness(partition1_h));
           mean(mean(partition2_h)) mean(std(partition2_h)) skewness(skewness(partition2_h));
           mean(mean(partition3_h)) mean(std(partition3_h)) skewness(skewness(partition3_h))];


S_param = [mean(mean(partition1_s)) mean(std(partition1_s)) skewness(skewness(partition1_s));
           mean(mean(partition2_s)) mean(std(partition2_s)) skewness(skewness(partition2_s));
           mean(mean(partition3_s)) mean(std(partition3_s)) skewness(skewness(partition3_s))];

V_param = [mean(mean(partition1_v)) mean(std(partition1_v)) skewness(skewness(partition1_v));
           mean(mean(partition2_v)) mean(std(partition2_v)) skewness(skewness(partition2_v));
           mean(mean(partition3_v)) mean(std(partition3_v)) skewness(skewness(partition3_v))];
       
end


