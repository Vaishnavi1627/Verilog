//code
module enc83(din,dout,en);
input [7:0]din;
input en;
output reg [2:0]dout;
//behavioural
always@(*)
begin
if(!en)
         dout = 3'bxxx;
else
 case(din)
    
    8'b00000001: dout = 3'b000;
    8'b00000010: dout = 3'b001;
    8'b00000100: dout = 3'b010;
    8'b00001000: dout = 3'b011;
    8'b00010000: dout = 3'b100;
    8'b00100000: dout = 3'b101;
    8'b01000000: dout = 3'b110;
    8'b10000000: dout = 3'b111;
    default : dout = 3'bxxx;
    endcase
end 

//Dataflow

 /*
 assign dout[2] = din[4]|din[5]|din[6]|din[7];
 assign dout[1] = din[2]|din[3]|din[6]|din[7];
 assign dout[0] = din[1]|din[5]|din[3]|din[7];
*/

//gatelevel
/*
or or1(dout[2],din[4],din[5],din[6],din[7]);
or or2(dout[1],din[2],din[3],din[6],din[7]);
or or3(dout[0],din[1],din[5],din[3],din[7]);
*/
endmodule

//testbench

module enc83tb;
reg en;
reg [7:0]din;
wire [2:0]dout;

enc83 enc83t(.din(din),.dout(dout),.en(en));
initial 
    begin
    en = 0; 
    #5 en = 1;
      #5 din = 8'b00000001;
      #5 din = 8'b00000010;
      #5 din = 8'b00000100;
      #5 din = 8'b00001000;
      #5 din = 8'b00010000;
      #5 din = 8'b00100000;
      #5 din = 8'b01000000;
      #5 din = 8'b10000000;
      #5 din = 8'b00001000;    
    
    $finish;
    end
always@(din)
$monitor("time=%0t,din = %0b, dout = %0b",$time,din,dout);


endmodule

