library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity update_slice is
    port (
        i_ck: in std_logic;
        i_en: in std_logic;
        i_loop_strobe: in std_logic;
        i_init_strobe: in std_logic;
        i_x: in std_logic_vector (word_len - 1 downto 0);
        i_y: in std_logic_vector (word_len - 1 downto 0);
        i_xi_init: in std_logic_vector (word_len - 1 downto 0);
        i_gam1_m: in std_logic_vector (word_len - 1 downto 0);
        i_Kb1_m: in std_logic_vector (word_len - 1 downto 0);
        i_Kf1_m: in std_logic_vector (word_len - 1 downto 0);
        i_eb1_m: in std_logic_vector (word_len - 1 downto 0);
        i_beta1_m: in std_logic_vector (word_len - 1 downto 0);
        i_xib1_m: in std_logic_vector (word_len - 1 downto 0);
        i_v1_m: in std_logic_vector (word_len - 1 downto 0);
        o_gam_m: out std_logic_vector (word_len - 1 downto 0);
        o_Kb_m: out std_logic_vector (word_len - 1 downto 0);
        o_Kf_m: out std_logic_vector (word_len - 1 downto 0);
        o_eb_m: out std_logic_vector (word_len - 1 downto 0);
        o_beta_m: out std_logic_vector (word_len - 1 downto 0);
        o_xib_m: out std_logic_vector (word_len - 1 downto 0);
        o_v_m: out std_logic_vector (word_len - 1 downto 0);
        o_e_m: out std_logic_vector (word_len - 1 downto 0);
        o_ys_m: out std_logic_vector (word_len - 1 downto 0)
    );
end update_slice;


architecture behavioral of update_slice is    

    signal r_div_data_valid: std_logic := '0';
    signal w_div_data_out_valid: std_logic;
    signal w_dividend_ready: std_logic;
    signal w_divisor_ready: std_logic;
    
    signal r_loop_strobe_del1: std_logic := '0';
    signal r_init_strobe_del1: std_logic := '0';
    signal r_loop_strobe_del2: std_logic := '0';
    signal r_init_strobe_del2: std_logic := '0';

    signal r_xi_init_del1: std_logic_vector (word_len - 1 downto 0);
    signal r_xi_init_del2: std_logic_vector (word_len - 1 downto 0);
    
    signal r_gam_m: std_logic_vector (word_len - 1 downto 0);
    signal r_xib_m: std_logic_vector (word_len - 1 downto 0);
    signal r_xif_m: std_logic_vector (word_len - 1 downto 0);
    signal r_eb_m: std_logic_vector (word_len - 1 downto 0);
    signal r_ef_m: std_logic_vector (word_len - 1 downto 0);
    signal r_e_m: std_logic_vector (word_len - 1 downto 0);
    signal r_ys_m: std_logic_vector (word_len - 1 downto 0);
    
    signal w_beta_m: std_logic_vector (word_len - 1 downto 0);
    signal w_Kb_m: std_logic_vector (word_len - 1 downto 0);
    signal w_Kf_m: std_logic_vector (word_len - 1 downto 0);
    signal w_v_m: std_logic_vector (word_len - 1 downto 0);
    signal w_gam_m1: std_logic_vector (word_len - 1 downto 0);
    signal w_xib_m1: std_logic_vector (word_len - 1 downto 0);
    signal w_xif_m1: std_logic_vector (word_len - 1 downto 0);
    signal w_eb_m1: std_logic_vector (word_len - 1 downto 0);
    signal w_ef_m1: std_logic_vector (word_len - 1 downto 0);
    signal w_e_m1: std_logic_vector (word_len - 1 downto 0);
    signal w_ys_m1: std_logic_vector (word_len - 1 downto 0);

    component update_block is
        port (
            gam1_m : in std_logic_vector (word_len - 1 downto 0);
            beta1_m : in std_logic_vector (word_len - 1 downto 0);
            Kb1_m : in std_logic_vector (word_len - 1 downto 0);
            Kf1_m : in std_logic_vector (word_len - 1 downto 0);
            eb1_m : in std_logic_vector (word_len - 1 downto 0);
            xib1_m : in std_logic_vector (word_len - 1 downto 0);
            v1_m : in std_logic_vector (word_len - 1 downto 0);
            xib_m : in std_logic_vector (word_len - 1 downto 0);
            xif_m : in std_logic_vector (word_len - 1 downto 0);
            e_m : in std_logic_vector (word_len - 1 downto 0);
            eb_m : in std_logic_vector (word_len - 1 downto 0);
            ef_m : in std_logic_vector (word_len - 1 downto 0);
            gam_m : in std_logic_vector (word_len - 1 downto 0);
            ys_m : in std_logic_vector (word_len - 1 downto 0);
            
            beta_m : out std_logic_vector (word_len - 1 downto 0);
            Kb_m : out std_logic_vector (word_len - 1 downto 0);
            Kf_m : out std_logic_vector (word_len - 1 downto 0);
            v_m : out std_logic_vector (word_len - 1 downto 0);
            gam_m1 : out std_logic_vector (word_len - 1 downto 0);
            xib_m1 : out std_logic_vector (word_len - 1 downto 0);
            xif_m1 : out std_logic_vector (word_len - 1 downto 0);
            eb_m1 : out std_logic_vector (word_len - 1 downto 0);
            ef_m1 : out std_logic_vector (word_len - 1 downto 0);
            e_m1 : out std_logic_vector (word_len - 1 downto 0);
            ys_m1 : out std_logic_vector (word_len - 1 downto 0);
            
            ck : in std_logic;
            div_data_valid : in std_logic;
            div_data_out_valid : out std_logic;
            dividend_ready : out std_logic;
            divisor_ready : out std_logic
        );
    end component;

begin

    update_block_i: update_block
    port map (
        gam1_m => i_gam1_m,
        Kb1_m => i_Kb1_m,
        Kf1_m => i_Kf1_m,
        xib1_m => i_xib1_m,
        beta1_m => i_beta1_m,
        eb1_m => i_eb1_m,
        v1_m => i_v1_m,

        gam_m => r_gam_m,
        eb_m => r_eb_m,
        ef_m => r_ef_m,
        xib_m => r_xib_m,
        xif_m => r_xif_m,
        e_m => r_e_m,
        ys_m => r_ys_m,
        
        beta_m => w_beta_m,
        Kb_m => w_Kb_m,
        Kf_m => w_Kf_m,
        v_m => w_v_m,
        gam_m1 => w_gam_m1,
        xib_m1 => w_xib_m1,
        xif_m1 => w_xif_m1,
        eb_m1 => w_eb_m1,
        ef_m1 => w_ef_m1,
        e_m1 => w_e_m1,
        ys_m1 => w_ys_m1,

        ck => i_ck,
        div_data_valid => r_div_data_valid,
        div_data_out_valid => w_div_data_out_valid,
        dividend_ready => w_dividend_ready,
        divisor_ready => w_divisor_ready
    );

    internal_feedback: process(i_ck)
    begin
        if rising_edge(i_ck) then
            if i_en = '0' then
                r_gam_m <= one;
                r_eb_m <= (others => '0');
                r_ef_m <= (others => '0');
                r_xib_m <= one;
                r_xif_m <= (others => '0');
                r_e_m <= (others => '0');
            else                
                r_div_data_valid <= i_loop_strobe;

                if i_loop_strobe = '1' then         
                    if i_init_strobe = '1' then
                        r_gam_m <= one;
                        r_eb_m <= i_x;
                        r_ef_m <= i_x;
                        r_xib_m <= i_xi_init;
                        r_xif_m <= i_xi_init;
                        r_e_m <= i_y;
                        r_ys_m <= (others => '0');
                    else
                        r_gam_m <= w_gam_m1;
                        r_eb_m <= w_eb_m1;
                        r_ef_m <= w_ef_m1;
                        r_xib_m <= w_xib_m1
                        r_xif_m <= w_xif_m1
                        r_e_m <= w_e_m1;
                        r_ys_m <= w_ys_m1;
                    end if;
                end if;
            end if;
        end if;
    end process internal_feedback;


    out_reg: process(i_ck)
    begin
        if rising_edge(i_ck) then
            if i_en = '0' then
                o_gam_m <= one;
                o_Kb_m <= (others => '0');
                o_Kf_m <= (others => '0');
                o_eb_m <= (others => '0');
                o_xib_m <= one;
                o_e_m <= (others => '0');
                o_beta_m <= (others => '0');
                o_v_m <= (others => '0');
                o_ys_m <= (others => '0');
            else
                -- these 4 signals must be delayed by 1 clock cycle wrt the outputs of update_block
                -- before being presented at the output ports
                o_beta_m <= w_beta_m;
                o_Kb_m <= w_Kb_m;
                o_Kf_m <= w_Kf_m;
                o_v_m <= w_v_m;
                
                if i_loop_strobe = '1' then
                    -- the signals gam_m1, eb_m1, ef_m1, xib_m1, xif_m1, e_m1 and ys_m1 must be buffered for one
                    -- loop period (i.e. the period of i_loop_strobe) before becoming gam_m, eb_m, etc. and being
                    -- presented on the output ports
                    o_gam_m <= r_gam_m;
                    o_xib_m <= r_xib_m;
                    o_eb_m <= r_eb_m;
                    o_e_m <= r_e_m;
                end if;
                
                if i_init_strobe = '1' then
                    o_ys_m <= w_ys_m1;
                end if;
            end if;
        end if;
    end process out_reg;
end behavioral;