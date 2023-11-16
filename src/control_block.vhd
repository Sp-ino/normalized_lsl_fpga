library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity control_block is
    port (
        i_rst: in std_logic;
        i_ck: in std_logic;
        i_x : in std_logic_vector ( 17 downto 0 );
        i_y : in std_logic_vector ( 17 downto 0 );
        i_chi_init : in std_logic_vector ( 17 downto 0 );
        i_gam_m1 : in std_logic_vector ( 17 downto 0 );
        i_beta_m : in std_logic_vector ( 17 downto 0 );
        i_eb_m1 : in std_logic_vector ( 17 downto 0 );
        i_ef_m1 : in std_logic_vector ( 17 downto 0 );
        i_chib_m1 : in std_logic_vector ( 17 downto 0 );
        i_chif_m1 : in std_logic_vector ( 17 downto 0 );
        i_kb_m : in std_logic_vector ( 17 downto 0 );
        i_kf_m : in std_logic_vector ( 17 downto 0 );
        i_e_m1 : in std_logic_vector ( 17 downto 0 );
        i_v_m : in std_logic_vector ( 17 downto 0 );
        o_gam1_m : out std_logic_vector ( 17 downto 0 );
        o_gam_m : out std_logic_vector ( 17 downto 0 );
        o_beta1_m : out std_logic_vector ( 17 downto 0 );
        o_eb1_m : out std_logic_vector ( 17 downto 0 );
        o_eb_m : out std_logic_vector ( 17 downto 0 );
        o_ef_m : out std_logic_vector ( 17 downto 0 );
        o_kb1_m : out std_logic_vector ( 17 downto 0 );
        o_kf1_m : out std_logic_vector ( 17 downto 0 );
        o_chib_m : out std_logic_vector ( 17 downto 0 );
        o_chib1_m : out std_logic_vector ( 17 downto 0 );
        o_chif_m : out std_logic_vector ( 17 downto 0 );
        o_e_m : out std_logic_vector ( 17 downto 0 );
        o_v1_m : out std_logic_vector ( 17 downto 0 );
        o_data_valid: out std_logic
);
end control_block;


architecture behavioral of control_block is

    signal r_count_update_latency: integer range 0 to update_latency := 0;
    signal r_count_order_recursion: integer range 0 to filter_len := 0;
    
    signal gam1_shift_reg: aux_shift_reg := (others => "001000000000000000");
    signal beta1_shift_reg: aux_shift_reg := (others => (others => '0'));
    signal eb1_shift_reg: aux_shift_reg := (others => (others => '0'));
    signal kb1_shift_reg: aux_shift_reg := (others => one_over_epsilon);
    signal kf1_shift_reg: aux_shift_reg := (others => one_over_epsilon);
    signal chib1_shift_reg: aux_shift_reg := (others => (others => '0'));
    signal v1_shift_reg: aux_shift_reg := (others => (others => '0'));

    signal r_gam_m: std_logic_vector (word_len - 1 downto 0) :=  "001000000000000000";
    signal r_eb_m: std_logic_vector (word_len - 1 downto 0) :=  (others => '0');
    signal r_ef_m: std_logic_vector (word_len - 1 downto 0) :=  (others => '0');
    signal r_chib_m: std_logic_vector (word_len - 1 downto 0) :=  one_over_epsilon;
    signal r_chif_m: std_logic_vector (word_len - 1 downto 0) :=  (others => '0');
    signal r_e_m: std_logic_vector (word_len - 1 downto 0) :=  (others => '0');
begin

    process (i_ck, i_rst)
    begin
        if rising_edge(i_ck) then
            if i_rst = '1' then
                r_gam_m <= "001000000000000000";
                r_eb_m <= (others => '0');
                r_ef_m <= (others => '0');
                r_chib_m <= one_over_epsilon;
                r_chif_m <= (others => '0');
                r_e_m <= (others => '0');
                gam1_shift_reg <= (others => "001000000000000000");
                beta1_shift_reg <= (others => (others => '0'));
                eb1_shift_reg <= (others => (others => '0'));
                kb1_shift_reg <= (others => one_over_epsilon);
                kf1_shift_reg <= (others => one_over_epsilon);
                chib1_shift_reg <= (others => (others => '0'));
                v1_shift_reg <= (others => (others => '0'));

                r_count_update_latency <= 0;
                r_count_order_recursion <= 0;
            else
                if r_count_update_latency < update_latency - 1 then
                    r_count_update_latency <= r_count_update_latency + 1;
                    o_data_valid <= '0';
                else
                    r_count_update_latency <= 0;
                    
                    r_gam_m <= i_gam_m1;
                    r_eb_m <= i_eb_m1;
                    r_ef_m <= i_ef_m1;
                    r_chib_m <= i_chib_m1;
                    r_chif_m <= i_chif_m1;
                    r_e_m <= i_e_m1;
                    
                    gam1_shift_reg <= shift(gam1_shift_reg, r_gam_m);
                    beta1_shift_reg <= shift(beta1_shift_reg, i_beta_m);
                    eb1_shift_reg <= shift(eb1_shift_reg, r_eb_m);
                    kb1_shift_reg <= shift(kb1_shift_reg, i_kb_m);
                    kf1_shift_reg <= shift(kf1_shift_reg, i_kf_m);
                    chib1_shift_reg <= shift(chib1_shift_reg, r_chib_m);
                    v1_shift_reg <= shift(v1_shift_reg, i_v_m);

                    o_data_valid <= '1';

                    if r_count_order_recursion < filter_len - 1 then    
                        r_count_order_recursion <= r_count_order_recursion + 1;
                    else
                        r_gam_m <= "001000000000000000";
                        r_eb_m <= i_x;
                        r_ef_m <= i_x;
                        r_chib_m <= i_chi_init;
                        r_chif_m <= i_chi_init;
                        r_e_m <= i_y;

                        r_count_order_recursion <= 0;
                    end if;
                end if;
            end if;
        end if;
    end process;

    o_gam_m <= r_gam_m;
    o_eb_m <= r_eb_m;
    o_ef_m <= r_ef_m;
    o_chib_m <= r_chib_m;
    o_chif_m <= r_chif_m;
    o_e_m <= r_e_m;
    o_gam1_m <= gam1_shift_reg(0);
    o_beta1_m <= beta1_shift_reg(0);
    o_eb1_m <= eb1_shift_reg(0);
    o_kb1_m <= kb1_shift_reg(0);
    o_kf1_m <= kf1_shift_reg(0);
    o_chib1_m <= chib1_shift_reg(0);
    o_v1_m <= v1_shift_reg(0);

end behavioral;