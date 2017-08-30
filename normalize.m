function V = normalize(V)
  for n = 1:size(V,2)
    V(:,n) = V(:,n) ./ norm(V(:,n));
  end