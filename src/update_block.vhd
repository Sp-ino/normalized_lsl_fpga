library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity update_block is
    port (
        rst: in std_logic;
        ck: in std_logic;

    );
end update_block; 


architecture structure of update_block is

    component update_gamma is
        port (
            ck : in std_logic;
            beta_m : in std_logic_vector (word_len - 1 downto 0);
            geb_m : in std_logic_vector (word_len - 1 downto 0);
            gam_m : in std_logic_vector (word_len - 1 downto 0);
            gam_m1 : out std_logic_vector (word_len - 1 downto 0)
        );
    end component;

    component update_epsilon is
        port (
            ck : in std_logic;
            Kb1_m : in std_logic_vector ( 17 downto 0 );
            Kf1_m : in std_logic_vector ( 17 downto 0 );
            eb1_m : in std_logic_vector ( 17 downto 0 );
            ef_m : in std_logic_vector ( 17 downto 0 );
            eb_m1 : out std_logic_vector ( 17 downto 0 );
            ef_m1 : out std_logic_vector ( 17 downto 0 )
        );
    end component;

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

    component update_xi is
        port (
            ck : in std_logic;
            eb_m1 : in std_logic_vector (word_len - 1 downto 0);
            ef_m1 : in std_logic_vector (word_len - 1 downto 0);
            geb_m1 : in std_logic_vector (word_len - 1 downto 0);
            gef_m1 : in std_logic_vector (word_len - 1 downto 0);
            xib1_m1 : in std_logic_vector (word_len - 1 downto 0);
            xif1_m1 : in std_logic_vector (word_len - 1 downto 0);
            xib_m1 : out std_logic_vector (word_len - 1 downto 0);
            xif_m1 : out std_logic_vector (word_len - 1 downto 0)
            );
        end component;
        
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

    component delay is
        generic (
            delay_len: integer
        );
        port (
            i_ck: in std_logic;
            i_data: in std_logic_vector (word_len - 1 downto 0);
            o_data: out std_logic_vector (word_len - 1 downto 0)    
        );
    end component;

    signal gam_m1: std_logic_vector (word_len - 1 downto 0);

begin


    u_gam: update_gamma
    port map (
        ck => ck,
        beta_m => beta_m,
        geb_m => geb_m,
        gam_m => gam_m,
        gam_m1 => gam_m1
    );

    u_epsilon: update_epsilon
    port map (
        ck => ck,
        Kb1_m => Kb1_m,
        Kf1_m => Kf1_m,
        eb1_m => eb1_m,
        ef_m => ef_m,
        eb_m1 => eb_m1,
        ef_m1 => ef_m1
    );

    u_kappa: update_kappa
    port map (
        ck => ck,
        sel => sel,
        valid => valid,
        ef_m1 => ef_m1,
        eb_m1 => eb_m1,
        beta1_m => beta1_m,
        Kf1_m => Kf1_m,
        Kb1_m => Kb1_m,
        xif_m => xif_m,
        xib_m1 => xib_m1,
        gef_m => gef_m,
        geb_m1 => geb_m1,
        Kf_m => Kf_m,
        Kb_m => Kb_m,
        beta_m1 => beta_m1
    );

    u_xi: update_xi
    port map (
        ck => ck,
        eb_m1 => eb_m1,
        ef_m1 => ef_m1,
        geb_m1 => geb_m1,
        gef_m1 => gef_m1,
        xib1_m1 => xib1_m1,
        xif1_m1 => xif1_m1,
        xib_m1 => xib_m1,
        xif_m1 => xif_m1
    );

    
end structure;