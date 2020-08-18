# The-Barabasi-Albert-Model
This repository contains codes for the simulation of Barabasi Model
### Describtion
We start with m0 nodes, the links between which are chosen arbitrarily, as long as each node has at least one link. The network develops following two steps :

(A) Growth

At each timestep we add a new node with m (≤ m0) links that connect the new node to m nodes already in the network.

(B) Preferential attachment

The probability Π(k) that a link of the new node connects to node i depends on the degree ki 

Preferential attachment is a probabilistic mechanism: A new node is free to connect to any node in the network, whether it is a hub or has a single link. Equations for preferential attachment implies, however, that if a new node has a choice between a degree-two and a degree-four node, it is twice as likely that it connects to the degree-four node.

reference:

[The Barabasi Albert Model](https://barabasi.com/book/network-science)

### Codes
In the code `Barabashi_network_m1` each new node has one link and in the code `Barabashi_network_m2` each new node has 2 links. In both codes the initial configuration starts with three nodes that are fully connected
