`include "locksys01.v"
//testbench
module locksys_tb;
reg [15:0] setpin, inpin;
reg reset,enter;
wire access,alarm;
reg [1:0] count;
integer i;
locksys instance0 (.setpin(setpin),.inpin(inpin),.reset(reset),.enter(enter),.access(access),.alarm(alarm));
initial begin
    setpin=16'b0001001000110100;inpin=16'b0001001000110100;reset=0;enter=1;
    #10;
end
initial begin
    $monitor("%t|setpin=%b|inpin=%b|reset=%b enter=%b|access=%b|alarm=%b",$time,setpin,inpin,reset,enter,access,alarm);
    $dumpfile("locksys_dump.vcd");
    $dumpvars();
end
endmodule
