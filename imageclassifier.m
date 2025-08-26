function [classlabel,ind,it]=imageclassifier(loc,target,class)
ind=0;

disp('READING QUERY IMAGE')
query_image = imread(loc);
[QH_param,QS_param,QV_param] = img_calc(query_image);

folder = 'database';
imagelist = dir('database\*.jpg');
n = length(imagelist);
    v=ones(n+1,27);
    q=ones(1,27);
for i = 1 : n
    im=sprintf('%s/%s',folder,imagelist(i).name);
    dataimage = imread(im);
    [DH_param,DS_param,DV_param] = img_calc(dataimage);
    v(i,:)=combine(DH_param,DS_param,DV_param);
    
end
[wm,it]=learn_image(v,n,target);
q(1,:)=combine(QH_param,QS_param,QV_param);
classindex=classify(wm,q);
classindex=classindex+1;
classlabel=class{classindex};
end
