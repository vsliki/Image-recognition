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

**Remark 2.1:** The network is here composed of 3 layers, the input layer
being considered as layer 0.

<ol>
  <li>The different layers:</li>
   <ul> 
    <li>$x:= y_0 \in \mathbb{R}^{15}$ : the input layer of the network.</li>
    <li>$y_1 \in \mathbb{R}^{30}$ : the first intermediate layer of the network.</li>
    <li>$y_2 \in \mathbb{R}^{20}$: the second intermediate layer of the network.</li>
    <li>$y:= y_3 \in \mathbb{R}^{10}$: the output layer of the network.</li>
   </ul>
  <li>The parameters associated with the different layers:</li>
    <ul>
      <li>$W_1 \in \mathbb{R}^{30\times15}$: The matrix containing the weights between the input layer and the 1st intermediate layer.</li>
      <li>$W_2 \in \mathbb{R}^{20\times30}$: The matrix containing the weights between the 1st and 2nd intermediate layers.</li>
      <li>$W_3 \in \mathbb{R}^{10\times20}$: The matrix containing the weights between the second intermediate layer and the output layer.</li>
      <li>$b_1 \in \mathbb{R}^{30}$: the bias added to the weighted sum of the elements of the input layer.</li>
      <li>$b_2 \in \mathbb{R}^{20}$: the bias added to the weighted sum of the elements of the 1st intermediate layer.</li>
      <li>$b_3 \in \mathbb{R}^{10}$: the bias added to the weighted sum of the elements of the second intermediate layer.</li>
      <li>$\alpha \in \mathbb{R}$: the learning rate. (see Definition 2.5)</li>
    </ul>
  <li>Activation of neurons in the different layers: (see section 2.1.4)</li>
    <ul>
      <li>$\sigma$: the Sigmoid activation function. </li>
      <li>$\tilde\sigma$: the Softmax activation function.</li>
     </ul>
  <li>Data circulating in the network:</li>
    <ul>
      <li>$v_1 \in \mathbb{R}^{30}$: the output value of the input layer. It corresponds to the weighted sum of the neurons of the input layer.</li>
      <li>$v_2 \in \mathbb{R}^{20}$: the output value of the 1st intermediate layer. It corresponds to the weighted sum of the neurons of this layer.</li>
      <li>$v:= v_3 \in \mathbb{R}^{10}$: the output value of the second intermediate layer. It corresponds to the weighted sum of the elements of this second intermediate layer.</li>
    </ul>
  <li>Errors: (see section 2.2)</li>
    <ul>
      <li>$e_k$: errors propagated respectively to layers $k = 1, 2, 3$. </li>
      <li>$\delta_k$: deltas propagated respectively to layers $k = 1, 2, 3$.</li>
    </ul>
  <li>Network adaptations:</li>
  <ul>
    <li>$\Delta W_k$: adjustment of matrix $W_k$, $k = 1, 2, 3$. </li>
    <li>$\Delta b_k$: adjustment of vector $b_k$, $k = 1, 2, 3$.</li>
  </ul>
</ol>

**Remark 2.2:** In order to standardize the data of this work with those of the implementation, I used the following notations:
<ul>
  <li>$x := y_0$,</li>
  <li>$y := y_3$,</li>
  <li>$v := v_3$,</li>
  <li>$e := e_3$,</li>
  <li>$\delta := \delta_3$.</li>
</ul>

### 2.1 Neural networks: description of its functioning:
#### 2.1.1 Testing, training and validation sets:
To be able to create and train a neural network, I use a set of data, called a <ins>test set</ins>, composed of pairs in the form $\verb|{Input, Correct Output}|$. This set is made up of two subsets:
<ul>
  <li>The <ins>training set</ins>: containing 75% of this data.</li>
  <li>The <in>validation set</in>: containing the remaining 25%.</li>
</ul>

**Definition 2.2:** A <ins>training set</ins> is a finite set of known data used to perfect a model by adjusting its parameters, in order to obtain a good estimate of unknown data.
**Definition 2.3:** A <ins>validation set</ins> is a finite set of data, used to verify the proper functioning of the network. The content of this set is different from the training set, but is nevertheless known.

I want to create a model allowing to recognize images representing the numbers $0,1,...,9$ on a grid. To be able to create a network like this, I proceed according to the following steps:
<ol>
  <li>First, I use the data from the training set. I insert the $\texttt{Inputs}$ of this set into the network, and, to obtain a result of the model sufficiently close to the $\texttt{Correct Outputs}$, I adapt the parameters of the network.</li>
  
  <li>Subsequently, I use the validation set, in order to compare the values obtained by the network with the $\texttt{Correct Outputs}$ of this set. If the results coincide, the network is functional. On the other hand, if this is not the case, go back to step 1 and adapt the parameters so as to obtain an acceptable correspondence between the results.</li>
</ol>
 
 
 #### 2.1.2 Inputs and outputs
The $\verb|{Input, Correct Output}|$ pair is the data I want the network to recognize. This data is stored in the form of matrices. For a purely computational reason, it is necessary to adapt these matrices and transform them into vectors. Thus, we have:
<ul>
  <li>The $\texttt{Inputs}$ are matrices $X \in \mathbb{R}^{3\times5}$ corresponding to noisy images of each digit. I represent these matrices in a vector $x \in \mathbb{R}^{15}$ concatenating the rows of $X$. This is the input layer of the network.</li>
  <li>The $\verb|Correct Outputs|$ are matrices $D \in \mathbb{R}^{3\times5}$ corresponding to the images of each digit in $\verb|Input|$, but not noisy.</li>
  <li>The output value of the network, written *output*, is a vector $y \in \mathbb{R}^{10}$.</li>
</ul>

To be able to compare this one to the $\verb|Correct Outputs|$, I followed the model proposed by *Phil Kim* (1.p.93), that is to say: define the different possible outputs in the form of vectors d corresponding to the 10 classes of figures represented by the matrices $D$:

