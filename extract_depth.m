%% For 22600 training images
[imgs, deps]=textread('./utils/eigen_train_pairs.txt','%s%s');

%% For 697 testing images
%[imgs, deps]=textread('eigen_test_pairs.txt','%s%s');

for i=1:22600
	img = imread(imgs{i});
	dep = imread(deps{i});
	dep_after = fill_depth_colorization(double(img)/255.0,double(dep),1);
	dep_after = (dep_after - min(min(dep_after))) / (max(max(dep_after)) - min(min(dep_after)));
    imwrite(uint8(dep_after*255), sprintf('./dense_map/%05d.png',i));
    %imwrite(uint8(dep_after*255), sprintf('./test_depth/%03d.png',i));
end
