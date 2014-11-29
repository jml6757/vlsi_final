VLSI Final
==========

Sobel edge detection hardware implementation

### Component Hierarchy ###
* filter.vhd
 * fsm.vhd
 * sobel.vhd
  * derivative.vhd
   * mac121.vhd
   * absdiff2.vhd
   * mux2.vhd
  * max4.vhd
   * maxidx2.vhd
   * mux2.vhd

### TODO (In Order of Importance) ###
1. Confirm state machine functionality
2. Top level component (filter.vhd)
3. Testbench all subcomponents
4. Testbench top level design
5. Optimize addition/subtraction components