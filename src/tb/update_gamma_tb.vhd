library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_gamma is
        port (
            ck : in std_logic;
            beta_m : in std_logic_vector ( 17 downto 0 );
            geb_m : in std_logic_vector ( 17 downto 0 );
            gam_m : in std_logic_vector ( 17 downto 0 );
            gam_m1 : out std_logic_vector ( 17 downto 0 )
        );
    end component;

    signal ck: std_logic;
    signal beta: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal geb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gam: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gam_out: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant geb_val: std_logic_vector := b"001010101010111011";
    constant beta_val: std_logic_vector := b"000110000000001011";
    constant gam_val: std_logic_vector := b"000110000000001011";
    
    constant normalization: signed := to_signed(1024, 18);

    constant betageb: signed := signed(geb_val)*signed(beta_val)*normalization;
    constant gam_result: std_logic_vector := std_logic_vector(signed(gam_val) - betageb(47 downto 30));

begin

    dut: update_gamma
    port map (
        ck => ck,
        beta_m => beta,
        geb_m => geb,
        gam_m => gam,
        gam_m1 => gam_out 
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

        wait for 2*tck;
        geb <= geb_val;
        beta <= beta_val;
        gam <= gam_val;
        
        wait for tck;

        assert gam_out = gam_result report "Incorrect result: test failed" severity error;

    end process test_sig;


end behavioral;