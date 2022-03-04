# DVS
Data Visualization Saliency Model

You will need Matlab with the Computer Vision and Image Processing
toolkits in order to run this software.

HOW TO INSTALL:

Right after you download the zip file, you must change into the
directory containing this file and run:

>> dvs_install 

You only need to run that the first time. Afterwards, you can generate
a saliency map as follows:

To load an image:

>> img = imread('samplepics/1.jpg');

To compute a DVS map:

>> map = dvs(img); % map.master_map contains the actual saliency map 

And you can visualize the saliency map on top of your image as follows:

>> show_imgnmap( img , map ); 
