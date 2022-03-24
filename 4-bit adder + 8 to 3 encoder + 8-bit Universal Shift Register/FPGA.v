module logic_tile(out, clock, reset, in1, in2, in3, in4, in5);
  input in1, in2, in3, in4, in5, clock, reset;
  output out;
  reg [32:0] mem;
  wire [4:0] lut_control;
  wire d;
  
  assign lut_control = {in5, in4, in3, in2, in1};
  assign d = mem[lut_control];
  
  reg  q, qbar;
  always@(posedge clock or posedge reset)
    begin
      if(reset)
        q <= 1'b0;        
      else
        begin
          q <= d;
          qbar = !d;
        end      
    end
  assign out = (d & !mem[32]) | (q & mem[32]);
endmodule

module switch_box_4x4(out, in);
  input [3:0] in;
  output [3:0] out;
  reg [15:0] configure;
  
  genvar i;
  generate 
    for(i=0; i<4; i=i+1)
    begin : switch_box_output
      assign out[i] = (configure[4*i] & in[0]) | (configure[4*i+1] & in[1]) | (configure[4*i+2] & in[2]) | (configure[4*i+3] & in[3]) ;
    end
  endgenerate
endmodule

module FPGA(out7, out6, out5, out4, out3, out2, out1, out0, clk, rst, in11, in10, in9, in8, in7, in6, in5, in4, in3, in2, in1, in0);
  input clk, rst, in11, in10, in9, in8, in7, in6, in5, in4, in3, in2, in1, in0;
  output out7, out6, out5, out4, out3, out2, out1, out0;
  wire [7:0] iInp0;
  wire [7:0] iInp1;
  wire [7:0] iInp2;
  wire [2:0] iInp3;
  wire temp1, temp2, temp3;
  wire [7:0] iout;
  wire [7:0] Z;
  
  switch_box_4x4 S1_L0(
    .out({temp3, temp2, temp1, iInp0[0]}),
    .in({1'b0, in8, in7, Z[0]}) 
  );
  
  switch_box_4x4 S2_L0(
    .out({temp3, temp2, temp1, iInp1[0]}),
    .in({1'b0, in4, in5, 1'b0})  
  );
  
  switch_box_4x4 S3_L0(
    .out({temp3, temp2, temp1, iInp2[0]}),
    .in({1'b0, in0, in3, in11})  
  );
  
  switch_box_4x4 S4_L0(
    .out({temp3, temp2, temp1, iInp3[0]}),
    .in({1'b0, 1'b0, in1, 1'b0})  
  );
  
  logic_tile inst_0(
    .out(iout[0]),
    .clock(clk),
    .reset(rst),
    .in1(iInp0[0]),
    .in2(iInp1[0]),
    .in3(iInp2[0]),
    .in4(iInp3[0]),
    .in5(1'b0)
  );
  
  switch_box_4x4 S1_L1(
    .out({temp3, temp2, temp1, iInp0[1]}),
    .in({1'b0, in8, in7, Z[1]}) 
  );
  
  switch_box_4x4 S2_L1(
    .out({temp3, temp2, temp1, iInp1[1]}),
    .in({1'b0, in4, in6, iout[0]})  
  );
  
  switch_box_4x4 S3_L1(
    .out({temp3, temp2, temp1, iInp2[1]}),
    .in({1'b0, in0, in3, in11})  
  );
  
  switch_box_4x4 S4_L1(
    .out({temp3, temp2, temp1, iInp3[1]}),
    .in({1'b0, 1'b0, in2, 1'b0})  
  );
  
  logic_tile inst_1(
    .out(iout[1]),
    .clock(clk),
    .reset(rst),
    .in1(iInp0[1]),
    .in2(iInp1[1]),
    .in3(iInp2[1]),
    .in4(iInp3[1]),
    .in5(1'b0)
  );
  
  switch_box_4x4 S1_L2(
    .out({temp3, temp2, temp1, iInp0[2]}),
    .in({1'b0, iout[1], in7, Z[2]}) 
  );
  
  switch_box_4x4 S2_L2(
    .out({temp3, temp2, temp1, iInp1[2]}),
    .in({1'b0, in5, in6, iout[1]})  
  );
  
  switch_box_4x4 S3_L2(
    .out({temp3, temp2, temp1, iInp2[2]}),
    .in({1'b0, in1, in5, in11})  
  );
  
  switch_box_4x4 S4_L2(
    .out({temp3, temp2, temp1, iInp3[2]}),
    .in({1'b0, 1'b0, in4, 1'b0})  
  );
  
  logic_tile inst_2(
    .out(iout[2]),
    .clock(clk),
    .reset(rst),
    .in1(iInp0[2]),
    .in2(iInp1[2]),
    .in3(iInp2[2]),
    .in4(iInp3[2]),
    .in5(1'b0)
  );
  
  switch_box_4x4 S1_L3(
    .out({temp3, temp2, temp1, iInp0[3]}),
    .in({1'b0, iout[1], 1'b0, Z[3]}) 
  );
  
  switch_box_4x4 S2_L3(
    .out({temp3, temp2, temp1, iInp1[3]}),
    .in({1'b0, in5, 1'b0, iout[2]})  
  );
  
  switch_box_4x4 S3_L3(
    .out({temp3, temp2, temp1, iInp2[3]}),
    .in({1'b0, in1, 1'b0, in11})  
  );
  
  logic_tile inst_3(
    .out(iout[3]),
    .clock(clk),
    .reset(rst),
    .in1(iInp0[3]),
    .in2(iInp1[3]),
    .in3(iInp2[3]),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  switch_box_4x4 S1_L4(
    .out({temp3, temp2, temp1, iInp0[4]}),
    .in({1'b0, iout[3], 1'b0, Z[4]}) 
  );
  
  switch_box_4x4 S2_L4(
    .out({temp3, temp2, temp1, iInp1[4]}),
    .in({1'b0, in6, 1'b0, iout[3]})  
  );
  
  switch_box_4x4 S3_L4(
    .out({temp3, temp2, temp1, iInp2[4]}),
    .in({1'b0, in2, 1'b0, in11})  
  );
  
  logic_tile inst_4(
    .out(iout[4]),
    .clock(clk),
    .reset(rst),
    .in1(iInp0[4]),
    .in2(iInp1[4]),
    .in3(iInp2[4]),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  switch_box_4x4 S1_L5(
    .out({temp3, temp2, temp1, iInp0[5]}),
    .in({1'b0, iout[3], 1'b0, Z[5]}) 
  );
  
  switch_box_4x4 S2_L5(
    .out({temp3, temp2, temp1, iInp1[5]}),
    .in({1'b0, in6, 1'b0, iout[4]})  
  );
  
  switch_box_4x4 S3_L5(
    .out({temp3, temp2, temp1, iInp2[5]}),
    .in({1'b0, in2, 1'b0, in11})  
  );
  
  logic_tile inst_5(
    .out(iout[5]),
    .clock(clk),
    .reset(rst),
    .in1(iInp0[5]),
    .in2(iInp1[5]),
    .in3(iInp2[5]),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  switch_box_4x4 S1_L6(
    .out({temp3, temp2, temp1, iInp0[6]}),
    .in({1'b0, iout[5], 1'b0, Z[6]}) 
  );
  
  switch_box_4x4 S2_L6(
    .out({temp3, temp2, temp1, iInp1[6]}),
    .in({1'b0, in7, 1'b0, iout[5]})  
  );
  
  switch_box_4x4 S3_L6(
    .out({temp3, temp2, temp1, iInp2[6]}),
    .in({1'b0, in3, 1'b0, in11})  
  );
  
  logic_tile inst_6(
    .out(iout[6]),
    .clock(clk),
    .reset(rst),
    .in1(iInp0[6]),
    .in2(iInp1[6]),
    .in3(iInp2[6]),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  switch_box_4x4 S1_L7(
    .out({temp3, temp2, temp1, iInp0[7]}),
    .in({1'b0, iout[5], 1'b0, Z[7]}) 
  );
  
  switch_box_4x4 S2_L7(
    .out({temp3, temp2, temp1, iInp1[7]}),
    .in({1'b0, in7, 1'b0, iout[6]})  
  );
  
  switch_box_4x4 S3_L7(
    .out({temp3, temp2, temp1, iInp2[7]}),
    .in({1'b0, in3, 1'b0, in11})  
  );
  
  logic_tile inst_7(
    .out(iout[7]),
    .clock(clk),
    .reset(rst),
    .in1(iInp0[7]),
    .in2(iInp1[7]),
    .in3(iInp2[7]),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_Z0(
    .out(Z[0]),
    .clock(clk),
    .reset(rst),
    .in1(iout[0]),
    .in2(in0),
    .in3(iout[1]),
    .in4(in9),
    .in5(in10)
  );
  
  logic_tile inst_Z1(
    .out(Z[1]),
    .clock(clk),
    .reset(rst),
    .in1(iout[1]),
    .in2(in1),
    .in3(iout[2]),
    .in4(in9),
    .in5(in10)
  );
  
  logic_tile inst_Z2(
    .out(Z[2]),
    .clock(clk),
    .reset(rst),
    .in1(iout[2]),
    .in2(in2),
    .in3(iout[3]),
    .in4(in9),
    .in5(in10)
  );

  logic_tile inst_Z3(
    .out(Z[3]),
    .clock(clk),
    .reset(rst),
    .in1(iout[3]),
    .in2(in3),
    .in3(iout[4]),
    .in4(in9),
    .in5(in10)
  );
  
  logic_tile inst_Z4(
    .out(Z[4]),
    .clock(clk),
    .reset(rst),
    .in1(iout[4]),
    .in2(in4),
    .in3(iout[5]),
    .in4(in9),
    .in5(in10)
  );

  logic_tile inst_Z5(
    .out(Z[5]),
    .clock(clk),
    .reset(rst),
    .in1(iout[5]),
    .in2(in5),
    .in3(iout[6]),
    .in4(in9),
    .in5(in10)
  ); 
  
  logic_tile inst_Z6(
    .out(Z[6]),
    .clock(clk),
    .reset(rst),
    .in1(iout[6]),
    .in2(in6),
    .in3(iout[7]),
    .in4(in9),
    .in5(in10)
  );
  
  logic_tile inst_Z7(
    .out(Z[7]),
    .clock(clk),
    .reset(rst),
    .in1(iout[7]),
    .in2(in7),
    .in3(in8),
    .in4(in9),
    .in5(in10)
  );
  
  
  assign out0 = iout[0];
  
  switch_box_4x4 O1(
    .out({temp3, temp2, temp1, out1}),
    .in({1'b0, iout[2], iout[1], iout[1]}) 
  );
  
  switch_box_4x4 O2(
    .out({temp3, temp2, temp1, out2}),
    .in({1'b0, iout[4], iout[2], iout[2]}) 
  );
  
  switch_box_4x4 O3(
    .out({temp3, temp2, temp1, out3}),
    .in({1'b0, iout[6], 1'b0, iout[3]}) 
  );
  
  switch_box_4x4 O4(
    .out({temp3, temp2, temp1, out4}),
    .in({1'b0, iout[7], 1'b0, iout[4]}) 
  );
  
  assign out5 = iout[5];
  assign out6 = iout[6];
  assign out7 = iout[7];
  
endmodule