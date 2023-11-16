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
            chib_m : in std_logic_vector ( 17 downto 0 );
            ck : in std_logic;
            eb_m : in std_logic_vector ( 17 downto 0 );
            gam_m : in std_logic_vector ( 17 downto 0 );
            gam_m1 : out std_logic_vector ( 17 downto 0 );
            beta_m : out std_logic_vector ( 17 downto 0 )
        );
    end component;

    signal ck: std_logic;
    signal chi: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gam: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal res_beta: std_logic_vector (word_len - 1 downto 0);
    signal res_gam: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant a_val: std_logic_vector := b"001010101010111011";
    constant b_val: std_logic_vector := b"000110000000001011";

begin

    dut: update_gamma
    port map (
        chib_m => chi,
        eb_m => eb,
        gam_m => gam,
        ck => ck,
        beta_m => res_beta,
        gam_m1 => res_gam 
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
        eb <= b_val;
        gam <= b_val;
        chi <= a_val;
        
        wait for 4*tck;

        wait for 20*tck;

        ------------------------------VERIFICATION------------------------------------------
        ------------------------------------------------------------------------------------
        --                                                                                --
        --      The decimal values of the results should be res_beta = 0.75091552734375   --
        --      and res_gam = 0.32757568359375, which in 18 bit fixed point with fraction --
        --      length of 15 correspond to x"0601e" and x"029ee", respectively.           --
        --                                                                                --
        ------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------

    end process test_sig;


end behavioral;