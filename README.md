# Processor-Design
This project contains the detailed discussion of implementing a processor with Field Programmable Gate Array using Vivado 2019.1. Main task is filtering the input image and then down sampling it by ½ in each dimension using the processor. Report is furnished with methods and theories used for filtering and down sampling an image.

## Image Preprocessing
The initial step for the given task is to convert the original RGB image into a grayscale image. The next step for the given task is to add zero padding to the image and convert the pixel data contained in the 256x256 (after zero padding) image pixels to hexadecimal values. The values are then rearranged line by line to store the data in a ".mem" file (".mem" is a file format that can be read in processor simulation). This can be done using a Python code. The code snippet used for this task is given in the Appendix ‘Python Code’ (01).
