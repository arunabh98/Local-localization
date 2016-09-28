for q = 15
c = 13;
for i = 1:24
    video = strcat(int2str(q), '/', int2str(c), '.mp4');
    %video = 'test.mp4';
    vidObj = VideoReader(video);
    counter = 0;
    countersum = 0;
    numFrames = vidObj.NumberOfFrames;
    for k=1:numFrames 
        X = [];
        if counter == 0
            prev_frame = read(vidObj, k);
            prev_frame = rgb2gray(prev_frame);
            points_prev = detectHarrisFeatures(prev_frame);
            counter = counter + 1;
        else
            curr_frame = read(vidObj, k);
            curr_frame = rgb2gray(curr_frame);
            points_curr = detectHarrisFeatures(curr_frame);
            [features_curr,valid_points_curr] = extractFeatures(curr_frame,points_curr);
            [features_prev,valid_points_prev] = extractFeatures(prev_frame,points_prev);
            indexPairs = matchFeatures(features_curr,features_prev);
            matchedPoints1 = valid_points_curr(indexPairs(:,1),:);
            matchedPoints2 = valid_points_prev(indexPairs(:,2),:);
            for z = 1:matchedPoints1.Count
                A = matchedPoints1.Location(z,:);
                B = matchedPoints2.Location(z,:);
                distance = sqrt((A(1) - B(1))^2  + (A(2) - B(2))^2);
                X = [X distance];
            end
            prev_frame = curr_frame;
            points_prev = points_curr;
        end
        if ~isempty(X)
            [Y, IDX, OUTLIERS] = deleteoutliers(X, 50);
            countersum = countersum + mean(Y);
        end
    end
    c = c + 1;
    disp(countersum);
end
end