library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity normalize is
    port (
        i_data: in std_logic_vector (word_len*2 - 1 downto 0);
        o_data: out std_logic_vector (word_len - 1 downto 0)
    );
end normalize;


architecture  behavioral of normalize is
    constant right_shift_amount: integer := 5; 
begin

    o_data(word_len - 1) <= i_data(2*word_len - 1);
    o_data(word_len - 2) <= i_data(2*word_len - 1);
    o_data(word_len - 3 downto 0) <= i_data(2*word_len - 1 downto frac_len + right_shift_amount);

end behavioral;
