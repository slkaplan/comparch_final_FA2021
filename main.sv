`default_nettype none


module main(
  // On board signals
  clk, buttons, in1, in2, rgb, pmod, leds, out
);
parameter SYS_CLK_HZ = 12_000_000.0; // aka ticks per second
parameter SYS_CLK_PERIOD_NS = (1_000_000_000.0/SYS_CLK_HZ);
parameter CLK_HZ = 5*SYS_CLK_HZ; // aka ticks per second
parameter CLK_PERIOD_NS = (1_000_000_000.0/CLK_HZ); // Approximation.
parameter PWM_PERIOD_US = 100; 
parameter PWM_WIDTH = $clog2(320);
parameter PERIOD_MS_FADE = 100;
parameter PWM_TICKS = CLK_HZ*PWM_PERIOD_US/1_000_000; //1kHz modulation frequency. // Always multiply before dividing, it avoids truncation.



//Module I/O and parameters
input logic clk;
input wire [1:0] buttons;
logic rst; always_comb rst = buttons[0]; // Use button 0 as a reset signal.
output logic in1;
output logic in2;
output logic [2:0] rgb;
output logic [7:0] pmod;  always_comb pmod = {6'b0, clk}; // You can use the pmod port for debugging!
output logic [1:0] leds;
output logic out; 

// LED PWM logic.
logic [PWM_WIDTH-1:0] motor_pwm;
always @(posedge clk) begin
  if(rst) begin
    motor_pwm <= 0;
  end 
  else begin
      motor_pwm <= 9'd100;
      in1 <= 1; 
      in2 <= 0;
  end
end



pwm #(.N(PWM_WIDTH)) PWM_MOTOR (
  .clk(clk), .rst(rst), .ena(1'b1), .step(1'b1), .duty(motor_pwm),
  .out(out)
);


endmodule

`default_nettype wire // reengages default behaviour, needed when using 
                      // other designs that expect it.