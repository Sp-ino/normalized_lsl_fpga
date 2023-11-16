library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_feedforward is
        port (
            ck: in std_logic;
            v1_m: in std_logic_vector (word_len - 1 downto 0);
            eb_m: in std_logic_vector (word_len - 1 downto 0);
            e_m: in std_logic_vector (word_len - 1 downto 0);
            beta_m: in std_logic_vector (word_len - 1 downto 0);
            e_m1: out std_logic_vector (word_len - 1 downto 0);
            v_m: out  std_logic_vector (word_len - 1 downto 0)
        );
    end component;

    signal ck: std_logic;
    signal v: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal e: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal beta: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal e_res: std_logic_vector (word_len - 1 downto 0);
    signal v_res: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant a_val: std_logic_vector := b"001010101010111011";
    constant b_val: std_logic_vector := b"000110000000001011";
    constant c_val: std_logic_vector := b"000101010100010111";
    constant d_val: std_logic_vector := b"000111111100010111";

begin

    dut: update_feedforward
    port map (
        ck => ck,
        v1_m => v,
        eb_m => eb,
        e_m => e,
        beta_m => beta,
        e_m1 => e_res,
        v_m => v_res
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
        v <= a_val;
        eb <= b_val;
        e <= c_val;
        beta <= d_val;
        
        wait for 20*tck;

        ------------------------------VERIFICATION------------------------------------------
        ------------------------------------------------------------------------------------
        --                                                                                --
        --      The decimal values of the results should be v_res = 1.00015258789062      --
        --      and e_res = -0.3360595703125, which in 18 bit fixed point with fraction   --
        --      length of 15 correspond to x"3d4fc" and x"08005", respectively.           --
        --                                                                                --
        ------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------

    end process test_sig;


end behavioral;