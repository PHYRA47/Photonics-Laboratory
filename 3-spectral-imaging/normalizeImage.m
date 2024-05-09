function normalizedImage = normalizeImage(inputImage)
    % Convert the input image to double precision for processing
    inputImage = im2double(inputImage);

    % Normalize pixel values to the range [0, 1]
    normalizedImage = (inputImage - min(inputImage(:))) / (max(inputImage(:)) - min(inputImage(:)));

    % Scale the pixel values to the range [0, 255]
    normalizedImage = uint8(normalizedImage * 255);
end