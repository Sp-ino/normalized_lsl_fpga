library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity postmul_resizer is
    port (
        i_data: in std_logic_vector (2*word_len - 1 downto 0);
        o_data: out std_logic_vector (word_len - 1 downto 0)
    );
end postmul_resizer;


architecture  behavioral of postmul_resizer is
begin

    o_data <= i_data(2*word_len - int_len - 2 downto frac_len);

end behavioral;
