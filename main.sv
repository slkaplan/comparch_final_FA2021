`default_nettype none


module main(
  // On board signals
  sysclk, buttons, motor, rgb, pmod
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
input wire sysclk;
wire clk;
input wire [1:0] buttons;
logic rst; always_comb rst = buttons[0]; // Use button 0 as a reset signal.
output logic motor;
output logic [2:0] rgb;
output logic [7:0] pmod;  always_comb pmod = {6'b0, sysclk, clk}; // You can use the pmod port for debugging!


// LED PWM logic.
logic [PWM_WIDTH-1:0] motor_pwm;
always @(posedge clk) begin
  if(rst) begin
    motor_pwm <= 0;
  end else begin
    if(1==1) begin
      motor_pwm <= 9'b001000000;
      
    end
    else begin
      
    end
  end
end



pwm #(.N(PWM_WIDTH)) PWM_MOTOR (
  .clk(clk), .rst(rst), .ena(1'b1), .step(1'b1), .duty(motor_pwm),
  .out(leds[0])
);


endmodule

`default_nettype wire // reengages default behaviour, needed when using 
                      // other designs that expect it.