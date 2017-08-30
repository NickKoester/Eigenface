function [column, bestDistance] = matchFace(f, A)
% matchFace(f, A)
% INPUT: A vector representing a face in the eigenface basis
%        and a matrix of training images in the eigenface basis
% OUTPUT: The index of the column in A that best matches the
%         new face and the distance of the new face from the match

    function [d] = dist(a, b)
        c = a - b;
        c = c .^ 2;
        d = sum(c);
        d = sqrt(d);
    end

    bestDistance = Inf(1);
    column = -1;
    for m = 1:size(A, 2);
        distance = dist(f, A(:, m));
        if distance < bestDistance
            bestDistance = distance;
            column = m;
        end
    end
end

