//code
module penc83(din,en,dout);
input [7:0]din;
input en;
output reg [2:0]dout;
//behavioural
always@(*)
begin
if(!en)
         dout = 3'bxxx;
else
 casex(din)
    
    8'b00000001: dout = 3'b000;
    8'b0000001x: dout = 3'b001;
    8'b000001xx: dout = 3'b010;
    8'b00001xxx: dout = 3'b011;
    8'b0001xxxx: dout = 3'b100;
    8'b001xxxxx: dout = 3'b101;
    8'b01xxxxxx: dout = 3'b110;
    8'b1xxxxxxx: dout = 3'b111;
    default : dout = 3'bxxx;
    endcase
end 

//Dataflow

 /*
 assign dout[2] = din[4]|din[5]|din[6]|din[7];
 assign dout[1] = (~din[4]&~din[5]&din[2])|(~din[4]&~din[5]&din[3])|din[6]|din[7];
 assign dout[0] = (~din[4]&~din[6]&~din[2]&din[1]) | (~din[4]&~din[6]&din[3]) | ~(din[6]&din[5]) | din[7];
*/

//gatelevel
/*
wire w1,w2,w3,w4,w5;

and and1(w1,~din[4],~din[5],din[2]);
and and2(w2,~din[4],~din[5],din[3]);
and and3(w3,~din[4],~din[6],~din[2],din[1]);
and and4(w4,~din[4],~din[6],din[3]);
and and5(w5,~din[6],din[5]);

or or1(dout[2],din[4],din[5],din[6],din[7]);
or or2(dout[1],w1,w2,din[6],din[7]);
or or3(dout[0],w3,w4,w5,din[7]);
*/
endmodule

//testbench

module penctb;
reg en;
reg [7:0]din;
wire [2:0]dout;

penc83 penc83t(.din(din),.dout(dout),.en(en));
initial 
    begin
    en = 0; 
    #5 en = 1;
      #5 din = 8'b00000001;
      #5 din = 8'b00000010;
      #5 din = 8'b00000110;
      #5 din = 8'b00001000;
      #5 din = 8'b00010100;
      #5 din = 8'b00100000;
      #5 din = 8'b01010000;
      #5 din = 8'b10000000;
      #5 din = 8'b00001000;    
    
    $finish;
    end
always@(din)
$monitor("time=%0t,din = %0b, dout = %0b",$time,din,dout);

endmodule

