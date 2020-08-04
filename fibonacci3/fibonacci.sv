module fibonacci (	input logic clk, reset_n,
							input logic [4:0] input_s,
							input logic begin_fibo,
							output logic [15:0] fibo_out,
							output logic done);
							
enum logic [1:0] {IDLE = 2'b00, COMPUTE = 2'b01, DONE = 2'b10} state;
logic [4:0] count;
logic [15:0] R0, R1;

always_ff @ (posedge clk, negedge reset_n)
	
	if(!reset_n) begin
		state <= IDLE;
		done <= 0;
		end
	
	else begin
	case(state)
		IDLE : 
				if(begin_fibo) begin
					count <= input_s;
					R0 = 0;
					R1 = 1;
					state <= COMPUTE;
					end
		COMPUTE:
				if(count >1) begin
					count <= count -1;
					R1 <= R0 + R1;
					R0 <= R1;
					end
				else begin
					state <= DONE;
					fibo_out <= R1;
				end
		DONE:
				state <= IDLE;
		
		endcase
	end
endmodule
		