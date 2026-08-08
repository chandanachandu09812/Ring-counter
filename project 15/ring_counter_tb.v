`timescale 1ns/1ps

module ring_counter_tb;

reg clk;
reg reset;
wire [3:0] q;

ring_counter uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    // Generate waveform
    $dumpfile("ring_counter.vcd");
    $dumpvars(0, ring_counter_tb);

    $monitor("Time=%0t | Reset=%b | Q=%b",
             $time, reset, q);

    clk = 1'b0;
    reset = 1'b1;

    // Apply reset
    #10;
    reset = 1'b0;

    // Allow counter to run
    #50;

    $finish;
end

endmodule