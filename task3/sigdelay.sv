module sigdelay #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    input logic                 clk,    
    input logic                 rst,    //counter
    input logic                 en,     //counter
    input logic                 wr,
    input logic                 rd,
    input logic [D_WIDTH-1:0]   mic_signal,
    input logic [D_WIDTH-1:0]   offset, //offset into ram     
    output logic [D_WIDTH-1:0]  delayed_signal //dout for ram
);

    logic [A_WIDTH-1:0]         address; //interconnect wire for counter

counter addrCounter (
    .clk(clk),
    .rst (rst),
    .en (en),
    .count (address)
);

ram sigRam(
    .clk (clk),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr (address),
    .offset (offset),
    .din (mic_signal),
    .dout (delayed_signal)
);

endmodule
