# FIFO 📥

**First In First Out**

A sequential type of memory used to pass data between two asynchronous clock domains. Usually between two systems working in same clock but with different throughput. 

![alt text](image.png)

### Uses of FIFO

- Avoid **Overflow**
  - Writing is faster than reading.
- Avoid **Underflow**
  - Writing is slower than reading.


You can find the [code](fifo.v) and [testbench](fifo_tb.v) of FIFO here, before that you need to know how to calculate the depth of the fifo. 

## Depth Calculation

Size of FIFO basically implies that how much data is required to buffer.
Consider the worst case while reading and writing. So the depth basically depend on the rate of reading and writing and the size of data.

> [!NOTE]
> Things to consider before calculating depth
> - Read Frequency
> - Write Frequency
> - Data Length
> - Idle Cycles in operations

#### CASE 1
~~~
Write Frequency > Read Frequency
~~~

> <details>
>     <summary>How to Proceed</summary>
> 
> ```
> F write = 80MHz   F read = 50Mz   Burst Length = 120
> Consider no idle cycle between
> ```
>
> 
> Time required to write one data item  = $\frac{1}{F_w}$ = $\frac{1}{80M}$ = 12.5 ns
>
> Time required for writing whole data = 120 * 12.5 = 1500 ns
>
> Time required to read one data item   = $\frac{1}{F_r}$ = $\frac{1}{50M}$ = 20 ns
>
> Number of data read during 1500ns  =  $\frac{1500}{20}$ = 75
>
> Number of Data needed to store in FIFO = 120(Total data) - 75(read Data) = **45**
>
> 
> </details>



#### CASE 2
~~~
Write Frequency > Read Frequency  with idle clocks
~~~

> <details>
>     <summary>How to Proceed</summary>
>
> ```
> F write = 80MHz   F read = 50Mz   Burst Length = 120
> 1 Idle clock between successive writes
> 3 Idle clock between successive reads
> ```
>
> 
> Time required to write one data item with considering idle   = $2*\frac{1}{F_w}$ = $\frac{2}{80M}$ = 25 ns
>
> Time required for writing whole data = 120 * 25 = 3000 ns
>
> Time required to read one data item with considering idle  = $4*\frac{1}{F_r}$ = $\frac{4}{50M}$ = 80 ns
>
> Number of data read during 1500ns  =  $\frac{3000}{80}$ = 37.5 = 37
>
> Number of Data needed to store in FIFO = 120(Total data) - 37(read Data) = **83**
> 
> </details>


#### CASE 3
~~~
Write Frequency < Read Frequency
~~~

<details>
    <summary>How to Proceed</summary>
    Depth of **1** is sufficient.
</details>

#### CASE 4
~~~
Write Frequency < Read Frequency  with idle clocks
~~~

> <details>
>     <summary>How to Proceed</summary>
>
> ```
> F write = 30MHz   F read = 50Mz   Burst Length = 120
> 1 Idle clock between successive writes
> 3 Idle clock between successive reads
> ```
>
> 
> Time required to write one data item with considering idle   = $2*\frac{1}{F_w}$ = $\frac{2}{30M}$ = 66.67 ns
>
> Time required for writing whole data = 120 * 66.67 = 8000 ns
>
> Time required to read one data item with considering idle  = $4*\frac{1}{F_r}$ = $\frac{4}{50M}$ = 80 ns
>
> Number of data read during 1500ns  =  $\frac{8000}{80}$ = 100
>
> Number of Data needed to store in FIFO = 120(Total data) - 100(read Data) = **20**
> 
> </details>

#### CASE 5
~~~
Write Frequency = Read Frequency
~~~

<details>
    <summary>How to Proceed</summary>
    No need of FIFO if clock are on phase,
    Depth of **1** is sufficient if clock are out of phase.
</details>


 #### CASE 6
~~~
Write Frequency = Read Frequency  with idle clocks
~~~

> <details>
>     <summary>How to Proceed</summary>
>
> ```
> F write = 50MHz   F read = 50Mz   Burst Length = 120
> 1 Idle clock between successive writes
> 3 Idle clock between successive reads
> ```
>
> 
> Time required to write one data item with considering idle   = $2*\frac{1}{F_w}$ = $\frac{2}{50M}$ = 40 ns
>
> Time required for writing whole data = 120 * 40 = 4800 ns
>
> Time required to read one data item with considering idle  = $4*\frac{1}{F_r}$ = $\frac{4}{50M}$ = 80 ns
>
> Number of data read during 1500ns  =  $\frac{4800}{80}$ = 60
>
> Number of Data needed to store in FIFO = 120(Total data) - 60(read Data) = 60
> 
> </details>


### Simulation Results

![waveform](https://github.com/user-attachments/assets/97fe3909-9c55-4dad-b7fb-6539f1916f1a)

![schematic](https://github.com/user-attachments/assets/866b4ebf-e435-445d-9aaa-9b36915fd3ea)

