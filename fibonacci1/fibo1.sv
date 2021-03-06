module fibo1 (	input logic clk, reset_n,
					input logic [4:0] input_s,
					input logic begin_fibo,
					output logic [15:0] fibo_out,
					output logic done);
				
function logic [15:0] fibo (input [4:0] n);
logic [15:0] F [0:31];

begin
	F[0] = 0;
	F[1] = 1;
	
	for(int i=2; i<32; i++) begin
		F[i] = F[i-1] + F[i-2];
	end
	
	fibo = F[n];
	end
endfunction

assign done = 1;
assign fibo_out = fibo(input_s);
endmodule
