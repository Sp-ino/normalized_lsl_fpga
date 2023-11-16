library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component delay is
        generic (
            delay_len: integer
        );
        port (
            i_ck: in std_logic;
            i_data: in std_logic_vector (word_len - 1 downto 0);
            o_data: out std_logic_vector (word_len - 1 downto 0)    
        );
    end component;

    constant tck: time := 10ns;
    signal ck: std_logic;
    signal i_data: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal o_data: std_logic_vector (word_len - 1 downto 0);

begin

    dut: delay
    generic map (
        delay_len => 2
    )
    port map (
        i_ck => ck,
        i_data => i_data,
        o_data => o_data
    );

    ck_gen: process
    begin

        ck <= '1';
        wait for tck/2;
        ck <= '0';
        wait for tck/2;

    end process ck_gen;


    test_sig: process
    begin

        wait for tck/2;
        i_data <= "100000000000000001";
        
        wait for 5*tck;
        i_data <= "111100000000000000";

        wait for 5*tck;

    end process test_sig;


end behavioral;
