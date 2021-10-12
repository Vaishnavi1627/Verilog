module syncfifo_tb;
  reg [7:0]din;
  reg rst,re,we,clk; 
  wire [7:0]dout;
  wire [2:0]count;
 
  
  syncfifo syncfifotb( .din(din),.dout(dout),.rst(rst),.re(re),.we(we),.clk(clk),.full(full),.empty(empty),.count(count));
  
  real	rcp,rwd,x;
initial
 begin
	$timeformat (-9, 1, " ns", 12);

   clk = 0;   	rst = 1;	we = 0;	 re = 0;
    	
	repeat(3)	@(posedge clk);
   	rst = 0;
   	repeat(5)	@(posedge clk);
   	rst = 1;
   	repeat(4)	@(posedge clk);

	if(1)
	   begin
		test_sc_fifo ;
	   end
 end

	   
task test_sc_fifo;
begin

$display("\n\n");
$display("*******************");
$display("* SC FIFO Sanity Test                           *");
$display("*******************\n");

for(rwd=0;rwd<10;rwd=rwd+1)	// read write delay
   begin
   
	for(x=0; x < 9 ;x=x+1)
	   begin
		
		wr_sc(1);
		
	   end
	
	for( x=0; x < 10; x=x+1)
	   begin
		
		rd_sc(1);
	   end
	
end
$display("");
$display("*******************");
$display("* SC FIFO Sanity Test DONE                      *");
$display("*******************\n");
end

endtask

 ///////////////////////////////////////////////////////////////////
// Clock generation

always #5 clk = ~clk;
///////////////////////////////////////////////////////////////////
//
task wr_sc;
input	cnt;
integer	n,cnt;

begin
@(posedge clk);	
	   begin
	 	we = 1;
	 	re = 0;
	 	din = $random;
	 	end
end
endtask


task rd_sc;
input	cnt;
begin
@(posedge clk);
	   begin
		re = 1;
		we = 0;
		end
end
endtask

endmodule
