`timescale 1ns / 1ps

module decoder_3X8_tb;

   reg x,y,z;
   wire [7:0] D;

decoder_3X8 dut (
   .x(x), .y(y), .z(z), .D(D)
);

integer i;
reg [7:0] expected;

initial begin
   x=0;y=0;z=0;
   #5;
   
   $display(" time | xyz |          D |    expected | result");
   $display("------------------------------------------------");
   
   //3'b000 ~ 3'b111
   for(i = 0; i < 8; i = i + 1) begin
      {x, y, z} = i[2:0];
      expected = (8'b00000001 << i);
      #10;
      
      if (D == expected)
         $display("%4t | %b | %b | %b | PASS",$time,{x,y,z},D,expected);
      else
         $display("%4t | %b | %b | %b | **FAIL**",$time,{x,y,z},D,expected);
      end
      
      
      $finish;
   end


endmodule
