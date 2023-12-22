module mm_ram_tb;

   // Testbench inputs
   reg clk_i;
   reg rst_ni;
   reg rnd_num_req;

   // Testbench outputs
   reg [31:0] rnd_num;

   // Instantiate the DUT
   mm_ram dut (
      .clk_i(clk_i),
      .rst_ni(rst_ni),
      .rnd_num_req(rnd_num_req),
      .rnd_num(rnd_num)
   );

   // Clock generation
   always #5 clk_i = ~clk_i;

   // Reset generation
   initial begin
      rst_ni = 0;
      #10;
      rst_ni = 1;
   end

   // Stimulus generation
   initial begin
      rnd_num_req = 0;
      #20;
      rnd_num_req = 1;
      #100;
      rnd_num_req = 0;
      #50;
      $finish;
   end

   // Monitor
   always @(posedge clk_i) begin
      $display("rnd_num = %h", rnd_num);
   end

endmodule