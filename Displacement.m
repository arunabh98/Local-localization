I1 = rgb2gray(imread('1.jpg'));
I2 = rgb2gray(imread('1.jpg'));
points1 = detectHarrisFeatures(I1);
points2 = detectHarrisFeatures(I2);
[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
sum = 0;
X = [];
disp(matchedPoints1);
for c = 1:22
    A = matchedPoints1.Location(c,:);
    B = matchedPoints2.Location(c,:);
    distance = sqrt((A(1) - B(1))^2  + (A(2) - B(2))^2);
    X = [X distance];
    sum = sum + distance;
end
disp(sum/22);
[Y, IDX, OUTLIERS] = deleteoutliers(X);
figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);