//
// Generated by Bluespec Compiler, version 2018.10.beta1 (build e1df8052c, 2018-10-17)
//
//
//
//
// Ports:
// Name                         I/O  size props
// mv_read                        O    64
// mav_write                      O    64
// mv_sie_read                    O    64
// mav_sie_write                  O    64
// CLK                            I     1 clock
// RST_N                          I     1 reset
// mav_write_misa                 I    28
// mav_write_wordxl               I    64
// mav_sie_write_misa             I    28
// mav_sie_write_wordxl           I    64
// EN_reset                       I     1
// EN_mav_write                   I     1
// EN_mav_sie_write               I     1
//
// Combinational paths from inputs to outputs:
//   (mav_write_misa, mav_write_wordxl) -> mav_write
//   (mav_sie_write_misa, mav_sie_write_wordxl) -> mav_sie_write
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkCSR_MIE(CLK,
		 RST_N,

		 EN_reset,

		 mv_read,

		 mav_write_misa,
		 mav_write_wordxl,
		 EN_mav_write,
		 mav_write,

		 mv_sie_read,

		 mav_sie_write_misa,
		 mav_sie_write_wordxl,
		 EN_mav_sie_write,
		 mav_sie_write);
  input  CLK;
  input  RST_N;

  // action method reset
  input  EN_reset;

  // value method mv_read
  output [63 : 0] mv_read;

  // actionvalue method mav_write
  input  [27 : 0] mav_write_misa;
  input  [63 : 0] mav_write_wordxl;
  input  EN_mav_write;
  output [63 : 0] mav_write;

  // value method mv_sie_read
  output [63 : 0] mv_sie_read;

  // actionvalue method mav_sie_write
  input  [27 : 0] mav_sie_write_misa;
  input  [63 : 0] mav_sie_write_wordxl;
  input  EN_mav_sie_write;
  output [63 : 0] mav_sie_write;

  // signals for module outputs
  wire [63 : 0] mav_sie_write, mav_write, mv_read, mv_sie_read;

  // register rg_mie
  reg [11 : 0] rg_mie;
  reg [11 : 0] rg_mie$D_IN;
  wire rg_mie$EN;

  // rule scheduling signals
  wire CAN_FIRE_mav_sie_write,
       CAN_FIRE_mav_write,
       CAN_FIRE_reset,
       WILL_FIRE_mav_sie_write,
       WILL_FIRE_mav_write,
       WILL_FIRE_reset;

  // inputs to muxes for submodule ports
  wire [11 : 0] MUX_rg_mie$write_1__VAL_3;

  // remaining internal signals
  wire [11 : 0] mie__h92, x__h458, x__h883;
  wire seie__h123,
       seie__h544,
       ssie__h117,
       ssie__h538,
       stie__h120,
       stie__h541,
       ueie__h122,
       ueie__h543,
       usie__h116,
       usie__h537,
       utie__h119,
       utie__h540;

  // action method reset
  assign CAN_FIRE_reset = 1'd1 ;
  assign WILL_FIRE_reset = EN_reset ;

  // value method mv_read
  assign mv_read = { 52'd0, rg_mie } ;

  // actionvalue method mav_write
  assign mav_write = { 52'd0, mie__h92 } ;
  assign CAN_FIRE_mav_write = 1'd1 ;
  assign WILL_FIRE_mav_write = EN_mav_write ;

  // value method mv_sie_read
  assign mv_sie_read = { 52'd0, x__h458 } ;

  // actionvalue method mav_sie_write
  assign mav_sie_write = { 52'd0, x__h883 } ;
  assign CAN_FIRE_mav_sie_write = 1'd1 ;
  assign WILL_FIRE_mav_sie_write = EN_mav_sie_write ;

  // inputs to muxes for submodule ports
  assign MUX_rg_mie$write_1__VAL_3 =
	     { rg_mie[11],
	       1'b0,
	       seie__h544,
	       ueie__h543,
	       rg_mie[7],
	       1'b0,
	       stie__h541,
	       utie__h540,
	       rg_mie[3],
	       1'b0,
	       ssie__h538,
	       usie__h537 } ;

  // register rg_mie
  always@(EN_mav_write or
	  mie__h92 or
	  EN_reset or EN_mav_sie_write or MUX_rg_mie$write_1__VAL_3)
  case (1'b1)
    EN_mav_write: rg_mie$D_IN = mie__h92;
    EN_reset: rg_mie$D_IN = 12'd0;
    EN_mav_sie_write: rg_mie$D_IN = MUX_rg_mie$write_1__VAL_3;
    default: rg_mie$D_IN = 12'b101010101010 /* unspecified value */ ;
  endcase
  assign rg_mie$EN = EN_mav_write || EN_mav_sie_write || EN_reset ;

  // remaining internal signals
  assign mie__h92 =
	     { mav_write_wordxl[11],
	       1'b0,
	       seie__h123,
	       ueie__h122,
	       mav_write_wordxl[7],
	       1'b0,
	       stie__h120,
	       utie__h119,
	       mav_write_wordxl[3],
	       1'b0,
	       ssie__h117,
	       usie__h116 } ;
  assign seie__h123 = mav_write_misa[18] && mav_write_wordxl[9] ;
  assign seie__h544 = mav_sie_write_misa[18] && mav_sie_write_wordxl[9] ;
  assign ssie__h117 = mav_write_misa[18] && mav_write_wordxl[1] ;
  assign ssie__h538 = mav_sie_write_misa[18] && mav_sie_write_wordxl[1] ;
  assign stie__h120 = mav_write_misa[18] && mav_write_wordxl[5] ;
  assign stie__h541 = mav_sie_write_misa[18] && mav_sie_write_wordxl[5] ;
  assign ueie__h122 = mav_write_misa[13] && mav_write_wordxl[8] ;
  assign ueie__h543 = mav_sie_write_misa[13] && mav_sie_write_wordxl[8] ;
  assign usie__h116 = mav_write_misa[13] && mav_write_wordxl[0] ;
  assign usie__h537 = mav_sie_write_misa[13] && mav_sie_write_wordxl[0] ;
  assign utie__h119 = mav_write_misa[13] && mav_write_wordxl[4] ;
  assign utie__h540 = mav_sie_write_misa[13] && mav_sie_write_wordxl[4] ;
  assign x__h458 =
	     { 2'd0, rg_mie[9:8], 2'd0, rg_mie[5:4], 2'd0, rg_mie[1:0] } ;
  assign x__h883 =
	     { 2'd0,
	       seie__h544,
	       ueie__h543,
	       2'd0,
	       stie__h541,
	       utie__h540,
	       2'd0,
	       ssie__h538,
	       usie__h537 } ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_mie <= `BSV_ASSIGNMENT_DELAY 12'd0;
      end
    else
      begin
        if (rg_mie$EN) rg_mie <= `BSV_ASSIGNMENT_DELAY rg_mie$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_mie = 12'hAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkCSR_MIE
