function [Images, w, h] = read_images(numImg)
w = 222;
h = 197;
Images = zeros(w*h,15);
fid = fopen('filelist.txt','r');
for i = 1:numImg
  imgname = fgetl(fid);
  Img = imread(imgname);
  Images(1:w*h,i) = reshape(Img',w*h,1);
 end;
  fclose(fid);