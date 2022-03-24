module TB();
  reg [32:0] memory[0:1];
  reg clock, reset, rSh, rShl, rL, rSI;
  reg [7:0] rD;
  wire [7:0] wQ;
  
  FPGA ifpga(
    .Q(wQ),
    .clk(clock),
    .rst(reset),
    .Sh(rSh),
    .Shl(rShl),
    .L(rL),
    .SI(rSI),
    .D(rD) 
  );  
  
  initial clock = 0; 
  always #10 clock = ~clock;
  
  initial
    begin  
      $readmemh("configure.mem", memory);
    end
  
  initial
    begin
      ifpga.inst_0.mem = memory[0];
  	  ifpga.inst_1.mem = memory[0];
  	  ifpga.inst_2.mem= memory[0];
      ifpga.inst_3.mem = memory[0];
      ifpga.inst_4.mem = memory[0];
      ifpga.inst_5.mem = memory[0];
      ifpga.inst_6.mem = memory[0];
      ifpga.inst_7.mem = memory[0];
     
      ifpga.inst_Z0.mem = memory[1];
      ifpga.inst_Z1.mem = memory[1];
      ifpga.inst_Z2.mem = memory[1];
      ifpga.inst_Z3.mem = memory[1];
      ifpga.inst_Z4.mem = memory[1];
      ifpga.inst_Z5.mem = memory[1];
      ifpga.inst_Z6.mem = memory[1];
      ifpga.inst_Z7.mem = memory[1];
    end
  
  initial
    begin     
      reset = 1'b1;
      #20
      $display("%b", wQ);
      
      reset = 1'b0;
      rD = 8'b00010111;
      rL = 1'b1;
      rSh = 1'b0;
      rShl = 1'b0;
	  rSI = 1'b0;
      #20
      $display("%b", wQ);
      
      rL = 1'b0;
      rSh = 1'b1;
      rShl = 1'b0;
	  rSI = 1'b1;
      #20
      $display("%b", wQ);
      
      #20
      $display("%b", wQ);
      
      #20
      $display("%b", wQ);
      
      rL = 1'b0;
      rSh = 1'b0;
      rShl = 1'b1;
      #20
      $display("%b", wQ);
      
      #20
      $display("%b", wQ);
      
      rL = 1'b0;
      rSh = 1'b0;
      rShl = 1'b0;
      #20
      $display("%b", wQ);
      
      rD = 8'b11001001;
      rL = 1'b1;
      rSh = 1'b0;
      rShl = 1'b0;
	  rSI = 1'b0;
      #20
      $display("%b", wQ);
      
      rL = 1'b0;
      rSh = 1'b0;
      rShl = 1'b1;
      #20
      $display("%b", wQ);
      
      #20
      $display("%b", wQ);
      
      rL = 1'b0;
      rSh = 1'b1;
      rShl = 1'b0;
	  rSI = 1'b1;
      #20
      $display("%b", wQ);
      
      #20
      $display("%b", wQ);
      
      rL = 1'b0;
      rSh = 1'b0;
      rShl = 1'b0;
      #20
      $display("%b", wQ);
      $finish;
    end
  
  initial 
    begin
      $dumpfile("configurable_circuit.vcd");
      $dumpvars;
    end 
    
endmodule