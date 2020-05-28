function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% Initialize centroids
iterations = 10;
centroids = kMeansInitCentroids(X, K);
for iter = 1:iterations
  tempcentroids = zeros(size(centroids));
  centroidcount = zeros(K,1);
  % Cluster assignment step: Assign each data point to the
  % closest centroid. idx(i) corresponds to cˆ(i), the index
  % of the centroid assigned to example i
  idx = findClosestCentroids(X, centroids);
  % Move centroid step: Compute means based on centroid
  % assignments
  for i= 1:m
    tempcentroids(idx(i),:) = centroids(idx(i),:) + X(i,:);
    centroidcount(idx(i)) ++;
  end
  for j= 1:K
    centroids(j,:) = tempcentroids(j,:)/centroidcount(j);
  end
end






% =============================================================


end

