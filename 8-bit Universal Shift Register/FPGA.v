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

module FPGA(Q, clk, rst, Sh, Shl, L, SI, D);
  input clk, rst, Sh, Shl, L, SI;
  input [7:0] D;
  output [7:0] Q;
  wire [7:0] Z;

  
  logic_tile inst_0(
    .out(Q[0]),
    .clock(clk),
    .reset(rst),
    .in1(Z[0]),
    .in2(1'b0),
    .in3(Shl),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_1(
    .out(Q[1]),
    .clock(clk),
    .reset(rst),
    .in1(Z[1]),
    .in2(Q[0]),
    .in3(Shl),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_2(
    .out(Q[2]),
    .clock(clk),
    .reset(rst),
    .in1(Z[2]),
    .in2(Q[1]),
    .in3(Shl),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_3(
    .out(Q[3]),
    .clock(clk),
    .reset(rst),
    .in1(Z[3]),
    .in2(Q[2]),
    .in3(Shl),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_4(
    .out(Q[4]),
    .clock(clk),
    .reset(rst),
    .in1(Z[4]),
    .in2(Q[3]),
    .in3(Shl),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_5(
    .out(Q[5]),
    .clock(clk),
    .reset(rst),
    .in1(Z[5]),
    .in2(Q[4]),
    .in3(Shl),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_6(
    .out(Q[6]),
    .clock(clk),
    .reset(rst),
    .in1(Z[6]),
    .in2(Q[5]),
    .in3(Shl),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_7(
    .out(Q[7]),
    .clock(clk),
    .reset(rst),
    .in1(Z[7]),
    .in2(Q[6]),
    .in3(Shl),
    .in4(1'b0),
    .in5(1'b0)
  );
  
  logic_tile inst_Z0(
    .out(Z[0]),
    .clock(clk),
    .reset(rst),
    .in1(Q[0]),
    .in2(D[0]),
    .in3(Q[1]),
    .in4(L),
    .in5(Sh)
  );
  
  logic_tile inst_Z1(
    .out(Z[1]),
    .clock(clk),
    .reset(rst),
    .in1(Q[1]),
    .in2(D[1]),
    .in3(Q[2]),
    .in4(L),
    .in5(Sh)
  );
  
  logic_tile inst_Z2(
    .out(Z[2]),
    .clock(clk),
    .reset(rst),
    .in1(Q[2]),
    .in2(D[2]),
    .in3(Q[3]),
    .in4(L),
    .in5(Sh)
  );
  
  logic_tile inst_Z3(
    .out(Z[3]),
    .clock(clk),
    .reset(rst),
    .in1(Q[3]),
    .in2(D[3]),
    .in3(Q[4]),
    .in4(L),
    .in5(Sh)
  );
  
  logic_tile inst_Z4(
    .out(Z[4]),
    .clock(clk),
    .reset(rst),
    .in1(Q[4]),
    .in2(D[4]),
    .in3(Q[5]),
    .in4(L),
    .in5(Sh)
  );
  
  logic_tile inst_Z5(
    .out(Z[5]),
    .clock(clk),
    .reset(rst),
    .in1(Q[5]),
    .in2(D[5]),
    .in3(Q[6]),
    .in4(L),
    .in5(Sh)
  );
  
  logic_tile inst_Z6(
    .out(Z[6]),
    .clock(clk),
    .reset(rst),
    .in1(Q[6]),
    .in2(D[6]),
    .in3(Q[7]),
    .in4(L),
    .in5(Sh)
  );
  
  logic_tile inst_Z7(
    .out(Z[7]),
    .clock(clk),
    .reset(rst),
    .in1(Q[7]),
    .in2(D[7]),
    .in3(SI),
    .in4(L),
    .in5(Sh)
  );  
endmodule