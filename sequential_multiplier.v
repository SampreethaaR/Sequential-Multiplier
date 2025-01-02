module sequential_multiplier (
input clk,
input reset,
input [3:0] A,
input [3:0] B,
output reg [7:0] product
);
reg [7:0] temporary_product;
reg [3:0] B_reg;
reg [3:0] counter;
reg busy;
always @(posedge clk or posedge reset) begin
if (reset) begin
temporary_product <= 8'b0;
product <= 8'b0;
B_reg <= 4'b0;
counter <= 4'b0;
busy <= 1'b0;
end else begin
if (!busy) begin
temporary_product <= 8'b0;
B_reg <= B;
counter <= 4'b0;
busy <= 1'b1;
end
else if (counter < B) begin
temporary_product <= temporary_product + A;
counter <= counter + 1;
end else begin
product <= temporary_product;

busy <= 1'b0;

end
end
end
endmodule
