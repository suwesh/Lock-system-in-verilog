# Lock-system-in-verilog
a lock system with 4 digit pin in verilog where upto 3 wrong inputs are allowed

Flowchart:

---------------------->input pin                                                                  .
|                          |                                                                      .
|    preset pin-------> compare                                                                   .
|                          |                                                                      .      
|                     check equal?---No-->count=count+1<-----count=0<------                       .
|                          |                   |                          |                       .
|                          yes              count<3?--No--->alarm On      |                       .
|                          |                   |                   |-Off  |                       .
|                      Grant access            Yes                 |      |                       .
|______________________________________________|                  reset----                       .
                                                                     
