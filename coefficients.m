
function [coefficients] = coefficients(f, A)
% INPUT: A matrix (f) of face images and an orthogonal
%        matrix of eigenfaces
% OUTPUT: A matrix representing each face image in f as
%         combination of eigenfaces
% COMPLEXITY: Not great

    coefficients = zeros(size(A,2), size(f,2));
    for m = 1:size(f,2);
        for n = 1:size(A, 2);
            coefficients(n,m) = dot(f(:,m), A(:,n));
        end
    end
end