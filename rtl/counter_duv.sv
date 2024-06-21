module counter_DUV(

input logic [4:0] data,
input bit clk,rst,load,mode,

output reg [4:0] count);

always@(posedge clk)
begin

if(rst)
	count<=5'b0;
else if(load==1)
	count<=data;
else if(mode==1) begin
	if(count >= 5'd11)
	 count<= 5'd0;     //upcounter
	else count<=count+1;
	end
else if(mode==0) begin
	if(count == 5'd0)
	 count<= 5'd11;     //downcounter
	else count<=count-1;
	end
end
endmodule
