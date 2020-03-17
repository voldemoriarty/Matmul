module de10nano (
	input clk, 
	input rst
);

	 soc_system u0 (
        .clk_clk       (clk),    //   clk.clk
        .reset_reset_n (rst)  	// reset.reset_n
    );

endmodule 