% Assuming Bscans is an array of 300x551 double matrices representing B-scan images
Sigma = 2; % Example value for Sigma in Hessian-based filtering, adjust as needed


% Calculate components of the Hessian matrix
[Dxx, ~, Dyy] = Hessian2D(Bscan1, Sigma);

% Compute Hessian-enhanced image
Bscan_hessian = sqrt(Dxx.^2 + Dyy.^2);

% Assess the quality of the Hessian-enhanced image using quality metrics
brisque_hessian = brisque(Bscan_hessian);
niqe_hessian = niqe(Bscan_hessian);
piqe_hessian = piqe(Bscan_hessian);

% Display quality scores
fprintf('Bscan Quality Scores:\n');
fprintf('BRISQUE: %f\n', brisque_hessian);
fprintf('NIQE: %f\n', niqe_hessian);
fprintf('PIQE: %f\n', piqe_hessian);

% Contrast Enhancement - Alternative to CLAHE
% Use a simple linear contrast stretching
contrast_enhanced = mat2gray(Bscan1); % Convert to grayscale image in the range [0, 1]
contrast_enhanced = imadjust(contrast_enhanced, stretchlim(contrast_enhanced), []); % Stretch the contrast

% Evaluate the quality of the contrast-enhanced image
brisque_contrast = brisque(contrast_enhanced);
niqe_contrast = niqe(contrast_enhanced);
piqe_contrast = piqe(contrast_enhanced);

% Display quality scores for the contrast-enhanced image
fprintf('Contrast-Enhanced Image Quality Scores:\n');
fprintf('BRISQUE: %f\n', brisque_contrast);
fprintf('NIQE: %f\n', niqe_contrast);
fprintf('PIQE: %f\n', piqe_contrast);

% Note: Hessian2D function needs to be defined or an equivalent function needs to be provided.
