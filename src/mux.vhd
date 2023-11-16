library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;




entity mux is
    port (
        sel: in std_logic;
        d0: in std_logic_vector (word_len - 1 downto 0);
        d1: in std_logic_vector (word_len - 1 downto 0);
        s: out std_logic_vector (word_len - 1 downto 0)
    );
end mux;


architecture behavioral of mux is
begin

    multiplexer: process(sel, d0, d1)
    begin
        if sel = '0' then
            s <= d0;
        else
            s <= d1;
        end if;
    end process multiplexer;

end behavioral;