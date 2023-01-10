///////////////////////////////////////////
// counter.sv
//
// Written: Ross Thompson
// Modified: 
//
// Purpose: basic up counter
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021-23 Harvey Mudd College & Oklahoma State University
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file 
// except in compliance with the License, or, at your option, the Apache License version 2.0. You 
// may obtain a copy of the License at
//
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the 
// License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
// either express or implied. See the License for the specific language governing permissions 
// and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////

`include "wally-config.vh"

module up_down_counter #(parameter integer WIDTH=32)
  (
   input logic [WIDTH-1:0]  CountIn,
   output logic [WIDTH-1:0] CountOut,
   input logic 		    Load,
   input logic 		    Enable,
   input logic 		    UpDown,   
   input logic 		    clk,
   input logic 		    reset);

  logic [WIDTH-1:0] NextCount;
  logic [WIDTH-1:0] CountP1;

  assign CountP1 = UpDown ? CountOut + 1'b1 : CountOut - 1'b1;
  assign NextCount = Load ? CountIn : CountP1;
  flopenr #(WIDTH) reg1(clk, reset, Enable | Load, NextCount, CountOut);
endmodule
  
   
