/*==============================================
                CLK-DIV
================================================
Design Engineer:
 Felicity M. De Asis
 
Date:
 06 Apr 2026
----------------------------------------------*/
module clk_div(clk_out,clk_led,clk_in);
   //ports
   input      clk_in;
   output reg clk_out = 1'b0;
   output reg clk_led = 1'b0;

// Clock 3s period
 parameter integer TICKS_500MS = 150_000_000; // 25M ticks = 500ms
 reg [27:0] tick_cnt  = 28'b0; // count 0....24_999_999
			  
 always@(posedge clk_in)begin 
    if(tick_cnt == TICKS_500MS-1)begin
	clk_out  <= ~clk_out; 
	clk_led  <= ~clk_led;
        tick_cnt <= 28'b0;
    end

    else tick_cnt <= tick_cnt + 1;

 end

endmodule
 
