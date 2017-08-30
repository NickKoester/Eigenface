clear;
numImg = 15;
[A, w, h] = read_images(numImg);
%subtract mean
meanFace = mean(A,2);
A = bsxfun(@minus, A, meanFace);
% obtain eigenvalue & eigenvector
S = A' * A;
[V,D] = eig(S);
V = A * V;
V = normalize(V);
eigval = diag(D);
% sort eigenvalues in descending order
eigval = eigval(end:-1:1);
eigval = eigval(1:numImg-1);
V = fliplr(V);
V = V(:,1:numImg-1);
% show 0th through 15th principal eigenvectors
eig0 = reshape(meanFace, [h,w]);
figure, subplot(4,4,1)
imagesc(eig0)
colormap gray
for i = 1:numImg-1
subplot(4,4,i+1)
imagesc(reshape(V(:,i),h,w))
end

%% Classify
coeff = coefficients(A, V);
test = imread('test01.gif');
test = reshape(test',w*h,1);
test = double(test);
test = bsxfun(@minus, test, meanFace);
testCoeff = coefficients(test,V);
[match, distance] = matchFace(testCoeff, coeff);
figure;
colormap gray
imagesc(reshape(test,h,w));
figure;
colormap gray
imagesc(reshape(A(:,match),h,w));