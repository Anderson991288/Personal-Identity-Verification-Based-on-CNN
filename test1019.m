%測試訓練結果
testimagepath = fullfile('data test900');
imdsTest = imageDatastore(testimagepath, 'IncludeSubfolders',true, 'LabelSource','folderNames');
imdsTest.ReadFcn = @(loc)imresize(imread(loc),inputSize(1:2));
[Name,probs] = classify(modified_net_10mins,imdsTest);
accuracy = sum(Name == imdsTest.Labels)/numel(imdsTest.Labels);


