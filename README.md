# Processor-Design
This project contains the detailed discussion of implementing a processor with Field Programmable Gate Array using Vivado 2019.1. Main task is filtering the input image and then down sampling it by ½ in each dimension using the processor. Report is furnished with methods and theories used for filtering and down sampling an image.

## Image Preprocessing
The initial step for the given task is to convert the original RGB image into a grayscale image. The next step for the given task is to add zero padding to the image and convert the pixel data contained in the 256x256 (after zero padding) image pixels to hexadecimal values. The values are then rearranged line by line to store the data in a ".mem" file (".mem" is a file format that can be read in processor simulation). This can be done using a Python code. The code snippet used for this task is given in the Appendix ‘Python Code’ (01).

![alt text](https://github.com/YasodGinige/Processor-Design/blob/main/Images/1.JPG?raw=true)

Then this data in the ".mem" file should be loaded into DRAM. After loading, this data can be stored in the data memory (DRAM). The code snippet used to load and store the numerical data in the “.mem” file is given in Appendix ‘Python Code’ (02).

## Filtering Algorithm

In order to reduce the effects of aliasing caused by the high frequency components in the image, the image needs to be low pass filtered, prior to down sampling it. This part was implemented by using a Gaussian low pass filter. After converting the original RGB image in Figure 1 into a gray scale image by using the “rgb2gray(image)” function, white dots which can be considered as high frequency components, are clearly visible. In order to filter this image, a 3×3 kernel that has a half width of size 1 is used.

![alt text](https://github.com/YasodGinige/Processor-Design/blob/main/Images/2.JPG?raw=true)

Using the above filter kernel, the image was filtered. After down sampling it, following 127×127 image in Figure 2 was obtained. The image in Figure 3 is the image which was down sampled without filtering it.

![alt text](https://github.com/YasodGinige/Processor-Design/blob/main/Images/3.JPG?raw=true)
