# Image-recognition
The aim of this project is to define through SGD algorithm a model allowing image recognition for numbers represented in 5x3 matrices.

## Abstract
In this work, I detail step by step the construction of an artificial neural network allowing the recognition of specific images. 
My example is a model that can distinguish numbers represented as black pixels on a white background, for images of size 5×3. 
I used Phil Kim's book: *MATLAB Deep Learning, With Machine Learning, Neural Networks and Artificial Intelligence* [1] to implement the network code, and modified it to match to my data.

## My model
My model, as I have built it, is composed of several different structures and can be schematized as follows:

![Representation of my neural network.](https://github.com/vsliki/Image-recognition/blob/main/NN.png)

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

**Remark:** In order to standardize the data of this work with those of the implementation, I used the following notations:
<ul>
  <li>$x := y_0$,</li>
  <li>$y := y_3$,</li>
  <li>$v := v_3$,</li>
  <li>$e := e_3$,</li>
  <li>$\delta := \delta_3$.</li>
</ul>


