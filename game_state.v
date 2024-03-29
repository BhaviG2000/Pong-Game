module game_state(
	input clk, clk_1ms, reset,
	input [3:0] p1_score, p2_score,
	output reg [1:0] game_state
	);
	
	reg [3:0] win = 4'b0101; //No. of goals to win
	reg [59:0] timer = 32'd0;
	
	always @ (posedge clk)
	begin
		if (!reset)
			game_state = 0;
		else 
		begin
			if ( p1_score == win)
				game_state = 2'b10;//p1 won
			else if ( p2_score == win)
				game_state = 2'b11;//p2 won
			else if ( timer <= 32'd59)
				game_state = 2'b01;//playing
			else if (timer == 32'd10)
				if (p1_score > p2_score)
					game_state = 2'b10;//p1 won
				else if (p1_score < p2_score)
					game_state = 2'b11;//p2 won
		end
	end

endmodule