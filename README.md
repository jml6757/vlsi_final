vlsi_final
==========

Sobel edge detection hardware implementation

### Component Hierarchy ###
> filter.vhd
>> fsm.vhd
>> sobel.vhd
>>> derivative.vhd
>>>> mac121.vhd
>>>> absdiff2.vhd
>>>> mux2.vhd
>>> max4.vhd
>>>> maxidx2.vhd
>>>> mux2.vhd