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
            ys_m: in std_logic_vector (word_len - 1 downto 0);
            e_m1: out std_logic_vector (word_len - 1 downto 0);
            v_m: out  std_logic_vector (word_len - 1 downto 0);
            ys_m1: out  std_logic_vector (word_len - 1 downto 0)
        );
    end component;

    signal ck: std_logic;
    signal v: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal e: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ys: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal beta: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal e_out: std_logic_vector (word_len - 1 downto 0);
    signal v_out: std_logic_vector (word_len - 1 downto 0);
    signal ys_out: std_logic_vector (word_len - 1 downto 0);

    constant tck: time := 10ns;
    constant v_val: std_logic_vector := b"001010101010111011";
    constant eb_val: std_logic_vector := b"000110000000001011";
    constant e_val: std_logic_vector := b"000101010100010111";
    constant e_val_resized: std_logic_vector := b"000000101010100010111000000000000000";
    constant beta_val: std_logic_vector := b"000111111100010111";

    constant veb: signed := signed(v_val)*signed(eb_val);
    constant e_minus_veb: signed := signed(e_val_resized) - veb;
    constant e_result: std_logic_vector := std_logic_vector(e_minus_veb(frac_len + word_len - 1 downto frac_len));
    constant ys_result: std_logic_vector := std_logic_vector(veb(frac_len + word_len - 1 downto frac_len));
    
    constant betae_n: signed := signed(beta_val)*signed(e_result)*signed(normalization);
    constant betae_normalized: signed := betae_n(2*frac_len + word_len - 1 downto 2*frac_len);
    constant v_result: std_logic_vector := std_logic_vector(signed(v_val) + betae_normalized);
    

begin

    dut: update_feedforward
    port map (
        ck => ck,
        v1_m => v,
        eb_m => eb,
        e_m => e,
        beta_m => beta,
        ys_m => ys,
        e_m1 => e_out,
        v_m => v_out,
        ys_m1 => ys_out
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
        v <= v_val;
        eb <= eb_val;
        e <= e_val;
        beta <= beta_val;
        ys <= (others => '0');
        
        wait for 4*tck;
        assert e_result = e_out report "incorrect output on e" severity error;
        assert v_result = v_out report "incorrect output on v" severity error;
        assert ys_result = ys_out report "incorrect output on ys" severity error;

    end process test_sig;


end behavioral;