
#fpga pin

# "LCD"

#PACKAGE_PIN
set_property  -dict {PACKAGE_PIN T22  IOSTANDARD LVCMOS33} [get_ports ledb_trx1_o  ]
set_property  -dict {PACKAGE_PIN T21  IOSTANDARD LVCMOS33} [get_ports ledg_trx1_o  ]
set_property  -dict {PACKAGE_PIN U22  IOSTANDARD LVCMOS33} [get_ports ledr_trx1_o  ]
set_property  -dict {PACKAGE_PIN U21  IOSTANDARD LVCMOS33} [get_ports ledb_trx2_o  ]
set_property  -dict {PACKAGE_PIN V22  IOSTANDARD LVCMOS33} [get_ports ledg_trx2_o  ]
set_property  -dict {PACKAGE_PIN W22  IOSTANDARD LVCMOS33} [get_ports ledr_trx2_o  ]
#ad9361
set_property  -dict {PACKAGE_PIN F18  IOSTANDARD LVCMOS25} [get_ports  ad9361_spi_csn_o      ]
set_property  -dict {PACKAGE_PIN E18  IOSTANDARD LVCMOS25} [get_ports  ad9361_spi_clk_o      ]
set_property  -dict {PACKAGE_PIN E21  IOSTANDARD LVCMOS25} [get_ports  ad9361_spi_mosi_o     ]
set_property  -dict {PACKAGE_PIN D21  IOSTANDARD LVCMOS25} [get_ports  ad9361_spi_miso_i     ]
set_property  -dict {PACKAGE_PIN G15  IOSTANDARD LVCMOS25} [get_ports  ad9361_en_agc_o      ]
set_property  -dict {PACKAGE_PIN J20  IOSTANDARD LVCMOS25} [get_ports  ad9361_enable_o      ]
set_property  -dict {PACKAGE_PIN A16  IOSTANDARD LVCMOS25} [get_ports  ad9361_resetb_o      ]
set_property  -dict {PACKAGE_PIN K21  IOSTANDARD LVCMOS25} [get_ports  ad9361_txnrx_o       ]
set_property  -dict {PACKAGE_PIN G16  IOSTANDARD LVCMOS25} [get_ports  ad9361_sync_in_o     ]
set_property  -dict {PACKAGE_PIN L18  IOSTANDARD LVCMOS25} [get_ports  ad9361_clk_out_o     ]
set_property  -dict {PACKAGE_PIN A18  IOSTANDARD LVCMOS25} [get_ports  ad9361_ctrl_in_o[0]   ]
set_property  -dict {PACKAGE_PIN A19  IOSTANDARD LVCMOS25} [get_ports  ad9361_ctrl_in_o[1]   ]
set_property  -dict {PACKAGE_PIN D22  IOSTANDARD LVCMOS25} [get_ports  ad9361_ctrl_in_o[2]   ]
set_property  -dict {PACKAGE_PIN C22  IOSTANDARD LVCMOS25} [get_ports  ad9361_ctrl_in_o[3]   ]

set_property  -dict {PACKAGE_PIN J22  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_clk_out_n     ]
set_property  -dict {PACKAGE_PIN J21  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_clk_out_p     ]
set_property  -dict {PACKAGE_PIN N18  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_n[0] ]
set_property  -dict {PACKAGE_PIN N17  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_p[0] ]
set_property  -dict {PACKAGE_PIN P21  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_n[1] ]
set_property  -dict {PACKAGE_PIN P20  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_p[1] ]
set_property  -dict {PACKAGE_PIN M17  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_n[2] ]
set_property  -dict {PACKAGE_PIN L17  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_p[2] ]
set_property  -dict {PACKAGE_PIN T19  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_n[3] ]
set_property  -dict {PACKAGE_PIN R19  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_p[3] ]
set_property  -dict {PACKAGE_PIN K20  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_n[4] ]
set_property  -dict {PACKAGE_PIN K19  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_p[4] ]
set_property  -dict {PACKAGE_PIN J17  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_n[5] ]
set_property  -dict {PACKAGE_PIN J16  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_data_out_p[5] ]
set_property  -dict {PACKAGE_PIN R21  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_frame_out_n   ]
set_property  -dict {PACKAGE_PIN R20  IOSTANDARD LVDS_25 } [get_ports  ad9361_tx_frame_out_p   ]
set_property  -dict {PACKAGE_PIN M20  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_clk_in_n      ]
set_property  -dict {PACKAGE_PIN M19  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_clk_in_p      ]
set_property  -dict {PACKAGE_PIN P18  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_n[0]  ]
set_property  -dict {PACKAGE_PIN P17  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_p[0]  ]
set_property  -dict {PACKAGE_PIN P22  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_n[1]  ]
set_property  -dict {PACKAGE_PIN N22  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_p[1]  ]
set_property  -dict {PACKAGE_PIN M22  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_n[2]  ]
set_property  -dict {PACKAGE_PIN M21  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_p[2]  ]
set_property  -dict {PACKAGE_PIN K18  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_n[3]  ]
set_property  -dict {PACKAGE_PIN J18  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_p[3]  ]
set_property  -dict {PACKAGE_PIN L22  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_n[4]  ]
set_property  -dict {PACKAGE_PIN L21  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_p[4]  ]
set_property  -dict {PACKAGE_PIN T17  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_n[5]  ]
set_property  -dict {PACKAGE_PIN T16  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_data_in_p[5]  ]
set_property  -dict {PACKAGE_PIN N20  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_frame_in_n    ]
set_property  -dict {PACKAGE_PIN N19  IOSTANDARD LVDS_25  DIFF_TERM true} [get_ports  ad9361_rx_frame_in_p    ]



set_property BITSTREAM.GENERAL.COMPRESS true [current_design]


