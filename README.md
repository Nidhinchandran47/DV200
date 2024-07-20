# 🎉 DV200: The Ultimate RTL Design and Verification Playground 🛠️

Welcome to **DV200**, your go-to repository for exploring, learning, and mastering RTL design and verification. Whether you're a seasoned hardware engineer or a curious beginner, DV200 offers a variety of simple yet illustrative digital designs and their corresponding verification code. Let's dive into the fascinating world of digital logic, flip some bits, and learn through hands-on experimentation. Let's make circuits and have fun! 🚀🔧

## Table of Contents
- [🎉 DV200: The Ultimate RTL Design and Verification Playground 🛠️](#-dv200-the-ultimate-rtl-design-and-verification-playground-️)
  - [Table of Contents](#table-of-contents)
  - [Repository Layout 🗂️](#repository-layout-️)
  - [Why DV200? 🤔](#why-dv200-)
  - [Getting Started 🏁](#getting-started-)
    - [Prerequisites 🛠️](#prerequisites-️)
    - [Clone the Repository 🖥️](#clone-the-repository-️)
  - [Toolchain Requirements 🧰](#toolchain-requirements-)
  - [Contribute 💡](#contribute-)
  - [Contact Me 📬](#contact-me-)

## Repository Layout 🗂️
The structure of the DV200 repository is designed for clarity and ease of use:

> [!IMPORTANT]
>  -  ▣ <a href="https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/0.%20How%20to%20code%20in%20Verilog"> <b>How to write Verilog Code</b> </a> 
>  - <details>
>     <summary>  ▣ <a href="https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/1.%20Basic"> <b>Basic</b> </a> 🔻 </summary>
>     
>     - 1 . [AND Gate](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/1.%20Basic/1.%20AND%20Gate)
>     - 2 . [OR Gate](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/1.%20Basic/2.%20OR%20Gate)
>     - 3 . [NOT Gate](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/1.%20Basic/3.%20NOT%20Gate)
>     - 4 . [NAND Gate](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/1.%20Basic/4.%20NAND%20Gate)
>     - 5 . [NOR Gate](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/1.%20Basic/5.%20NOR%20Gate)
>     - 6 . [XOR Gate](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/1.%20Basic/6.%20XOR%20Gate)
>     - 7 . [XNOR Gate](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/1.%20Basic/7.%20XNOR%20Gate)
>     - 8 . [Tri-State Buffer](<DESIGNS/1. Basic/8. TRI-STATE Buffer>)
>        
>     </details>
> 
> 
> - <details>
>     <summary>  ▣ <a href="https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational"> <b>Combinational </b> </a> 🔻 </summary>
>     
>     - 1 . [Half Adder](<DESIGNS/2. Combinational/001. Half Adder>)
>     - 2 . [Full Adder ](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/002.%20Full%20Adder)
>     - 3 . [Half Subtractor ](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/003.%20Half%20Subtractor)
>     - 4 . [Full Subtractor ](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/004.%20Full%20Subtractor)
>     - 5 . [Adder cum Subtractor](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/005.%20Adder%20cum%20subtractor)
>     - 6 . [2 to 1 MUX](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/006.%202%20to%201%20MUX)
>     - 7 . [4 to 1 MUX](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/007.%204%20to%201%20MUX)
>     - 8 . [8 to 1 MUX](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/008.%208%20to%201%20MUX)
>     - 9 . [2 to 4 Decoder ](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/009.%202%20to%204%20Decoder)
>     - 10 . [3 to 8 Decoder ](https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational/010.%203%20to%208%20Decoder) 
>     - 11 . [1 to 4 DEMUX](<DESIGNS/2. Combinational/011. 1 to 4 DEMUX>) 
>     - 12 . [1 to 8 DEMUX](<DESIGNS/2. Combinational/012. 1 to 8 DEMUX>)
>     - 13 . [Bidirectional Buffer](<DESIGNS/2. Combinational/013. Bidirectional Buffer>)
> 
>     </details>
> 
> - <details>
>     <summary>  ▣ <a href="https://github.com/Nidhinchandran47/DV200/tree/main/DESIGNS/2.%20Combinational"> <b>Memory Elements </b> </a> 🔻 </summary>
>     
>     - 3 . [FIFO](<DESIGNS/5. Memory/3. FIFO>)
> 
> 

## Why DV200? 🤔
DV200 is more than just a collection of RTL designs. It's an educational playground:
- **Learn by Doing**: Hands-on examples of digital circuits. 🚀
- **End-to-End Projects**: Each design comes with a testbench, promoting a thorough understanding of both design and verification. 📚
- **Community Driven**: Contributions are welcome, making it a collaborative effort. 🤝


## Getting Started 🏁
Follow these steps to dive into the DV200 universe:

### Prerequisites 🛠️
Ensure you have the following tools:
- Verilog/SystemVerilog compiler (e.g., Synopsys VCS, Cadence Xcelium, ModelSim)
- A simulator (e.g., Synopsys VCS, Cadence Xcelium, ModelSim)
- Make (optional, for running scripts)

### Clone the Repository 🖥️
```bash
git clone https://github.com/Nidhinchandran47/DV200.git
cd DV200
```

## Toolchain Requirements 🧰
Make sure your environment is equipped with:
- **Verilog/SystemVerilog Compiler**: Tools like Synopsys VCS, Cadence Xcelium, or ModelSim.
- **Simulator**: To run the compiled designs.
  
Or you can use online tools like **EDA Playground**


## Contribute 💡
Join the DV200 community and help us grow! Here's how:
1. **Fork the repository**: Create your own copy on GitHub. 🍴
2. **Create a branch**: `git checkout -b my-feature-branch` 🌿
3. **Make your changes**: Improve designs, add features, new designs, fix bugs. 🔧
4. **Commit your changes**: `git commit -m 'Add some feature'` 📝
5. **Push to your branch**: `git push origin my-feature-branch` 🚀
6. **Open a pull request**: We'll review and merge your changes. 🔍

## Contact Me 📬
Have questions or feedback or do you find and mistake here? I love to hear from you! Reach out at [...💬](mailto:nidhinchandran470@gmail.com).

---

DV200 isn't just a repository—it's a community and a learning resource. Dive in, explore the designs, run simulations, and become a part of the DV200 journey. Let's design the future, one module at a time. 🛠️✨


