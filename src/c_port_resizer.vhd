library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity c_port_resizer is
    port (
        i_data: in std_logic_vector (word_len - 1 downto 0);
        o_data: out std_logic_vector (2*word_len - 1 downto 0)
    );
end c_port_resizer;


architecture  behavioral of c_port_resizer is
    
    constant msb_position: integer := 2*word_len - int_len - 2;
    constant lsb_position: integer := frac_len;

begin

    process(i_data)
    begin
        o_data(msb_position downto frac_len) <= i_data;
        for i in 2*word_len - 1 downto msb_position + 1 loop
            o_data(i) <= i_data(word_len - 1);
        end loop;
        o_data(lsb_position - 1 downto 0) <= (others => '0');
    end process; 

end behavioral;
