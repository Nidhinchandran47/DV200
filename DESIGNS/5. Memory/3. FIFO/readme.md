# FIFO 📥

**First In First Out**

A sequential type of memory used to pass data between two asynchronous clock domains. Usually between two systems working in same clock but with different throughput. 

![alt text](image.png)

### Uses of FIFO

- Avoid **Overflow**
  - Writing is faster than reading.
- Avoid **Underflow**
  - Writing is slower than reading.

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
> Number of Data needed to store in FIFO = 120(Total data) - 75(read Data) = 45
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
> Number of Data needed to store in FIFO = 120(Total data) - 37(read Data) = 83
> 
> </details>


#### CASE 3
~~~
Write Frequency < Read Frequency
~~~

<details>
    <summary>How to Proceed</summary>
    Depth of 1 is sufficient.
</details>
