function result = my_erode(im, se)

    %
    % This function returns erosion binary images with structure element.
    %
    % Author : Yoonjae, Cho
    % Email  : yoonjae.cho92@gmail.com
    % Github : https://github.com/yoon-jae
    %
    
    [h, w] = size(im);
    [sh, sw] = size(se);
    
    pad_h = floor(sh/2);
    pad_w = floor(sw/2);
    
    pad = zeros(h+pad_h*2, w+pad_w*2);
    result = pad;
    pad(1+pad_h:h+pad_h, 1+pad_w:w+pad_w) = im;
    
    for i = 1+pad_h : h+pad_h
        for j = 1+pad_w : w+pad_w
            window = result(i-pad_h:i+pad_h, j-pad_w:j+pad_w) & se;
            if sum(window(:)) == sum(se(:))
               result(i,j) = 1;
            end
        end
    end
    
    result = uint8(result(1+pad_h:h+pad_h, 1+pad_w:w+pad_w));
end
