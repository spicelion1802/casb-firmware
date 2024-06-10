// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Jun 10 12:21:27 2024
// Host        : DESKTOP-L7BEB7J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_util_ds_buf_1_0_sim_netlist.v
// Design      : design_1_util_ds_buf_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_util_ds_buf_1_0,util_ds_buf,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "util_ds_buf,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (OBUF_IN,
    OBUF_DS_P,
    OBUF_DS_N);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 OBUF_IN CLK" *) input [0:0]OBUF_IN;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 OBUF_DS_P CLK" *) output [0:0]OBUF_DS_P;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 OBUF_DS_N CLK" *) output [0:0]OBUF_DS_N;

  (* SLEW = "SLOW" *) wire [0:0]OBUF_DS_N;
  (* SLEW = "SLOW" *) wire [0:0]OBUF_DS_P;
  (* SLEW = "SLOW" *) wire [0:0]OBUF_IN;
  wire [0:0]NLW_U0_BUFGCE_O_UNCONNECTED;
  wire [0:0]NLW_U0_BUFG_GT_O_UNCONNECTED;
  wire [0:0]NLW_U0_BUFG_O_UNCONNECTED;
  wire [0:0]NLW_U0_BUFHCE_O_UNCONNECTED;
  wire [0:0]NLW_U0_BUFH_O_UNCONNECTED;
  wire [0:0]NLW_U0_IBUF_DS_ODIV2_UNCONNECTED;
  wire [0:0]NLW_U0_IBUF_OUT_UNCONNECTED;
  wire [0:0]NLW_U0_IOBUF_DS_N_UNCONNECTED;
  wire [0:0]NLW_U0_IOBUF_DS_P_UNCONNECTED;
  wire [0:0]NLW_U0_IOBUF_IO_O_UNCONNECTED;

  (* C_BUF_TYPE = "OBUFDS" *) 
  (* C_SIZE = "1" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_ds_buf U0
       (.BUFGCE_CE(1'b0),
        .BUFGCE_I(1'b0),
        .BUFGCE_O(NLW_U0_BUFGCE_O_UNCONNECTED[0]),
        .BUFG_GT_CE(1'b0),
        .BUFG_GT_CEMASK(1'b0),
        .BUFG_GT_CLR(1'b0),
        .BUFG_GT_CLRMASK(1'b0),
        .BUFG_GT_DIV({1'b0,1'b0,1'b0}),
        .BUFG_GT_I(1'b0),
        .BUFG_GT_O(NLW_U0_BUFG_GT_O_UNCONNECTED[0]),
        .BUFG_I(1'b0),
        .BUFG_O(NLW_U0_BUFG_O_UNCONNECTED[0]),
        .BUFHCE_CE(1'b0),
        .BUFHCE_I(1'b0),
        .BUFHCE_O(NLW_U0_BUFHCE_O_UNCONNECTED[0]),
        .BUFH_I(1'b0),
        .BUFH_O(NLW_U0_BUFH_O_UNCONNECTED[0]),
        .IBUF_DS_N(1'b0),
        .IBUF_DS_ODIV2(NLW_U0_IBUF_DS_ODIV2_UNCONNECTED[0]),
        .IBUF_DS_P(1'b0),
        .IBUF_OUT(NLW_U0_IBUF_OUT_UNCONNECTED[0]),
        .IOBUF_DS_N(NLW_U0_IOBUF_DS_N_UNCONNECTED[0]),
        .IOBUF_DS_P(NLW_U0_IOBUF_DS_P_UNCONNECTED[0]),
        .IOBUF_IO_I(1'b0),
        .IOBUF_IO_O(NLW_U0_IOBUF_IO_O_UNCONNECTED[0]),
        .IOBUF_IO_T(1'b0),
        .OBUF_DS_N(OBUF_DS_N),
        .OBUF_DS_P(OBUF_DS_P),
        .OBUF_IN(OBUF_IN));
endmodule

(* C_BUF_TYPE = "OBUFDS" *) (* C_SIZE = "1" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_util_ds_buf
   (IBUF_DS_P,
    IBUF_DS_N,
    IBUF_OUT,
    IBUF_DS_ODIV2,
    OBUF_IN,
    OBUF_DS_P,
    OBUF_DS_N,
    IOBUF_DS_P,
    IOBUF_DS_N,
    IOBUF_IO_T,
    IOBUF_IO_I,
    IOBUF_IO_O,
    BUFG_I,
    BUFG_O,
    BUFGCE_I,
    BUFGCE_CE,
    BUFGCE_O,
    BUFH_I,
    BUFH_O,
    BUFHCE_I,
    BUFHCE_CE,
    BUFHCE_O,
    BUFG_GT_I,
    BUFG_GT_CE,
    BUFG_GT_CEMASK,
    BUFG_GT_CLR,
    BUFG_GT_CLRMASK,
    BUFG_GT_DIV,
    BUFG_GT_O);
  input [0:0]IBUF_DS_P;
  input [0:0]IBUF_DS_N;
  output [0:0]IBUF_OUT;
  output [0:0]IBUF_DS_ODIV2;
  input [0:0]OBUF_IN;
  output [0:0]OBUF_DS_P;
  output [0:0]OBUF_DS_N;
  inout [0:0]IOBUF_DS_P;
  inout [0:0]IOBUF_DS_N;
  input [0:0]IOBUF_IO_T;
  input [0:0]IOBUF_IO_I;
  output [0:0]IOBUF_IO_O;
  input [0:0]BUFG_I;
  output [0:0]BUFG_O;
  input [0:0]BUFGCE_I;
  input [0:0]BUFGCE_CE;
  output [0:0]BUFGCE_O;
  input [0:0]BUFH_I;
  output [0:0]BUFH_O;
  input [0:0]BUFHCE_I;
  input [0:0]BUFHCE_CE;
  output [0:0]BUFHCE_O;
  input [0:0]BUFG_GT_I;
  input [0:0]BUFG_GT_CE;
  input [0:0]BUFG_GT_CEMASK;
  input [0:0]BUFG_GT_CLR;
  input [0:0]BUFG_GT_CLRMASK;
  input [2:0]BUFG_GT_DIV;
  output [0:0]BUFG_GT_O;

  wire \<const0> ;
  wire [0:0]OBUF_DS_N;
  wire [0:0]OBUF_DS_P;
  wire [0:0]OBUF_IN;

  assign BUFGCE_O[0] = IOBUF_DS_P[0];
  assign BUFG_GT_O[0] = IOBUF_DS_P[0];
  assign BUFG_O[0] = IOBUF_DS_P[0];
  assign BUFHCE_O[0] = IOBUF_DS_P[0];
  assign BUFH_O[0] = IOBUF_DS_P[0];
  assign IBUF_DS_ODIV2[0] = IOBUF_DS_P[0];
  assign IBUF_OUT[0] = IOBUF_DS_P[0];
  assign IOBUF_IO_O[0] = IOBUF_DS_P[0];
  xVIA IOBUF_DS_N_0via (IOBUF_DS_N[0], IOBUF_DS_P[0]);
  GND GND
       (.G(IOBUF_DS_P[0]));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \USE_OBUFDS.GEN_OBUFDS[0].OBUFDS_I 
       (.I(OBUF_IN),
        .O(OBUF_DS_P),
        .OB(OBUF_DS_N));
endmodule
module xVIA(.a(w),.b(w));
inout w;
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
