module locksys(setpin,inpin,reset,enter,access,alarm,count);
input reset,enter;
input [15:0] setpin, inpin;
output access,alarm;
output [1:0] count;//max count is 3 which can be represented in 2 bits 3=11
wire check;//is equal?
assign check = !(setpin^inpin);//logical negetion 
modN_ctr counter(enter,!check,reset,count,access,alarm);
endmodule
//modN_ctr decides when to give access and when to give off alarm and show the count
//E is opposite of the check
module modN_ctr(clk,E,rstn,cnt,access,alarm);
parameter N = 3; //3 wrong inputs 
parameter width = 2; //binary width of 3
input clk,E,rstn;
output reg access,alarm;
output reg [width-1:0] cnt;
always @(posedge clk, posedge rstn) begin
    if (rstn) begin//if reset button is pushed independent of anything the alarm and count is set to 0
        alarm<=0;
        cnt<=0;
    end
    else if (E & cnt == N-1) begin//new wrong password or count is 2
        access<=0;//access denied
        alarm<=1;//alarm turned on
        cnt<=cnt+1;//count incremented
    end
    else if (cnt == N) begin//count= 3
        access<=0;
        alarm<=0;
    end
    else if (E) begin//if check is 0 //wrong in 1st attemp
        cnt<=cnt+1;
        access<=0;
        alarm<=1;
    end
    else begin//right inpin
        cnt<=0;
        access<=1;
        alarm<=0;
    end
end
endmodule

