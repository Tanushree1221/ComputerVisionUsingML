

I = imread('ab45.jpg');

%file_name=dir(strcat('C:\Users\hp\Documents\MATLAB\pics2')); % the path tht u hv imges

%for i=3:54 %suppose there are 115 images
    
%image=imread(strcat('C:\Users\hp\Documents\MATLAB\pics2\',file_name(i).name));
   
row=150;
colum=150;
I1=imresize(I,[row,colum]);
%figure, imtool(I1);
I12=im2bw(I1);

figure(1), title('Original Image');
imshow(I1);
% mask = zeros(size(I12));
% mask(25:end-25,25:end-25) = 1;
%   
% %  figure(2), imshow(mask);
% % title('');
% bw1 = activecontour(I12,mask,300,'edge');
%   
% %figure(3),title('Initial Contour Location');
% imshow(bw1);
% %% apply Canny 
%bw=edge(I12,'canny',0.91);
%figure(2),title(' Line+Object Edge detected  after Canny') ;
%imshow(bw);
% % %% apply laplacian filter.
%for c=1:50
H1 = fspecial('laplacian');
%imshow(H1);     
%bw11 = imfilter(I12,H1);
%[p,n]=size(50);
%output=zeros(p,n);

%for i=1:p
 %  for j=1:n
  %      c=0;
        

           bw11 = imfilter(I12,H1);
           figure(2)
           imshow(bw1);
           m=mean(bw11);
           
           %outputs=mean(bw11);
          %c=c+1;
  % end
   
    
    

%figure(5),title(' Line+Object Edge detected  after LOG') ;
%imshow(bw11); 
%S1=edge(I12,'sobel',0.45);
% figure(6),title('sobel method');
% imshow(S1);
% P1=edge(I12,'prewitt');
% figure(7),title('prewitt');
% imshow(P1);

% [L,Num]=bwlabel(bw1,8);
% LO=bwareafilt(bw1,1);
% figure(2),title('largest object');
% imshow(LO);
% 
% 
% SLO=bwareafilt(bw1,2);
% % figure(5),imtool(SLO);
% % 
% % title(' 2 No largest object');
% 
% SL=SLO-LO;
% figure(3),title('Second largest object');
% imshow(SL);
% 
%  
% %  bw1=im2bw(I);
% %  bww11=edge(bw,'canny',0.985);
% % figure(7);
% % imshow(bww11);
%  
%  cc = bwconncomp(SL)
% numPixels = cellfun(@numel,cc.PixelIdxList);
% [biggest,idx] = max(numPixels);
% SL(cc.PixelIdxList{idx});
%  %figure(5)
%  %imshow(SL(cc.PixelIdxList{idx}));
% LObjectpixels1= regionprops('table',LO,bw1,'PixelList','Area','MaxIntensity','MeanIntensity');
% properties12= regionprops('table',SL,SLO,'PixelList','Area','MaxIntensity','MeanIntensity');
% TotalPixelsinLO=zeros(); 
% TotalPixelsinLO= find(LO);
% [x11,y11]=find(LO);
% medianobjectPixels1=median([x11 y11]);
% TotalPixelsinSL=zeros();
% TotalPixelsinSL= find(SL);
% [p1 q1]=find(SL);
% %medianPixels=median([p q]);
% x12=medianobjectPixels1(:,1);
% y12=medianobjectPixels1(:,2);
% x22=p1(1,:);
% y22=q1(1,:);
% x33=p1(end,:);
% y33=q1(end,:);
% % if isequal(x22,x33)
% %     Angle11=pi/2;
% % else
% % slope11=(y33-y22)./(x33-x22);  % slope of second lagest object
% % Angle11=1./tan(slope11);
% % end
% % slope22=(y22-y12)./(x22-x12);  % slope of first largest object
% % Angle22=1./tan(slope22);
% % InclinationAngle1=Angle11-Angle22;
% % Area1=LObjectpixels1.Area;
% % Area2=properties12.Area;
% % RelativeArea=Area1-Area2;
% % Intensity1=LObjectpixels1.MeanIntensity;
% % Intensity2=properties12.MeanIntensity;
% % RelativeIntensity=Intensity1-Intensity2;


