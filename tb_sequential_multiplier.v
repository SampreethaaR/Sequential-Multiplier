module tb_sequential_multiplier();
reg clk;

reg reset;
reg [3:0] A;
reg [3:0] B;
wire [7:0] product;
sequential_multiplier uut (
.clk(clk),
.reset(reset),
.A(A),
.B(B),
.product(product)
);
always begin
#5 clk = ~clk;
end
initial begin
clk = 0;
reset = 1;
A = 4'b0000;
B = 4'b0000;
#35 reset = 0;
A = 4'b0011;
B = 4'b0010;
#65;
A = 4'b0011;
B = 4'b0101;
#65;
$finish;
end
endmodule
