%% Initiaze webcam connection

cam = webcam(1)

%% Use circle hough transform to detect iris
for iter = 1:100
clearvars -except cam
img = rgb2gray(snapshot(cam));
img = imcrop(img,[480,20,300,400]);
imshow(img,[])
hold on


%e = edge(img,'canny');
e = edge(medfilt2(img,[9 9]),'canny');
radii = 6:1:12;
[y0detect,x0detect,Accumulator] = houghcircle(e,9,9*pi,[1,100,300,150]);
peaks = circle_houghpeaks(Accumulator, radii, 'npeaks', 2);

for peak = peaks
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end
hold off

end

