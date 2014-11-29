VLSI Final
==========

Sobel edge detection hardware implementation

### TODO (In Order of Importance) ###
1. Confirm state machine functionality
2. Top level component (filter.vhd)
3. Testbench all subcomponents
4. Testbench top level design
5. Optimize addition/subtraction components

### Things to fix... Later... ###
1. Should probably hardcode bus widths since they will never not be 8 bit inputs and 10 bit outputs
2. Switch order of inputs in sobel.vhd so that perpendiculars are properly paired