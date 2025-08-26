clc
clear
folder = 'database';
class={'red rose','lilly flower'};
imagelist = dir('database\*.jpg');
n = length(imagelist);
for i=1:n
    if(i<9)
        target(i)=0;
    else
        target(i)=1;
    end
end
target(3)=1;
[filename1,pathname1,filterindex1]=uigetfile('*.jpg');%%Loading the file from the user interface
queryimage=[pathname1,filename1];
[classlabel,ind,iteration]=imageclassifier(queryimage,target,class);
fileID = fopen('C:\wamp\www\searchbyimage\result.txt','w');
fprintf(fileID,'%s',classlabel);
fclose(fileID);
fprintf('\n The result of query image given by SOM is %s with %d iterations of learning',classlabel,iteration)
%%%%%%%%%%%%%%%%%%%%%%%%%% knn classifier%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = length(imagelist);
    v=ones(n+1,27);
    q=ones(1,27);
    distance=ones(1,n);
    test_size=5;
    train_size=6;
    test_h=ones(3,3,test_size);
    test_s=ones(3,3,test_size);
    test_v=ones(3,3,test_size);
    train_h=ones(3,3,train_size);
    train_s=ones(3,3,train_size);
    train_v=ones(3,3,train_size);
    accuracy=ones(n);
    query_pixels=imread(queryimage);
[QH_param,QS_param,QV_param] = img_calc(query_pixels);  
for i = 1 : n
    im=sprintf('%s/%s',folder,imagelist(i).name);
    dataimage = imread(im);
    [DH_param,DS_param,DV_param] = img_calc(dataimage);
    if(i<=test_size)
        test_h(:,:,i)=DH_param;
        test_s(:,:,i)=DS_param;
        test_v(:,:,i)=DV_param;
    else
        train_h(:,:,i-test_size)=DH_param;
        train_s(:,:,i-test_size)=DS_param;
        train_v(:,:,i-test_size)=DV_param;
    end
end
test_size=size(test_h,3);
train_size=size(train_h,3);
accuracy=zeros(1,train_size);
max=0.0;
for i=1:train_size
    accuracy(1,i)=knnclassifier(test_h,test_s,test_v,train_h,train_s,train_v,i,target);
    if(accuracy(1,i)>max)
        kvalue=i;
        max=accuracy(1,i);
    end
    
        x(i)=i;
        y(i)=accuracy(1,i);
end
plot(x,y)
label=assignlabel(QH_param,QS_param,QV_param,train_h,train_s,train_v,kvalue,test_size,target);
classlabe=class{label+1};
fprintf('\n The result of query image given by KNN is %s with %d iterations of learning and with accuracy %f',classlabel,kvalue,max)