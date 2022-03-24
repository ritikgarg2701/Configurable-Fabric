module TB();
  reg [32:0] memory1[0:2];
  reg [32:0] memory2[0:1];
  reg [32:0] memory3[0:2];
  
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;
  
  reg [7:0] I;
  wire [2:0] Y;
  
  reg clock, reset, Sh, Shl, L, SI;
  reg [7:0] D;
  wire [7:0] Q;
  
  FPGA ifpga1(
    .out4(Cout),
    .out3(Sum[3]),
    .out2(Sum[2]),
    .out1(Sum[1]),
    .out0(Sum[0]),
    .clk(clock),
    .rst(reset),
    .in11(1'b0),
    .in10(1'b0),
    .in9(1'b0),
    .in8(Cin),
    .in7(B[3]),
    .in6(B[2]),
    .in5(B[1]),
    .in4(B[0]),
    .in3(A[3]),
    .in2(A[2]),
    .in1(A[1]),
    .in0(A[0])
  );//Adder
  
  FPGA ifpga2(
    .out2(Y[2]),
    .out1(Y[1]),
    .out0(Y[0]),
    .clk(clock),
    .rst(reset),
    .in11(1'b0),
    .in10(1'b0),
    .in9(1'b0),
    .in8(1'b0),
    .in7(I[7]),
    .in6(I[6]),
    .in5(I[5]),
    .in4(I[4]),
    .in3(I[3]),
    .in2(I[2]),
    .in1(I[1]),
    .in0(I[0])
  );//Encoder
  
  FPGA ifpga3(
    .out7(Q[7]),
    .out6(Q[6]),
    .out5(Q[5]),
    .out4(Q[4]),
    .out3(Q[3]),
    .out2(Q[2]),
    .out1(Q[1]),
    .out0(Q[0]),
    .clk(clock),
    .rst(reset),
    .in11(Shl),
    .in10(Sh),
    .in9(L),
    .in8(SI),
    .in7(D[7]),
    .in6(D[6]),
    .in5(D[5]),
    .in4(D[4]),
    .in3(D[3]),
    .in2(D[2]),
    .in1(D[1]),
    .in0(D[0])
  );//Universal Shift Register
  
  initial 
    begin
      clock = 0; 
  	  #1000 $finish;
    end
  always #10 clock = ~clock;
  
  initial
    begin  
      $readmemh("configure_adder.mem", memory1);
      $readmemh("configure_encoder.mem", memory2);
      $readmemh("configure_register.mem", memory3);
    end
  
  initial
    begin
      ifpga1.inst_0.mem = memory1[0];
      ifpga1.inst_1.mem = memory1[1];
      ifpga1.inst_2.mem = memory1[0];
      ifpga1.inst_3.mem = memory1[1];
      ifpga1.inst_4.mem = memory1[0];
      ifpga1.inst_5.mem = memory1[1];
      ifpga1.inst_6.mem = memory1[0];
      ifpga1.inst_7.mem = memory1[1];
      
      ifpga1.S1_L0.configure = memory1[2][15:0];
      ifpga1.S2_L0.configure = memory1[2][15:0];
      ifpga1.S3_L0.configure = memory1[2][15:0];
      ifpga1.S4_L0.configure = memory1[2][15:0];
      
      ifpga1.S1_L1.configure = memory1[2][15:0];
      ifpga1.S2_L1.configure = memory1[2][15:0];
      ifpga1.S3_L1.configure = memory1[2][15:0];
      ifpga1.S4_L1.configure = memory1[2][15:0];
      
      ifpga1.S1_L2.configure = memory1[2][15:0];
      ifpga1.S2_L2.configure = memory1[2][15:0];
      ifpga1.S3_L2.configure = memory1[2][15:0];
      ifpga1.S4_L2.configure = memory1[2][15:0];
      
      ifpga1.S1_L3.configure = memory1[2][15:0];
      ifpga1.S2_L3.configure = memory1[2][15:0];
      ifpga1.S3_L3.configure = memory1[2][15:0];
      
      ifpga1.S1_L4.configure = memory1[2][15:0];
      ifpga1.S2_L4.configure = memory1[2][15:0];
      ifpga1.S3_L4.configure = memory1[2][15:0];
      
      ifpga1.S1_L5.configure = memory1[2][15:0];
      ifpga1.S2_L5.configure = memory1[2][15:0];
      ifpga1.S3_L5.configure = memory1[2][15:0];
      
      ifpga1.S1_L6.configure = memory1[2][15:0];
      ifpga1.S2_L6.configure = memory1[2][15:0];
      ifpga1.S3_L6.configure = memory1[2][15:0];
      
      ifpga1.S1_L7.configure = memory1[2][15:0];
      ifpga1.S2_L7.configure = memory1[2][15:0];
      ifpga1.S3_L7.configure = memory1[2][15:0];
      
      ifpga1.O1.configure = memory1[2][15:0];
      ifpga1.O2.configure = memory1[2][15:0];
      ifpga1.O3.configure = memory1[2][15:0];
      ifpga1.O4.configure = memory1[2][15:0];

    end
  
  initial
    begin
      ifpga2.inst_0.mem = memory2[0];
      ifpga2.inst_1.mem = memory2[0];
      ifpga2.inst_2.mem = memory2[0];

      ifpga2.S1_L0.configure = memory2[1][15:0];
      ifpga2.S2_L0.configure = memory2[1][15:0];
      ifpga2.S3_L0.configure = memory2[1][15:0];
      ifpga2.S4_L0.configure = memory2[1][15:0];
      
      ifpga2.S1_L1.configure = memory2[1][15:0];
      ifpga2.S2_L1.configure = memory2[1][15:0];
      ifpga2.S3_L1.configure = memory2[1][15:0];
      ifpga2.S4_L1.configure = memory2[1][15:0];
      
      ifpga2.S1_L2.configure = memory2[1][15:0];
      ifpga2.S2_L2.configure = memory2[1][15:0];
      ifpga2.S3_L2.configure = memory2[1][15:0];
      ifpga2.S4_L2.configure = memory2[1][15:0];
      
      ifpga2.S1_L3.configure = memory2[1][15:0];
      ifpga2.S2_L3.configure = memory2[1][15:0];
      ifpga2.S3_L3.configure = memory2[1][15:0];
      
      ifpga2.S1_L4.configure = memory2[1][15:0];
      ifpga2.S2_L4.configure = memory2[1][15:0];
      ifpga2.S3_L4.configure = memory2[1][15:0];
      
      ifpga2.S1_L5.configure = memory2[1][15:0];
      ifpga2.S2_L5.configure = memory2[1][15:0];
      ifpga2.S3_L5.configure = memory2[1][15:0];
      
      ifpga2.S1_L6.configure = memory2[1][15:0];
      ifpga2.S2_L6.configure = memory2[1][15:0];
      ifpga2.S3_L6.configure = memory2[1][15:0];
      
      ifpga2.S1_L7.configure = memory2[1][15:0];
      ifpga2.S2_L7.configure = memory2[1][15:0];
      ifpga2.S3_L7.configure = memory2[1][15:0];
      
      ifpga2.O1.configure = memory2[1][15:0];
      ifpga2.O2.configure = memory2[1][15:0];
      ifpga2.O3.configure = memory2[1][15:0];
      ifpga2.O4.configure = memory2[1][15:0];
    end
  
  initial
    begin
      ifpga3.inst_0.mem = memory3[0];
      ifpga3.inst_1.mem = memory3[0];
      ifpga3.inst_2.mem = memory3[0];
      ifpga3.inst_3.mem = memory3[0];
      ifpga3.inst_4.mem = memory3[0];
      ifpga3.inst_5.mem = memory3[0];
      ifpga3.inst_6.mem = memory3[0];
      ifpga3.inst_7.mem = memory3[0];
      
      ifpga3.inst_Z0.mem = memory3[1];
      ifpga3.inst_Z1.mem = memory3[1];
      ifpga3.inst_Z2.mem = memory3[1];
      ifpga3.inst_Z3.mem = memory3[1];
      ifpga3.inst_Z4.mem = memory3[1];
      ifpga3.inst_Z5.mem = memory3[1];
      ifpga3.inst_Z6.mem = memory3[1];
      ifpga3.inst_Z7.mem = memory3[1];

      ifpga3.S1_L0.configure = memory3[2][15:0];
      ifpga3.S2_L0.configure = memory3[2][15:0];
      ifpga3.S3_L0.configure = memory3[2][15:0];
      ifpga3.S4_L0.configure = memory3[2][15:0];
      
      ifpga3.S1_L1.configure = memory3[2][15:0];
      ifpga3.S2_L1.configure = memory3[2][15:0];
      ifpga3.S3_L1.configure = memory3[2][15:0];
      ifpga3.S4_L1.configure = memory3[2][15:0];
      
      ifpga3.S1_L2.configure = memory3[2][15:0];
      ifpga3.S2_L2.configure = memory3[2][15:0];
      ifpga3.S3_L2.configure = memory3[2][15:0];
      ifpga3.S4_L2.configure = memory3[2][15:0];
      
      ifpga3.S1_L3.configure = memory3[2][15:0];
      ifpga3.S2_L3.configure = memory3[2][15:0];
      ifpga3.S3_L3.configure = memory3[2][15:0];
      
      ifpga3.S1_L4.configure = memory3[2][15:0];
      ifpga3.S2_L4.configure = memory3[2][15:0];
      ifpga3.S3_L4.configure = memory3[2][15:0];
    
      ifpga3.S1_L5.configure = memory3[2][15:0];
      ifpga3.S2_L5.configure = memory3[2][15:0];
      ifpga3.S3_L5.configure = memory3[2][15:0];
      
      ifpga3.S1_L6.configure = memory3[2][15:0];
      ifpga3.S2_L6.configure = memory3[2][15:0];
      ifpga3.S3_L6.configure = memory3[2][15:0];
      
      ifpga3.S1_L7.configure = memory3[2][15:0];
      ifpga3.S2_L7.configure = memory3[2][15:0];
      ifpga3.S3_L7.configure = memory3[2][15:0];

      ifpga3.O1.configure = memory3[2][15:0];
      ifpga3.O2.configure = memory3[2][15:0];
      ifpga3.O3.configure = memory3[2][15:0];
      ifpga3.O4.configure = memory3[2][15:0];
    end
  
  initial
    begin
      A = 4'b1000;
      B = 4'b0100;
      Cin = 1'b0;
      #20
      $display("4-bit Adder");
      $display("%b %b", Sum, Cout);
      
      A = 4'b1111;
      B = 4'b0001;
      Cin = 1'b0;
      #20
      $display("%b %b", Sum, Cout);
      
      A = 4'b1111;
      B = 4'b0001;
      Cin = 1'b1;
      #20
      $display("%b %b", Sum, Cout);
      
      A = 4'b1100;
      B = 4'b0011;
      Cin = 1'b0;
      #20
      $display("%b %b", Sum, Cout);
      
      A = 4'b1001;
      B = 4'b0001;
      Cin = 1'b1;
      #20
      $display("%b %b", Sum, Cout);
      
      A = 4'b0010;
      B = 4'b0100;
      Cin = 1'b1;
      #20
      $display("%b %b", Sum, Cout);
      
      A = 4'b1110;
      B = 4'b0101;
      Cin = 1'b0;
      #20
      $display("%b %b", Sum, Cout);
      
      A = 4'b0010;
      B = 4'b0110;
      Cin = 1'b1;
      #20
      $display("%b %b", Sum, Cout);
      
      A = 4'b0111;
      B = 4'b0110;
      Cin = 1'b0;
      #20
      $display("%b %b", Sum, Cout);
 
      
      I = 8'b00000001;
      #20
      $display();
      $display("8:3 Encoder");
      $display("%b", Y);
      
      I = 8'b00000010;
      #20
      $display("%b", Y);
      
      I = 8'b00000100;
      #20
      $display("%b", Y);
      
      I = 8'b00001000;
      #20
      $display("%b", Y);
      
      I = 8'b00010000;
      #20
      $display("%b", Y);
      
      I = 8'b00100000;
      #20
      $display("%b", Y);
      
      I = 8'b01000000;
      #20
      $display("%b", Y);
      
      I = 8'b10000000;
      #20
      $display("%b", Y);
      
      
      reset = 1'b1;
      #20
      $display();
      $display("Universal 8-bit Shift Register");
      $display("%b", Q);
      
      reset = 1'b0;
      D = 8'b00010111;
      L = 1'b1;
      Sh = 1'b0;
      Shl = 1'b0;
	  SI = 1'b0;
      #20
      $display("%b", Q);
      
      L = 1'b0;
      Sh = 1'b1;
      Shl = 1'b0;
	  SI = 1'b1;
      #20
      $display("%b", Q);
      
      #20
      $display("%b", Q);
      
      #20
      $display("%b", Q);
      
      L = 1'b0;
      Sh = 1'b0;
      Shl = 1'b1;
      #20
      $display("%b", Q);
      
      #20
      $display("%b", Q);
      
      L = 1'b0;
      Sh = 1'b0;
      Shl = 1'b0;
      #20
      $display("%b", Q);
      
      D = 8'b11001001;
      L = 1'b1;
      Sh = 1'b0;
      Shl = 1'b0;
	  SI = 1'b0;
      #20
      $display("%b", Q);
      
      L = 1'b0;
      Sh = 1'b0;
      Shl = 1'b1;
      #20
      $display("%b", Q);
      
      #20
      $display("%b", Q);
      
      L = 1'b0;
      Sh = 1'b1;
      Shl = 1'b0;
	  SI = 1'b1;
      #20
      $display("%b", Q);
      
      #20
      $display("%b", Q);
      
      SI = 1'b0;
      #20
      $display("%b", Q);
      
      L = 1'b0;
      Sh = 1'b0;
      Shl = 1'b0;
      #20
      $display("%b", Q);
      $finish;
    end
  
  initial 
    begin
      $dumpfile("configurable_circuit.vcd");
      $dumpvars;
    end 
endmodule