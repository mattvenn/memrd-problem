`default_nettype none
module top (
	input  clk,
    output [NUM-1:0] adc_clk,
    output [NUM-1:0] adc_cs,
    input  [NUM-1:0] adc_sd,
	output [7:0] LED
);

  localparam NUM = 2;

  wire [11:0] adc_data [NUM-1:0]; // works
//  reg [11:0] adc_data [NUM-1:0]; // doesn't work - infers memrd
  reg reset = 1;
  wire [NUM-1:0] ready;

  always @(posedge clk)
    reset <= 0;

  assign LED[7:4] = adc_data[0][11:8];
  assign LED[3:0] = adc_data[1][11:8];

  generate
  genvar i;
  for(i = 0; i < NUM; i = i + 1) begin
      adc adc_inst(.ready(ready[i]), .clk(clk), .reset(reset), .adc_clk(adc_clk[i]), .adc_cs(adc_cs[i]), .adc_sd(adc_sd[i]), .data(adc_data[i]));
  end
  endgenerate

endmodule
