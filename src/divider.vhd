library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity divider is
    port (
        i_a: in std_logic_vector (word_len - 1 downto 0);
        i_b: in std_logic_vector (word_len - 1 downto 0);
        i_ck: in std_logic;
        o_z: out std_logic_vector (2*word_len - 1 downto 0)
    );
end divider;


architecture behavioral of divider is

    signal dividend: integer;
    signal divisor: integer;
    signal result: integer;

begin

    dividend <= to_integer(signed(i_a));
    divisor <= to_integer(signed(i_b));
    o_z <= std_logic_vector(to_signed(result, 2*word_len));

    process(i_ck)
    begin
        if rising_edge(i_ck) then
            if divisor = 0 then
                result <= 0;
            else
                result <= dividend / divisor;
            end if;
        end if;
    end process;

end behavioral;
