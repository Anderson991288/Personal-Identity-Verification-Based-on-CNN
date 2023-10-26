# Personal-Identity-Verification-Based-on-CNN
## 原始資料 : 
* 原始資料(對齊切割) : PTB_1_II.csv、PTB_2_II.csv

  
* 兩個Excel表 :  一個用來training，一個用來testing 
* Excel表中，有1000欄，取樣頻率為 1000Hz
* 最後一欄為我們要辨識的 Label，有1~13來代表不同人

## Code(簡化版Code，完整版在上方) : 

  
1. 先讀取Excel，做標準化與調整灰階圖大小，再轉灰階圖
```
filename = 'D:\111專題\gray scale\112-1\PTB_1_II.csv';
filename1 = 'D:\111專題\gray scale\112-1\PTB_2_II.csv';

aa = csvread(filename);
bb = csvread(filename1);

a=[125 108 105 143 126 127 106 106 114 144 144 95 132];
b=[0 125 233 338 481 607 734 840 946 1060 1204 1348 1443];

a1=[127 108 106 121 134 114 111 108 117 112 144 85 142];
b1=[0 127 235 341 462 596 710 821 929 1046 1158 1302 1387];

L = 400;
l  = sqrt(L);

for i = 1:13
    for j = 1:a(i)
        xx1(1:1000) =aa((b(i)+j), 1:1000);
            standard_x = 255*(xx1-min(xx1))/(max(xx1)-min(xx1));
            s_x1 = reshape(standard_x(1,1:L),l,l);
            imagesc(s_x1);
            colormap(gray);           
            set(gca,'xtick',[],'xticklabel',[]);
            set(gca,'ytick',[],'yticklabel',[]);
       saveas(gcf, ['D:\111專題\gray scale\112-1\CODE\data train','\',num2str(i),'\',num2str(j),'.jpg']);   
    end
end
```

2. 預處理:讀取專換好的灰階圖，把data分類training,val

```
% 抓data
imagepath = fullfile('data train');
imds = imageDatastore(imagepath, 'IncludeSubfolders',true, 'LabelSource','folderNames');

% 選擇網路
net = ResNet50;
% get InputSize
try
   inputSize = net(1).InputSize; 
catch
   inputSize = net.Layers(1).InputSize; 
end

% 調整影像大小
imds.ReadFcn = @(loc)imresize(imread(loc),inputSize(1:2)); 

% 把data分類training,val
[trainDS,valDS] = splitEachLabel(imds,0.8,0.2, 'randomized');
```

3.開始 training，調整參數以獲得最好的id辨識度

```
 net =ResNet50;

 opts = trainingOptions('sgdm',...
         'MiniBatchSize',128,...
         'MaxEpochs',20, ...
         'Shuffle','every-epoch', ...
         'InitialLearnRate',0.001,...
         'ValidationData',valDS,...
         "Plots",'training-progress',...
         'ValidationPatience', 3, 'ExecutionEnvironment','gpu');

         modified_net_10mins = trainNetwork(trainDS2, net, opts);
```

4.testing，測試此模型的好壞

```
testimagepath = fullfile('data test900');
imdsTest = imageDatastore(testimagepath, 'IncludeSubfolders',true, 'LabelSource','folderNames');
imdsTest.ReadFcn = @(loc)imresize(imread(loc),inputSize(1:2));
[Name,probs] = classify(modified_net_10mins,imdsTest);
accuracy = sum(Name == imdsTest.Labels)/numel(imdsTest.Labels);
```

## 結果 : 

![L900 Resnet50 B32 train](https://github.com/Anderson991288/Personal-Identity-Verification-Based-on-CNN/assets/68816726/2ba42603-ba6a-4ab3-813e-96934c8591d1)


![image](https://github.com/Anderson991288/Personal-Identity-Verification-Based-on-CNN/assets/68816726/fd3a03c8-dbf4-4ff4-9d40-06fe88becb1a)


## Reference Paper :

[1] Jia Wu, Chao Liu, Qiyu Long, Weiyan Hou, “Research on Personal Identity Verification Based on Convolutional Neural Network,” 2019 IEEE 2nd International Conference on Information and Computer Technologies.



