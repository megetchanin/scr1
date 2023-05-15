module scr1_my_tb();
	always_ff @(posedge scr1_top_tb_ahb.i_top.i_imem_ahb.clk) 
	begin
	if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp == 2'b01) 
		begin
		// valid data from ahb router
		if (
		(scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[6 : 0] ==
		7'b0110011) &
		(scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[14 : 12] ==
		3'b010)
			) begin
			// detect and command
			$display("%h\n", scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.curr_pc);
			end
		end
	end
endmodule
