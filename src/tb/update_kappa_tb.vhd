library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_kappa is
        port (
            ck : in std_logic;
            sel: in std_logic;
            valid: in std_logic;
            ef_m1 : in std_logic_vector (word_len - 1 downto 0);
            eb_m1 : in std_logic_vector (word_len - 1 downto 0);
            beta1_m : in std_logic_vector (word_len - 1 downto 0);
            Kf1_m : in std_logic_vector (word_len - 1 downto 0);
            Kb1_m : in std_logic_vector (word_len - 1 downto 0);
            xif_m : in std_logic_vector (word_len - 1 downto 0);
            xib_m1 : in std_logic_vector (word_len - 1 downto 0);
            gef_m : in std_logic_vector (word_len - 1 downto 0);
            geb_m1 : in std_logic_vector (word_len - 1 downto 0);
            Kf_m : out std_logic_vector (word_len - 1 downto 0);
            Kb_m : out std_logic_vector (word_len - 1 downto 0);
            beta_m1: out std_logic_vector (word_len - 1 downto 0)
        );
    end component;

    signal ck: std_logic;
    signal sel: std_logic;
    signal valid: std_logic;

    signal kb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kf: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal beta: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal xif: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal xib: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal geb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kb_out: std_logic_vector (word_len - 1 downto 0);
    signal kf_out: std_logic_vector (word_len - 1 downto 0);
    signal beta_out: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant e_val: std_logic_vector := b"001010101010111011";
    constant kb_val: std_logic_vector := b"000110000000001011";
    constant kf_val: std_logic_vector := b"000101010100010111";
    constant beta_val: std_logic_vector := b"000111111100010111";
    constant geb_val: std_logic_vector := b"000011100000110000";
    constant gef_val: std_logic_vector := b"000010000000110001";
    constant xib_val: std_logic_vector := b"000010000000111100";
    constant xif_val: std_logic_vector := b"000010101000111111";

    constant gef_over_xif: signed := to_signed(integer(32768.0*real(to_integer(signed(gef_val)))/real(to_integer(signed(xif_val)))), 18);
    constant gefxifeb: signed := signed(normalization)*signed(e_val)*(gef_over_xif(word_len - 1 downto 0));
    constant kb_result: std_logic_vector := std_logic_vector(signed(kb_val) + gefxifeb(2*frac_len + word_len - 1 downto 2*frac_len));

    constant betaef: signed := signed(normalization)*signed(e_val)*signed(beta_val);
    constant kf_result: std_logic_vector := std_logic_vector(signed(kf_val) + betaef(2*frac_len + word_len - 1 downto 2*frac_len));

    constant beta_result: std_logic_vector := std_logic_vector(to_signed(integer(32768.0*real(to_integer(signed(geb_val)))/real(to_integer(signed(xib_val)))), 18));

begin

    dut: update_kappa
    port map (
        ck => ck,
        sel => sel,
        valid => valid,
        ef_m1 => ef,
        eb_m1 => eb,
        beta1_m => beta,
        Kf1_m => kf,
        Kb1_m => kb,
        xif_m => xif,
        xib_m1 => xib,
        gef_m => gef,
        geb_m1 => geb,
        Kf_m => kf_out,
        Kb_m => kb_out,
        beta_m1 => beta_out
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
        sel <= '0';
        valid <= '1';
        kb <= kb_val;
        kf <= kf_val;
        beta <= beta_val;
        gef <= gef_val;
        geb <= geb_val;
        xif <= xif_val;
        xib <= xib_val;
        
        wait for tck;
        eb <= e_val;
        ef <= e_val;
        valid <= '0';
        wait for 4*tck;

        assert kf_result = kf_out report "incorrect output on kf" severity error;
        assert kb_result = kb_out report "incorrect output on kb" severity error;

        valid <= '1';
        sel <= '1';
        wait for tck;
        valid <= '0';
        wait for 3*tck;

        assert beta_result = beta_out report "incorrect output on beta" severity error;
        wait for tck/2;

    end process test_sig;

end behavioral;