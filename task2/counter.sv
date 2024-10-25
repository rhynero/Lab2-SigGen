module counter #( //file name and module name must be the same
    parameter WIDTH = 8
) (
    //interface signals
    input  logic                clk,   //clock
    input  logic                rst,   //reset
    input  logic                en,    //counter enable
    input  logic [WIDTH-1:0]    incr,  //counter increment
    output logic [WIDTH-1:0]    count  //count output

);

  always_ff @ (posedge clk) 
    if (rst) count <= {WIDTH{1'b0}};
    else if (en) count <= count + {incr}; //count increments

    //WIDTH-1{1'b0} tells you to replicate the value in curly brackets by WIDTH-1 times
    //so 1'b0 = 0, => WIDTH - 1 = 7 => 7 zeroes => 0b000,0000
    //and then concatenate the 'en' bit to either increment or stay the same.  

endmodule
