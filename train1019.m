 net =AlexNet;

 opts = trainingOptions('sgdm',...
         'MiniBatchSize',32,...
         'MaxEpochs',20, ...
         'Shuffle','every-epoch', ...
         'InitialLearnRate',0.001,...
         'ValidationData',valDS,...
         "Plots",'training-progress',...
         'ValidationPatience', 3, 'ExecutionEnvironment','gpu');


         modified_net_10mins = trainNetwork(trainDS, net, opts);
