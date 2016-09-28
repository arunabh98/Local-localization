c = 1;
for i = 1:2
    video = strcat('1/', int2str(c), '.mp4');
    vidObj = VideoReader(video);
    duration = vidObj.Duration;
    disp(duration)
    c = c + 1;
end


