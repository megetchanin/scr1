Вариант 13.
Задание: исследовать инструкцию slt, в качестве отладочной информации вывести PC.

На скринах продемонстрирован вывод консоли при запуске теста (рисунок 1) и первое появление кода инструкции в rdata. 

Последовательность действий была следующая:

1) Был добавлен собственный тестбенч /src/tb/scr1_my_tb.sv. Был отредактирован тестбенч /src/tb/scr1_top_tb_ahb.sv - в него был добавлен модуль собственного тестбенча. Код собственного тестбенча:

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

По аналогии с предыдущей лабораторной были удалены ненужные тесты, был оставлен только тест slt.S

Перевод числа 0020A1B3 в двоичную систему счисления:
1000 001(01 0)000 11(011 0011) - в первых скобках три бита с 14 по 12, во вторых скобках семь бит с 6 по 0. Они соответствуют инструкции slt. 
