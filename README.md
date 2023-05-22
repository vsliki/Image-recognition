# Image-recognition
The aim of this project is to define through SGD algorithm a model allowing image recognition for numbers represented in 5x3 matrices.

## Abstract
In this work, I explain the functioning of an artificial neural network, and detail step by step the construction of such a network allowing the recognition of specific images. 
My example is a model that can distinguish numbers represented as black pixels on a white background, for images of size 5×3. 
I used Phil Kim's book: *MATLAB Deep Learning, With Machine Learning, Neural Networks and Artificial Intelligence* [1] to implement the network code, and modified it to match to my data.
The interest of this work, via this example, is to add errors to our images of figures, described by variations of gray on the pixels, and to observe how much these modifications influence the capacity of image recognition. 
To improve the learning of the network, I analyzed the impact on it of the cost function used, by studying two of them: the sum of the square of the differences and the cross entropy. 
Then, by adjusting the different parameters of the network, I allowed it to achieve good recognition of noisy images.
