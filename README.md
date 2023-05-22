# Image-recognition
The aim of this project is to define through SGD algorithm a model allowing image recognition for numbers represented in 5x3 matrices.

## Abstract
In this work, I explain the functioning of an artificial neural network, and detail step by step the construction of such a network allowing the recognition of specific images. 
My example is a model that can distinguish numbers represented as black pixels on a white background, for images of size 5×3. 
I used Phil Kim's book: *MATLAB Deep Learning, With Machine Learning, Neural Networks and Artificial Intelligence* [1] to implement the network code, and modified it to match to my data.
The interest of this work, via this example, is to add errors to our images of figures, described by variations of gray on the pixels, and to observe how much these modifications influence the capacity of image recognition. 
To improve the learning of the network, I analyzed the impact on it of the cost function used, by studying two of them: the sum of the square of the differences and the cross entropy. 
Then, by adjusting the different parameters of the network, I allowed it to achieve good recognition of noisy images.

## 1. Introduction
Artificial neural networks represent a subset of machine learning: science that allows computers to learn and adapt their operation without explicit instructions from a user, using algorithms and statistical models, to analyze and infer recurring patterns from data [2]. These models are very useful to us, even necessary, since they allow a spectacular advance whether in the field of medical imaging, in the implementation of artificial intelligence, or in the recognition and analysis of speech. However, their operation remains complex, which motivates this work. 
I would like here to explain the construction and learning of such a network, theoretically as well as practically, in the context of image recognition. Thus, the interest of this work is to detail the construction of an artificial neural network from A to Z. Thanks to the work of Phil Kim [1], I was able to discover how to implement a simple neural network and then develop it in order to be able to arrive at my more complex network, allowing the recognition of images in the form of pixels.


In order to structure the path to carry out the implementation, I will first recall the structure of a neural network as well as its functioning, then explain the learning method of such a network, via the resolution of an optimization problem using the **Stochastic Gradient Descent (SGD) algorithm**. I will define this problem according to two different cost functions: the **least squares method** and the **cross entropy** in order to compare them and choose the most optimal. Thereafter, I will describe step by step the Matlab codes which allowed me to create my model, then I will study the results obtained after modifying the various parameters of the network. Finally, I will conclude this work with the difficulties and questions I faced when designing this artificial intelligence.

## 2. Theoretical bases: Neural networks
To explain how a neural network works, I will take the network I have implemented as an example, in order to become familiar with the notations used in section 3.


**Definition 2.1:** A neural network is a model whose goal is to build a function *φ*, called a <ins>learning function</ins>, which correctly classifies training data, in order to be able to accurately predict unknown data.
A neural network is organized into several layers of neurons: 
1. The input layer.
2. The intermediate layer or layers (hidden layers).
3. The output layer.
My model, as I have built it, is composed of several different structures and can be schematized as follows:

![Representation of my neural network.](https://github.com/vsliki/Image-recognition/blob/main/NN.png)

**Remark:** The network is here composed of 3 layers, the input layer
being considered as layer 0.

<ol>
  <li>The different layers:</li>
   <ul> 
    <li>$x:= y_0 \in \mathbb{R}^{15}$: the input layer of the network.</li>
    <li>y1 ∈ R30: the first intermediate layer of the network.</li>
    <li>y2 ∈ R20: the second intermediate layer of the network.</li>
    <li>y:= y3 ∈ R10: the output layer of the network.</li>
   </ul>
  <li>The parameters associated with the different layers:</li>
    <ul>
      <li>W1 ∈ R30×15: The matrix containing the weights of the links between the entry layer and the 1st intermediate layer.</li>
      <li>W2 ∈ R20×30: The matrix containing the weights of the links between the 1st and 2nd intermediate layers.</li>
      <li>W3 ∈ R10×20: The matrix containing the weights of the links between the second intermediate layer and the output layer.</li>
      <li>b1 ∈ R30: the bias added to the weighted sum of the elements of the input layer.</li>
      <li>b2 ∈ R20: the bias added to the weighted sum of the elements of the 1st intermediate layer.</li>
      <li>b3 ∈ R10: the bias added to the weighted sum of the elements of the second intermediate layer.</li>
      <li>α ∈ R the learning rate. (see Definition 2.5)</li>
    </ul>
  <li>Activation of neurons in the different layers:</li>
    <ul>
      <li>σ: the Sigmoid activation function. o (see section 2.1.4) </li>
      <li>σ ̃: the Softmax activation function.</li>
     </ul>
  <li>Data circulating in the network:</li>
    <ul>
      <li>v1 ∈ R30: the output value of the input layer. It corresponds to the weighted sum of the neurons of the input layer.</li>
      <li>v2 ∈ R20: the output value of the 1st intermediate layer. It corresponds to the weighted sum of the neurons of this layer.</li>
      <li>v:= v3 ∈ R10: the output value of the second intermediate layer. It corresponds to the weighted sum of the elements of this second intermediate layer.</li>
    </ul>
  <li>Errors: (see section 2.2)</li>
    <ul>
      <li>ek: errors propagated respectively to layers k = 1, 2, 3. </li>
      <li>δk: deltas propagated respectively to layers k = 1, 2, 3.</li>
    </ul>
  <li>Network adaptations:</li>
  <ul>
    <li>∆Wk: adjustment of matrix Wk, k = 1, 2, 3. </li>
    <li>∆bk: adjustment of vector bk, k = 1, 2, 3.</li>
  </ul>
</ol>

