# Image-recognition
The aim of this project is to define through SGD algorithm a model allowing image recognition for numbers represented in 5x3 matrices.

## Abstract
In this work, I explain the functioning of an artificial neural network, and detail step by step the construction of such a network allowing the recognition of specific images. 
My example is a model that can distinguish numbers represented as black pixels on a white background, for images of size 5×3. 
I used Phil Kim's book: *MATLAB Deep Learning, With Machine Learning, Neural Networks and Artificial Intelligence* [1] to implement the network code, and modified it to match to my data.
The interest of this work, via this example, is to add errors to our images of figures, described by variations of gray on the pixels, and to observe how much these modifications influence the capacity of image recognition. 
To improve the learning of the network, I analyzed the impact on it of the cost function used, by studying two of them: the sum of the square of the differences and the cross entropy. 
Then, by adjusting the different parameters of the network, I allowed it to achieve good recognition of noisy images.

## Introduction
Artificial neural networks represent a subset of machine learning: science that allows computers to learn and adapt their operation without explicit instructions from a user, using algorithms and statistical models, to analyze and infer recurring patterns from data [2]. These models are very useful to us, even necessary, since they allow a spectacular advance whether in the field of medical imaging, in the implementation of artificial intelligence, or in the recognition and analysis of speech. However, their operation remains complex, which motivates this work. 
I would like here to explain the construction and learning of such a network, theoretically as well as practically, in the context of image recognition. Thus, the interest of this work is to detail the construction of an artificial neural network from A to Z. Thanks to the work of Phil Kim [1], I was able to discover how to implement a simple neural network and then develop it in order to be able to arrive at my more complex network, allowing the recognition of images in the form of pixels.


In order to structure the path to carry out our implementation, I will first recall the structure of a neural network as well as its functioning, then explain the learning method of such a network, via the resolution of an optimization problem using the **Stochastic Gradient Descent (SGD) algorithm**. I will define this problem according to two different cost functions: the **least squares method** and the **cross entropy** in order to compare them and choose the most optimal. Thereafter, I will describe step by step the Matlab codes which allowed me to create my model, then I will study the results obtained after modifying the various parameters of the network. Finally, I will conclude this work with the difficulties and questions I faced when designing this artificial intelligence.
