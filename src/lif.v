`default_nettype 

module lif(
    input wire [7:0] current,
    input wire       clk,
    input wire       reset_n,
    output reg [7:0] state,
    output wire      spike
);

wire [7:0] next_state;
reg  [7:0] threshhold;


always @(posedge clk) begin
    
    if (!reset_n) begin
        state <= 0;
        threshhold <= 200;
        end else begin
            state <= next_state;
end

end
// next state logic
assign next_state = current + (state >> 1);

//spiking logic
assign spike = (state >= threshhold);

endmodule