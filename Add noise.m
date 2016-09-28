c = 1;
for i = 1:12
    video = strcat('15/', int2str(c), '.mp4');
    vidObj = VideoReader(video);
    outputVideo = VideoWriter(strcat('15/', int2str(c + 24)));
    outputVideo.FrameRate = 2*vidObj.FrameRate;
    open(outputVideo)
    numFrames = vidObj.NumberOfFrames;
    for k=1:numFrames 
        curr_frame = read(vidObj, k);
        % curr_frame  = imnoise(curr_frame,'speckle');
        curr_frame = imresize(curr_frame, [vidObj.Height, vidObj.Width]);
        writeVideo(outputVideo, curr_frame);
        
    end
    close(outputVideo);
    c = c + 1;
end



