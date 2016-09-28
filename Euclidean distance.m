c = 1;
for i = 1:2
    video = strcat('12/', int2str(c), '.mp4');
    vidObj = VideoReader(video);
    counter = 0;
    countersum = 0;
    numFrames = vidObj.NumberOfFrames;
    for k=1:numFrames 
        if counter == 0
            prev_frame = read(vidObj, k);
            prev_frame = rgb2gray(prev_frame);
            hist_prev = imhist(prev_frame)./numel(prev_frame);
            counter = counter + 1;
        else
            curr_frame = read(vidObj, k);
            curr_frame = rgb2gray(curr_frame);
            hist_curr = imhist(curr_frame)./numel(curr_frame);
            sqrt_result = sqrt(hist_curr - hist_prev);
            square_result = sqrt_result.^2;
            f = abs(sum(square_result));
            countersum = countersum + f;
            prev_frame = curr_frame;
            hist_prev = hist_curr;
        end
    end
    c = c + 1;
    disp(countersum);
end



