library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    component update_block is
        port (
            ck: in std_logic;
            sel: in std_logic;
            valid: in std_logic;

            geb_m: in std_logic_vector (word_len - 1 downto 0);
            gef_m: in std_logic_vector (word_len - 1 downto 0);
            gam_m: in std_logic_vector (word_len - 1 downto 0);
            gam1_m1: in std_logic_vector (word_len - 1 downto 0);
            beta_m: in std_logic_vector (word_len - 1 downto 0);
            beta1_m: in std_logic_vector (word_len - 1 downto 0);
            eb1_m: in std_logic_vector (word_len - 1 downto 0);
            eb_m: in std_logic_vector (word_len - 1 downto 0);
            ef_m: in std_logic_vector (word_len - 1 downto 0);
            Kf1_m: in std_logic_vector (word_len - 1 downto 0);
            Kb1_m: in std_logic_vector (word_len - 1 downto 0);
            xif1_m1: in std_logic_vector (word_len - 1 downto 0);
            xif_m: in std_logic_vector (word_len - 1 downto 0);
            xib1_m1: in std_logic_vector (word_len - 1 downto 0);
            e_m: in std_logic_vector (word_len - 1 downto 0);
            v1_m: in std_logic_vector (word_len - 1 downto 0);
            ys_m: in std_logic_vector (word_len - 1 downto 0);

            gam_m1: out std_logic_vector (word_len - 1 downto 0);
            geb_m1: out std_logic_vector (word_len - 1 downto 0);
            gef_m1: out std_logic_vector (word_len - 1 downto 0);
            eb_m1: out std_logic_vector (word_len - 1 downto 0);
            ef_m1: out std_logic_vector (word_len - 1 downto 0);
            Kb_m: out std_logic_vector (word_len - 1 downto 0);
            Kf_m: out std_logic_vector (word_len - 1 downto 0);
            xib_m1: out std_logic_vector (word_len - 1 downto 0);
            xif_m1: out std_logic_vector (word_len - 1 downto 0);
            beta_m1: out std_logic_vector (word_len - 1 downto 0);
            e_m1: out std_logic_vector (word_len - 1 downto 0);
            v_m: out std_logic_vector (word_len - 1 downto 0);
            ys_m1: out std_logic_vector (word_len - 1 downto 0)
        );
    end component; 
    
    signal ck: std_logic;
    signal valid: std_logic := '0';
    signal sel: std_logic := '0';
    signal out_valid: std_logic;
    signal gam: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gam1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal beta: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal beta1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal geb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal gef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal eb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ef: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kb: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal kf: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal xif: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal xib1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal xif1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal v1: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal e: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    signal ys: std_logic_vector (word_len - 1 downto 0) := b"000000000000000000";
    
    signal gam_res: std_logic_vector (word_len - 1 downto 0);
    signal kb_res: std_logic_vector (word_len - 1 downto 0);
    signal kf_res: std_logic_vector (word_len - 1 downto 0);
    signal beta_res: std_logic_vector (word_len - 1 downto 0);
    signal eb_res: std_logic_vector (word_len - 1 downto 0);
    signal ef_res: std_logic_vector (word_len - 1 downto 0);
    signal geb_res: std_logic_vector (word_len - 1 downto 0);
    signal gef_res: std_logic_vector (word_len - 1 downto 0);
    signal xib_res: std_logic_vector (word_len - 1 downto 0);
    signal xif_res: std_logic_vector (word_len - 1 downto 0);
    signal e_res: std_logic_vector (word_len - 1 downto 0);
    signal ys_res: std_logic_vector (word_len - 1 downto 0);
    signal v_res: std_logic_vector (word_len - 1 downto 0);
    
    constant tck: time := 10ns;
    constant geb_val: std_logic_vector := b"001010101010111011";
    constant gef_val: std_logic_vector := b"000110000000001011";
    constant gam_val: std_logic_vector := b"000111111100010111";
    constant gam1_m1_val: std_logic_vector := b"000101010100010111";
    constant gam1_val: std_logic_vector := b"000111111100010111";
    constant beta_val: std_logic_vector := b"000011100000110000";
    constant beta1_val: std_logic_vector := b"000010000000111111";
    constant eb1_val: std_logic_vector := b"000010101010111011";
    constant eb_val: std_logic_vector := b"000010101111111111";
    constant ef_val: std_logic_vector := b"000111111111111011";
    constant eb1_extended: std_logic_vector := b"000000010101010111011000000000000000";
    constant ef_extended: std_logic_vector := b"000000111111111111011000000000000000";
    constant kf1_val: std_logic_vector := b"000111111110111111";
    constant kb1_val: std_logic_vector := b"001111000101010101";
    constant xif1_val: std_logic_vector := b"000111100010101111";
    constant xif_val: std_logic_vector := b"001011111110101111";
    constant xib1_val: std_logic_vector := b"001111111111101111";
    constant e_val: std_logic_vector := b"000101010100010111";
    constant e_val_resized: std_logic_vector := b"000000101010100010111000000000000000";
    constant v1_val: std_logic_vector := b"001010101010111011";

    -- Compute expected results for verification
    constant betageb: signed := signed(geb_val)*signed(beta_val)*signed(normalization);
    constant gam_m1_result: std_logic_vector := std_logic_vector(signed(gam_val) - betageb(frac_len*2 + word_len - 1 downto frac_len*2));
    
    constant kbef: signed := signed(kb1_val)*signed(ef_val);
    constant kfeb: signed := signed(kf1_val)*signed(eb1_val);
    constant eb_result_sign: signed := signed(eb1_extended) - kbef;
    constant ef_result_sign: signed := signed(ef_extended) - kfeb;
    constant eb_m1_result: std_logic_vector := std_logic_vector(eb_result_sign(frac_len + word_len - 1 downto frac_len));
    constant ef_m1_result: std_logic_vector := std_logic_vector(ef_result_sign(frac_len + word_len - 1 downto frac_len));
    
    constant geb_m1: signed := signed(gam_m1_result)*signed(eb_m1_result);
    constant gef_m1: signed := signed(gam1_m1_val)*signed(ef_m1_result);
    constant geb_m1_result: std_logic_vector := std_logic_vector(geb_m1(frac_len + word_len - 1 downto frac_len));
    constant gef_m1_result: std_logic_vector := std_logic_vector(gef_m1(frac_len + word_len - 1 downto frac_len));
    
    constant lambdaxib: signed := signed(lambda)*signed(xib1_val);
    constant lambdaxif: signed := signed(lambda)*signed(xif1_val);
    constant gebsq: signed := signed(geb_m1_result)*signed(eb_m1_result);
    constant gefsq: signed := signed(gef_m1_result)*signed(ef_m1_result);
    constant norm_gebsq: signed := signed(normalization)*gebsq(frac_len + word_len - 1 downto frac_len);
    constant norm_gefsq: signed := signed(normalization)*gefsq(frac_len + word_len - 1 downto frac_len);
    constant norm_gebsq_resized: signed := norm_gebsq(frac_len + word_len - 1 downto frac_len);
    constant norm_gefsq_resized: signed := norm_gefsq(frac_len + word_len - 1 downto frac_len);
    constant xib_m1_result: std_logic_vector := std_logic_vector(lambdaxib(frac_len + word_len - 1 downto frac_len) + norm_gebsq_resized);
    constant xif_m1_result: std_logic_vector := std_logic_vector(lambdaxif(frac_len + word_len - 1 downto frac_len) + norm_gefsq_resized);
    
    constant gef_over_xif: signed := to_signed(integer(32768.0*real(to_integer(signed(gef_val)))/real(to_integer(signed(xif_val)))), 18);
    constant gefxifeb: signed := signed(normalization)*signed(eb_m1_result)*(gef_over_xif(word_len - 1 downto 0));
    constant kb_result: std_logic_vector := std_logic_vector(signed(kb1_val) + gefxifeb(2*frac_len + word_len - 1 downto 2*frac_len));
    constant betaef: signed := signed(normalization)*signed(ef_m1_result)*signed(beta1_val);
    constant kf_result: std_logic_vector := std_logic_vector(signed(kf1_val) + betaef(2*frac_len + word_len - 1 downto 2*frac_len));  
    constant beta_result: std_logic_vector := std_logic_vector(to_signed(integer(32768.0*real(to_integer(signed(geb_m1_result)))/real(to_integer(signed(xib_m1_result)))), 18));

    constant veb: signed := signed(v1_val)*signed(eb_val);
    constant e_minus_veb: signed := signed(e_val_resized) - veb;
    constant e_result: std_logic_vector := std_logic_vector(e_minus_veb(frac_len + word_len - 1 downto frac_len));
    constant ys_result: std_logic_vector := std_logic_vector(veb(frac_len + word_len - 1 downto frac_len));
    constant betae_n: signed := signed(beta_val)*signed(e_result)*signed(normalization);
    constant betae_normalized: signed := betae_n(2*frac_len + word_len - 1 downto 2*frac_len);
    constant v_result: std_logic_vector := std_logic_vector(signed(v1_val) + betae_normalized);
begin

    dut: update_block
    port map (
        ck => ck,
        sel => sel,
        valid => valid,

        geb_m => geb,
        gef_m => gef,
        gam_m => gam,
        gam1_m1 => gam1,
        beta_m => beta,
        beta1_m => beta1,
        eb1_m => eb1,
        eb_m => eb,
        ef_m => ef,
        Kf1_m => kf,
        Kb1_m => kb,
        xif1_m1 => xif1,
        xif_m => xif,
        xib1_m1 => xib1,
        v1_m => v1,
        e_m => e,
        ys_m => ys,
    
        gam_m1 => gam_res,
        geb_m1 => geb_res,
        gef_m1 => gef_res,
        eb_m1 => eb_res,
        ef_m1 => ef_res,
        Kb_m => kb_res,
        Kf_m => kf_res,
        xib_m1 => xib_res,
        xif_m1 => xif_res,
        beta_m1 => beta_res,
        v_m => v_res,
        e_m1 => e_res,
        ys_m1 => ys_res
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

        wait for 2.5*tck;
        valid <= '1';
        sel <= '0';
        geb <= geb_val;
        gef <= gef_val;
        gam <= gam_val;
        gam1 <= gam1_m1_val;
        beta <= beta_val;
        beta1 <= beta1_val;
        eb1 <= eb1_val;
        eb <= eb_val;
        ef <= ef_val;
        kf <= kf1_val;
        kb <= kb1_val;
        xif1 <= xif1_val;
        xif <= xif_val;
        xib1 <= xib1_val;
        e <= e_val;
        v1 <= v1_val;
        ys <= (others => '0');

        wait for 1*tck;
        valid <= '0';
        geb <= (others => '0');
        gef <= (others => '0');
        gam <= (others => '0');
        gam1 <= (others => '0');
        beta <= (others => '0');
        beta1 <= (others => '0');
        eb1 <= (others => '0');
        eb <= (others => '0');
        ef <= (others => '0');
        kf <= (others => '0');
        kb <= (others => '0');
        xif1 <= (others => '0');
        xif <= (others => '0');
        xib1 <= (others => '0');
        e <= (others => '0');
        v1 <= (others => '0');

        wait for 3*tck;
        sel <= '1';
        valid <= '1';

        wait for 1*tck;
        valid <= '0';

        wait for 3*tck;

        ------------------------------VERIFICATION------------------------------------------
        ------------------------------------------------------------------------------------
        assert gam_m1_result = gam_res report "incorrect output on gam" severity error;
        assert eb_m1_result = eb_res report "incorrect output on eb" severity error;
        assert ef_m1_result = ef_res report "incorrect output on ef" severity error;
        assert geb_m1_result = geb_res report "incorrect output on geb" severity error;
        assert gef_m1_result = gef_res report "incorrect output on gef" severity error;
        assert xib_m1_result = xib_res report "incorrect output on xib" severity error;
        assert xif_m1_result = xif_res report "incorrect output on xif" severity error;
        assert kb_result = kb_res report "incorrect output on kb" severity error;
        assert kf_result = kf_res report "incorrect output on kf" severity error;
        assert beta_result = beta_res report "incorrect output on beta" severity error;
        assert v_result = v_res report "incorrect output on v" severity error;
        assert e_result = e_res report "incorrect output on e" severity error;
        assert ys_result = ys_res report "incorrect output on ys" severity error;
        ------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------

        wait for 4*tck;

        assert false report "End of testbench reached" severity failure;

    end process test_sig;


end behavioral;