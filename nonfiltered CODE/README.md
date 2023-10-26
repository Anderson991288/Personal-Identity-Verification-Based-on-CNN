## 盲切割

### 1.直接讀取.mat file，一樣方法轉灰階圖

```
img_size = 30;  % Change "size" to "img_size"
L = img_size * img_size;


for i = 1:13
    % Load the .mat file
    
    load(['D:\111專題\gray scale\112-1\nonfiltered\1_II\',num2str(i),'.mat']);

    % Ensure it's row vector for consistency
    if size(val, 1) > size(val, 2)
        val = val';
    end

    % Number of images that can be produced from the data
    num_images = size(val, 2) / L;

    for img_num = 1:num_images 
        % Extract the data for the current image
        start_idx = (img_num-1) * L + 1;
        end_idx = start_idx + L - 1;
        image_data = val(1, start_idx:end_idx);

        % Normalize the data to [0, 255]
        normalized_data = 255 * (image_data - min(image_data)) / (max(image_data) - min(image_data));
        % Reshape to 20x20
        image = reshape(normalized_data, [img_size, img_size]);
        imagesc(image);
        colormap(gray);
        
        set(gca,'xtick',[],'xticklabel',[]);
        set(gca,'ytick',[],'yticklabel',[]);

        saveas(gcf, ['D:\111專題\gray scale\112-1\nonfiltered CODE\data train nonfiltered900','\',num2str(i),'\',num2str(img_num),'.jpg']);
   
    end
end

for i = 1:13
    % Load the .mat file
    
    load(['D:\111專題\gray scale\112-1\nonfiltered\2_II\',num2str(i),'.mat']);

    % Ensure it's row vector for consistency
    if size(val, 1) > size(val, 2)
        val = val';
    end

    % Number of images that can be produced from the data
    num_images = size(val, 2) / L;

    for img_num = 1:num_images 
        % Extract the data for the current image
        start_idx = (img_num-1) * L + 1;
        end_idx = start_idx + L - 1;
        image_data = val(1, start_idx:end_idx);

        % Normalize the data to [0, 255]
        normalized_data = 255 * (image_data - min(image_data)) / (max(image_data) - min(image_data));
        % Reshape to 20x20
        image = reshape(normalized_data, [img_size, img_size]);
        imagesc(image);
        colormap(gray);
        
        set(gca,'xtick',[],'xticklabel',[]);
        set(gca,'ytick',[],'yticklabel',[]);

        saveas(gcf, ['D:\111專題\gray scale\112-1\nonfiltered CODE\data test nonfiltered900','\',num2str(i),'\',num2str(img_num),'.jpg']);
   
    end
end
```

### 2.後面步驟相同!
