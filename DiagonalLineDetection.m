 
row=150;
colum=150;

row1=1;

%function []=estimate_sharpness()

file_name=dir(strcat('C:\Users\hp\Documents\MATLAB\pics2')); % the path tht u hv imges

for i=3:117 %suppose there are 115 images
    
image=imread(strcat('C:\Users\hp\Documents\MATLAB\pics2\',file_name(i).name));
   
  %imtool(image);
image1=imresize(image,[row,colum]); 
 meanIntensity=mean(image1(:));
bw1=im2bw(image1);
mask = zeros(size(bw1));
mask(25:end-25,25:end-25) = 1;
 SegImage = activecontour(bw1,mask,300,'edge');
 bw2=bwareafilt(SegImage,1);
BW3=bwareafilt(SegImage,2);
separatematrix=zeros();
separatematrix=minus(BW3,bw2);
%bw4=imsharpen(bw2);
%bw5=imsharpen(BW3);
%separatedmatrix1=zeros();
%separatematrix1=minus(BW3-bw2);

LObjectpixels= regionprops('table',bw2,bw1,'PixelList');
properties1= regionprops(separatematrix,BW3,'PixelList');
 
%imshow(bw1)


    %% Line+object edge detection
 bww11=edge(bw1,'canny',0.988);
%figure(1);
%imshow(bww11);
%% create laplacian filter. 
    H1 = fspecial('laplacian');
     %% apply laplacian filter. 
filteredImageLine = imfilter(bww11,H1);
figure(2);

imtool(filteredImageLine); title(' Line+Object Edge detected  after Filteration') ;

 coordinates=regionprops(bww11,'PixelList');
 Length=length(coordinates);
    
   A=coordinates(1).PixelList;
  % A1=coordinates(2).PixelList;
  % AA1=vertcat(A1,A);
    for i=2:Length
    A1=coordinates(i).PixelList;
    %A=vertcat(A,A1);
   i=i+1;
   end

 
  


TotalPixelsinBW2=zeros(); 
TotalPixelsinBW2= find(bw2);
[x,y]=find(bw2);
medianobjectPixels=median([x y]);
TotalPixelsinseparatematrix=zeros();
TotalPixelsinseparatematrix= find(separatematrix);
[p q]=find(separatematrix);
B=properties1.PixelList;
x1=medianobjectPixels(:,1);
y1=medianobjectPixels(:,2);
x2=p(1,:);
y2=q(1,:);
x3=p(end,:);
y3=q(end,:);
if isequal(x2,x3)
    Angle1=pi/2;
else
slope1=(y3-y2)./(x3-x2);  % slope of second lagest object
Angle1=1./tan(slope1);
end
%slope2=(y2-y1)./(x2-x1);  % slope of first largest object
%Angle2=1./tan(slope2);
%InclinationAngle=Angle1-Angle2;

FeatureMatrix(row1,1)=Angle1;

end
