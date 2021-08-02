// 
// Copyright 2021 OpenHW Group
// Copyright 2021 Silicon Labs
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// 
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may
// not use this file except in compliance with the License, or, at your option,
// the Apache License version 2.0. You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/SHL-2.1/
// 
// Unless required by applicable law or agreed to in writing, any work
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
// 

`ifndef __UVME_CV32E40X_VP_STATUS_FLAGS_SEQ_SV__
`define __UVME_CV32E40X_VP_STATUS_FLAGS_SEQ_SV__


/**
 * Sequence implementing the virtual status flags decoding 
 */
class uvme_cv32e40x_vp_status_flags_seq_c extends uvma_obi_memory_vp_base_seq_c;

   uvme_cv32e40x_cntxt_c cv32e40x_cntxt;

   `uvm_object_utils_begin(uvme_cv32e40x_vp_status_flags_seq_c)
   `uvm_object_utils_end
      
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cv32e40x_vp_status_flags_seq_c");
   
   /**
    * Implement sequence that will return a random number
    */
   extern virtual task vp_body(uvma_obi_memory_mon_trn_c mon_trn);

   /**
    * Implement a body to pre-validate some configuration before allowing parent class body to run
    */
   extern virtual task body();

endclass : uvme_cv32e40x_vp_status_flags_seq_c

function uvme_cv32e40x_vp_status_flags_seq_c::new(string name="uvme_cv32e40x_vp_status_flags_seq_c");
   
   super.new(name);
   
endfunction : new

task uvme_cv32e40x_vp_status_flags_seq_c::body();

   if (cv32e40x_cntxt == null) begin
      `uvm_fatal("E40XVPSTATUS", "Must initialize cv32e40x_cntxt in virtual peripheral")
   end

   super.body();

endtask : body

task uvme_cv32e40x_vp_status_flags_seq_c::vp_body(uvma_obi_memory_mon_trn_c mon_trn);

   uvma_obi_memory_slv_seq_item_c  slv_rsp;

   `uvm_create(slv_rsp)
   slv_rsp.err = 1'b0;
   //slv_rsp.gnt_latency    = 1;
   slv_rsp.access_latency = 1;
   //slv_rsp.hold_duration  = 1;
   slv_rsp.tail_length    = 1;   

   if (mon_trn.access_type == UVMA_OBI_MEMORY_ACCESS_WRITE) begin
      `uvm_info("VP_VSEQ", $sformatf("Call to virtual peripheral 'vp_status_flags':\n%s", mon_trn.sprint()), UVM_DEBUG)
      if (mon_trn.address == 32'h2000_0000) begin
         if (mon_trn.data == 'd123456789) begin
            `uvm_info("VP_VSEQ", "virtual peripheral: TEST PASSED", UVM_DEBUG)
            cv32e40x_cntxt.vp_status_vif.tests_passed = 1;
            cv32e40x_cntxt.vp_status_vif.exit_valid   = 1;
            cv32e40x_cntxt.vp_status_vif.exit_value   = 0;
         end
         else if (mon_trn.data == 'd1) begin
            cv32e40x_cntxt.vp_status_vif.tests_failed = 1;
            cv32e40x_cntxt.vp_status_vif.exit_valid   = 1;
            cv32e40x_cntxt.vp_status_vif.exit_value   = 1;
         end
      end
      else if (mon_trn.address == 32'h2000_0004) begin
         `uvm_info("VP_VSEQ", "virtual peripheral: END OF SIM", UVM_DEBUG)
         cv32e40x_cntxt.vp_status_vif.exit_valid = 1;
         cv32e40x_cntxt.vp_status_vif.exit_value = mon_trn.data;
      end      
   end
   else if (mon_trn.access_type == UVMA_OBI_MEMORY_ACCESS_READ) begin
      slv_rsp.rdata = 0;
   end

   slv_rsp.set_sequencer(p_sequencer);
   `uvm_send(slv_rsp)

endtask : vp_body

`endif // __UVME_OBI_MEMORY_VP_STATUS_FLAGS_SEQ_SV__