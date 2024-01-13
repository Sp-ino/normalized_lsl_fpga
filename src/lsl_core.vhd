library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity lsl_core is
    port (
        i_ck: in std_logic;
        i_en: in std_logic;
        i_x: in std_logic_vector (word_len - 1 downto 0);
        i_y: in std_logic_vector (word_len - 1 downto 0);
        o_ys: out std_logic_vector (word_len - 1 downto 0)
    );
end lsl_core;


architecture behavioral of lsl_core is

    component update_slice is
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
    end component;

    component xi_init is
        port (
            ck: in std_logic;
            data_in_valid: in std_logic;
            xib1_1: in std_logic_vector (word_len - 1 downto 0);
            x: in std_logic_vector (word_len - 1 downto 0);
            data_out_valid: out std_logic;
            xi_init: out std_logic_vector (word_len - 1 downto 0)
        );
    end component;

    constant xi_init_latency: integer := 6; 
    constant xi_strobe_offset: integer := update_latency - xi_init_latency - 1;

    signal r_x_demux: inout_array := (others => (others => '0'));
    signal r_y_demux: inout_array := (others => (others => '0'));
    signal w_ys: inout_array := (others => (others => '0'));
    signal w_e: inout_array := (others => (others => '0'));
    
    signal w_gam: filter_array := (others => (others => '0'));
    signal w_kb: filter_array := (others => (others => '0'));
    signal w_kf: filter_array := (others => (others => '0'));
    signal w_eb: filter_array := (others => (others => '0'));
    signal w_beta: filter_array := (others => (others => '0'));
    signal w_xib: filter_array := (others => (others => '0'));
    signal w_v: filter_array := (others => (others => '0'));
    
    signal r_count_loop: integer;
    signal r_count_init: integer;
    signal r_loop_strobe: std_logic;
    signal r_init_strobe: std_logic_vector (filter_len - 1 downto 0);
    
    signal w_xi_init: std_logic_vector (word_len - 1 downto 0);
    signal r_xi_init: std_logic_vector (word_len - 1 downto 0);
    signal r_xi_init_strobe: std_logic;
    signal w_xi_init_valid: std_logic;

    signal r_count_fb: integer;
    -- signal r_gam_fb: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    -- signal r_xib_fb:  std_logic_vector (word_len - 1 downto 0) := (others => '0');
    -- signal r_Kb_fb: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    -- signal r_Kf_fb: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    -- signal r_eb_fb: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    -- signal r_beta_fb: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    -- signal r_v_fb: std_logic_vector (word_len - 1 downto 0) := (others => '0');

    signal w_next_state: states;
    signal r_present_state: states;

begin
    
    gen_slices: for i in 0 to filter_len-1 generate
        update_slice_instance: update_slice
        port map (
            i_ck => i_ck,
            i_en => i_en,
            i_loop_strobe => r_loop_strobe,
            i_init_strobe => r_init_strobe(i),
            i_x => r_x_demux(i),
            i_y => r_y_demux(i),
            i_xi_init => w_xi_init,
            i_gam1_m => w_gam(i),
            i_Kb1_m => w_Kb(i),
            i_Kf1_m => w_Kf(i),
            i_eb1_m => w_eb(i),
            i_beta1_m => w_beta(i),
            i_xib1_m => w_xib(i),
            i_v1_m => w_v(i),
            o_gam_m => w_gam(i + 1),
            o_Kb_m => w_Kb(i + 1),
            o_Kf_m => w_Kf(i + 1),
            o_eb_m => w_eb(i + 1),
            o_beta_m => w_beta(i + 1),
            o_xib_m => w_xib(i + 1),
            o_v_m => w_v(i + 1),
            o_e_m => w_e(i),
            o_ys_m => w_ys(i)
        );
    end generate gen_slices;


    xi_initializer: init_xi
    port map (
        ck => i_ck,
        x1_1 => r_xi_init,
        x => i_x,
        xi_init => w_xi_init
    );


    feedback_combinational: process(all)
    begin
        if i_en = '0' or r_count_fb < filter_len then
            w_gam(0) <= one;
            w_xib(0) <= one;
            w_Kb(0) <= (others => '0');
            w_Kf(0) <= (others => '0');
            w_eb(0) <= (others => '0');
            w_beta(0) <= (others => '0');
            w_v(0) <= (others => '0');
        else
            w_gam(0) <= w_gam(filter_len);
            w_xib(0) <= w_xib(filter_len);
            w_Kb(0) <= w_Kb(filter_len);
            w_Kf(0) <= w_Kf(filter_len);
            w_eb(0) <= w_eb(filter_len);
            w_beta(0) <= w_beta(filter_len);
            w_v(0) <= w_v(filter_len);
        end if;
    end process feedback_combinational;


    compute_next_state: process(all)
    begin
        if i_en  = '0' then
            w_next_state <= idle;
        else
            case r_present_state is
            when idle =>
                w_next_state <= iterate;

            when iterate =>
                w_next_state <= iterate;
            end case;
        end if;
    end process compute_next_state;


    state_reg: process(i_ck)
    begin
        if rising_edge(i_ck) then
            if i_en = '0' then
                r_present_state <= idle;
            else
                r_present_state <= w_next_state;
            end if;
        end if;
    end process state_reg;


    control_signals: process(i_ck)
    begin
        if rising_edge(i_ck) then
            if i_en = '0' then
                r_count_init <= 0;
                r_count_loop <= 0;
                r_count_fb <= 0;

                r_loop_strobe <= '0';
                r_init_strobe <= (others => '0');
                r_xi_init <= one;
                r_xi_init_strobe <= '0';
            else
                case r_present_state is
                when idle => 
                    r_count_init <= 0;
                    r_count_loop <= 0;
                    r_count_fb <= 0;

                    r_loop_strobe <= '0';
                    r_init_strobe <= (others => '0');
                    r_xi_init <= one;
                    r_xi_init_strobe <= '0';

                when iterate =>
                    -- Count from 0 to update_latency-1 to keep track of samples
                    r_count_loop <= (r_count_loop + 1) mod update_latency;

                    -- Write xi_init in the dedicated register when the
                    -- output is valid
                    -- if w_xi_init_valid = '1' then
                    --     r_xi_init <= w_xi_init;
                    -- end if;

                    -- Sync signal for the circuit that generates xi_init
                    if r_count_loop = xi_strobe_offset then
                        r_xi_init_strobe <= '1';
                    else
                        r_xi_init_strobe <= '0';
                    end if;

                    -- When r_count_loop reaches update_latency - 1 we perform several actions
                    if r_count_loop = update_latency - 1 then
                        r_loop_strobe <= '1';
                        
                        r_count_init <= (r_count_init + 1) mod filter_len;           
                        r_x_demux(r_count_init) <= i_x;
                        r_y_demux(r_count_init) <= i_y;
                        r_init_strobe(r_count_init) <= '1';
                        o_ys <= w_ys(r_count_init);
                        
                        if r_count_fb < filter_len then
                            r_count_fb <= r_count_fb + 1;
                        end if;
                    else
                        -- otherwise we keep init_strobe and loop_strobe at '0'
                        r_init_strobe <= (others => '0');
                        r_loop_strobe <= '0';
                    end if;

                    -- if r_count_loop = 0 then
                    --     o_ys <= w_ys((r_count_init - 1) mod filter_len);
                    -- end if;
                end case;
            end if;
        end if;
    end process control_signals;

end behavioral;