library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;


entity tb is
end tb;

architecture behavioral of tb is

    component update_slice is
        port (
            i_ck: in std_logic;
            i_rst: in std_logic;
            i_loop_strobe: in std_logic;
            i_init_strobe: in std_logic;
            i_x: in std_logic_vector (word_len - 1 downto 0);
            i_y: in std_logic_vector (word_len - 1 downto 0);
            i_chi_init: in std_logic_vector (word_len - 1 downto 0);
            i_gam1_m: in std_logic_vector (word_len - 1 downto 0);
            i_Kb1_m: in std_logic_vector (word_len - 1 downto 0);
            i_Kf1_m: in std_logic_vector (word_len - 1 downto 0);
            i_eb1_m: in std_logic_vector (word_len - 1 downto 0);
            i_beta1_m: in std_logic_vector (word_len - 1 downto 0);
            i_chib1_m: in std_logic_vector (word_len - 1 downto 0);
            i_v1_m: in std_logic_vector (word_len - 1 downto 0);
            o_gam_m: out std_logic_vector (word_len - 1 downto 0);
            o_Kb_m: out std_logic_vector (word_len - 1 downto 0);
            o_Kf_m: out std_logic_vector (word_len - 1 downto 0);
            o_eb_m: out std_logic_vector (word_len - 1 downto 0);
            o_beta_m: out std_logic_vector (word_len - 1 downto 0);
            o_chib_m: out std_logic_vector (word_len - 1 downto 0);
            o_v_m: out std_logic_vector (word_len - 1 downto 0);
            o_e_m: out std_logic_vector (word_len - 1 downto 0);
            o_ys_m: out std_logic_vector (word_len - 1 downto 0)
        );
    end component;
    
    constant tck: time := 10ns;

    signal ck: std_logic;
    signal rst: std_logic;
    signal loop_strobe: std_logic := '0';
    signal init_strobe: std_logic := '0';
    signal x: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal y: std_logic_vector (word_len - 1 downto 0) := (others => '0');

    signal chi_init: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal gam1_m: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal Kb1_m: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal Kf1_m: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal eb1_m: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal beta1_m: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal chib1_m: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal v1_m: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal gam_m: std_logic_vector (word_len - 1 downto 0);
    signal Kb_m: std_logic_vector (word_len - 1 downto 0);
    signal Kf_m: std_logic_vector (word_len - 1 downto 0);
    signal eb_m: std_logic_vector (word_len - 1 downto 0);
    signal beta_m: std_logic_vector (word_len - 1 downto 0);
    signal chib_m: std_logic_vector (word_len - 1 downto 0);
    signal v_m: std_logic_vector (word_len - 1 downto 0);
    signal e_m: std_logic_vector (word_len - 1 downto 0);
    signal ys_m: std_logic_vector (word_len - 1 downto 0);

    signal flag: std_logic := '0';
    signal flag_2: std_logic := '0';

begin

    slice: update_slice
    port map (
        i_ck => ck,
        i_rst => rst,
        i_loop_strobe => loop_strobe,
        i_init_strobe => init_strobe,
        i_x => x,
        i_y => y,
        i_chi_init => chi_init,
        i_gam1_m => gam1_m,
        i_Kb1_m => Kb1_m,
        i_Kf1_m => Kf1_m,
        i_eb1_m => eb1_m,
        i_beta1_m => beta1_m,
        i_chib1_m => chib1_m,
        i_v1_m => v1_m,
        o_gam_m => gam_m,
        o_Kb_m => Kb_m,
        o_Kf_m => Kf_m,
        o_eb_m => eb_m,
        o_beta_m => beta_m,
        o_chib_m => chib_m,
        o_v_m => v_m,
        o_e_m => e_m,
        o_ys_m => ys_m
    );

    clock_gen: process
    begin
        ck <= '1';
        wait for tck/2;
        ck <= '0';
        wait for tck/2;
    end process clock_gen;

    init_strobe_gen: process
    begin
        if flag = '0' then 
            wait for update_latency*tck + 0.001*tck;
            flag <= '1';
        end if;
        init_strobe <= '1';
        wait for tck;
        init_strobe <= '0';
        wait for (update_latency*filter_len-1)*tck;
    end process init_strobe_gen;

    loop_strobe_gen: process
    begin
        if flag_2 = '0' then
            wait for update_latency*tck + 0.001*tck;
            flag_2 <= '1';
        end if;
        loop_strobe <= '1';
        wait for tck;
        loop_strobe <= '0';
        wait for (update_latency-1)*tck;
    end process loop_strobe_gen;

    stimuli: process
    begin

        wait for tck/2;
        rst <= '1';
        wait for tck;
        rst <= '0';

        wait for tck;
        x <= std_logic_vector(to_signed(19087, 18));
        y <= std_logic_vector(to_signed(4772, 18));
        chi_init <= std_logic_vector(to_signed(24503, 18));
        gam1_m <= one;
        Kb1_m <= std_logic_vector(to_signed(0, 18));
        Kf1_m <= std_logic_vector(to_signed(0, 18));
        eb1_m <= std_logic_vector(to_signed(0, 18));
        beta1_m <= std_logic_vector(to_signed(0, 18));
        chib1_m <= one;
        v1_m <= std_logic_vector(to_signed(0, 18));

        wait for tck*update_latency;
        wait for tck*update_latency;
        wait for tck*update_latency;        
        wait for tck*update_latency;        

    end process stimuli;

end behavioral;