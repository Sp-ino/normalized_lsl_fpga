library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity scalar_delay is
    generic ( delay_len: integer := 1 );
    port (
        i_ck: in std_logic;
        -- i_rst: in std_logic;
        i_data: in std_logic;
        o_data: out std_logic
    );
end scalar_delay;


architecture behavioral of scalar_delay is

    type data_vec is array (delay_len - 1 downto 0) of std_logic;
    signal internal_data: data_vec := (others => '0');

begin

    o_data <= internal_data(0);

    regs: process(i_ck)
    begin
        if rising_edge(i_ck) then
            for i in 0 to delay_len - 1 loop
                if i = delay_len - 1 then
                    internal_data(i) <= i_data;
                else
                    internal_data(i) <= internal_data(i+1);
                end if;
            end loop;
        end if;
    end process regs;

end behavioral;