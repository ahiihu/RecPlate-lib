function [train , test] = cdata(  labels, images)
% 生成训练测试数据集
% --------------------------------------------------
% 参数：[train , test] = cdata( images, labels )
% @输入 images    输入图像
%       labels    输入的图像标签
% @输出 train     输出的训练图像和标签
%       test      输出的测试图像和标签
% ---------------------------------------------------
%                               作者 ：李波 @2017
image_num=size(images, 3);
train_num= round(image_num*0.85);
test_num= image_num-train_num;

%% 置乱数据
randIdx=randperm(size(images,3));
for i=1:size(images,3)
    newimages(:,:,i)=images(:,:,randIdx(i));
    newlabels(i)=labels(randIdx(i));
end;

%% 分拣数据 
% 分拣训练数据
train_images=newimages(:,:,1:train_num);
train_labels=newlabels(1:train_num);
train={train_images train_labels};

% 分拣测试数据
test_images=newimages(:,:,train_num+1:image_num);
test_labels=newlabels(train_num+1:image_num);
test={test_images test_labels};

end

