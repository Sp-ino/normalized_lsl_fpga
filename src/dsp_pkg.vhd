library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



package dsp_pkg is

    constant word_len: integer := 18;
    constant divider_out_len: integer := 40;
    constant frac_len: integer := 15;
    constant int_len: integer := word_len - frac_len - 1;

    constant update_latency: integer := 8;
    constant filter_len: integer := 3;
    constant one: std_logic_vector (word_len - 1 downto 0) := "001000000000000000";
    constant one_over_epsilon: std_logic_vector (word_len - 1 downto 0) := "001000000000000000";
    constant lambda: std_logic_vector (word_len - 1 downto 0) := "000111111111011111";

    
    type inout_array is array (filter_len - 1 downto 0) of std_logic_vector (word_len - 1 downto 0);
    type filter_array is array (filter_len downto 0) of std_logic_vector (word_len - 1 downto 0);
    type aux_shift_reg is array (filter_len - 1 downto 0) of std_logic_vector (word_len - 1 downto 0);
    type states is (idle, iterate);
    
    function shift(data: aux_shift_reg; shift_reg_input: std_logic_vector (word_len - 1 downto 0)) return aux_shift_reg;
    
end dsp_pkg;


package body dsp_pkg is

    function shift(data: aux_shift_reg; shift_reg_input: std_logic_vector (word_len - 1 downto 0)) return aux_shift_reg is
        variable shifted: aux_shift_reg;
    begin
        
        for i in 0 to filter_len - 2 loop
            shifted(i) := data(i+1);
        end loop;
        shifted(filter_len - 1) := shift_reg_input;

        return shifted;

    end shift;

end dsp_pkg;