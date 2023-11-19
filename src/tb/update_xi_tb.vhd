library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_chi is
        port (
            ck : in std_logic;
            Kb_m : in std_logic_vector ( 17 downto 0 );
            Kf_m : in std_logic_vector ( 17 downto 0 );
            chib_m : in std_logic_vector ( 17 downto 0 );
            chib_m1 : out std_logic_vector ( 17 downto 0 );
            chif_m : in std_logic_vector ( 17 downto 0 );
            chif_m1 : out std_logic_vector ( 17 downto 0 );
            datain_valid : in std_logic;
            dataout_valid : out std_logic;
            dividend_ready : out std_logic;
            divisor_ready : out std_logic        
        );
    end component;

    signal ck: std_logic;
    signal datain_valid: std_logic;
    signal dataout_valid: std_logic;
    signal divisor_ready: std_logic;
    signal dividend_ready: std_logic;
    signal kb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kf: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal chib: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal chif: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal chib_res: std_logic_vector (word_len - 1 downto 0);
    signal chif_res: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant a_val: std_logic_vector := b"001010101010111011";
    constant b_val: std_logic_vector := b"000110000000001011";
    constant c_val: std_logic_vector := b"000101010100010111";
    constant d_val: std_logic_vector := b"000111111100010111";

begin

    dut: update_chi
    port map (
        ck => ck,
        Kb_m => kb,
        Kf_m => kf,
        chib_m => chib,
        chif_m => chif,
        datain_valid => datain_valid,
        chif_m1 => chif_res,
        chib_m1 => chib_res,
        dataout_valid => dataout_valid,
        dividend_ready => dividend_ready,
        divisor_ready => divisor_ready
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

        datain_valid <= '0';

        wait for 2*tck;
        datain_valid <= '1';
        chib <= a_val;
        chif <= b_val;
        kb <= c_val;
        kf <= d_val;
        
        wait for 80*tck;

        ------------------------------VERIFICATION------------------------------------------
        ------------------------------------------------------------------------------------
        --                                                                                --
        --      The decimal values of the results should be chib_res = 3.92376708984375   --
        --      and chif_res = 2.207275390625, which in 18 bit fixed point with fraction  --
        --      length of 15 correspond to x"1f63e" and x"11a88", respectively.           --
        --                                                                                --
        ------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------

    end process test_sig;


end behavioral;