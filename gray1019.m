
clear;
clc;
close all;

filename = 'D:\111專題\gray scale\112-1\PTB_1_II.csv';
filename1 = 'D:\111專題\gray scale\112-1\PTB_2_II.csv';
%         xx2(1:1000) = seg_ptb2(i, j, 1:1000);
%         fs = 1000;
%         t = 0:1/fs:2-1/fs;
%         figure(2);
%         stft(xx1, fs, 'Window', kaiser(35, 20));
%         saveas(gcf, fullfile('test_prepre', string(i), string(j)), 'jpg');
aa = csvread(filename);
bb = csvread(filename1);

%%
a=[125 108 105 143 126 127 106 106 114 144 144 95 132];
b=[0 125 233 338 481 607 734 840 946 1060 1204 1348 1443];

a1=[127 108 106 121 134 114 111 108 117 112 144 85 142];
b1=[0 127 235 341 462 596 710 821 929 1046 1158 1302 1387];



L = 900;
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

       %saveas(gcf, fullfile('data train', string(i), string(j)),'.jpg');
  
       saveas(gcf, ['D:\111專題\gray scale\112-1\CODE\data train900','\',num2str(i),'\',num2str(j),'.jpg']);
     
   
    end
end



for i = 1:13
    for j = 1:a1(i)
      xx2(1:1000) = bb((b1(i)+j), 1:1000);

            standard_x = 255*(xx2-min(xx2))/(max(xx2)-min(xx2));
            s_x2 = reshape(standard_x(1,1:L),l,l);
            imagesc(s_x2);
            colormap(gray);
            
            set(gca,'xtick',[],'xticklabel',[]);
            set(gca,'ytick',[],'yticklabel',[]);

       saveas(gcf, ['D:\111專題\gray scale\112-1\CODE\data test900','\',num2str(i),'\',num2str(j),'.jpg']);
     
    end
end

