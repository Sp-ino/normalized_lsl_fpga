library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity update_block is
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
        e_m: in std_logic_vector (word_len - 1 downto 0);
        v1_m: in std_logic_vector (word_len - 1 downto 0);
        ys_m: in std_logic_vector (word_len - 1 downto 0);

        xib1_m1: in std_logic_vector (word_len - 1 downto 0);
        beta_m1: out std_logic_vector (word_len - 1 downto 0);
        geb_m1: out std_logic_vector (word_len - 1 downto 0);
        gef_m1: out std_logic_vector (word_len - 1 downto 0);
        eb_m1: out std_logic_vector (word_len - 1 downto 0);
        ef_m1: out std_logic_vector (word_len - 1 downto 0);
        gam_m1: out std_logic_vector (word_len - 1 downto 0);
        Kb_m: out std_logic_vector (word_len - 1 downto 0);
        Kf_m: out std_logic_vector (word_len - 1 downto 0);
        xib_m1: out std_logic_vector (word_len - 1 downto 0);
        xif_m1: out std_logic_vector (word_len - 1 downto 0);
        e_m1: out std_logic_vector (word_len - 1 downto 0);
        v_m: out std_logic_vector (word_len - 1 downto 0);
        ys_m1: out std_logic_vector (word_len - 1 downto 0)
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

    component update_geb_gef is
        port (
            ck : in std_logic;
            eb_m1 : in std_logic_vector (word_len - 1 downto 0);
            ef_m1 : in std_logic_vector (word_len - 1 downto 0);
            gam_m1 : in std_logic_vector (word_len - 1 downto 0);
            gam1_m1 : in std_logic_vector (word_len - 1 downto 0);
            geb_m1 : out std_logic_vector (word_len - 1 downto 0);
            gef_m1 : out std_logic_vector (word_len - 1 downto 0)
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

    component delay_for_structures is
        generic (
            delay_len: integer
        );
        port (
            i_ck: in std_logic;
            i_data: in std_logic_vector (word_len - 1 downto 0);
            o_data: out std_logic_vector (word_len - 1 downto 0)    
        );
    end component;

    signal gam_m1_del1: std_logic_vector (word_len - 1 downto 0);
    signal gam1_m1_del1: std_logic_vector (word_len - 1 downto 0);

    signal geb_m_del1: std_logic_vector (word_len - 1 downto 0);
    signal gef_m_del1: std_logic_vector (word_len - 1 downto 0);
    signal geb_m1_del2: std_logic_vector (word_len - 1 downto 0);
    signal geb_m1_del4: std_logic_vector (word_len - 1 downto 0);
    signal gef_m1_del2: std_logic_vector (word_len - 1 downto 0);
    
    signal eb_m1_del1: std_logic_vector (word_len - 1 downto 0);
    signal ef_m1_del1: std_logic_vector (word_len - 1 downto 0);
    signal eb_m1_del2: std_logic_vector (word_len - 1 downto 0);
    signal ef_m1_del2: std_logic_vector (word_len - 1 downto 0);

    signal xib1_m1_del2: std_logic_vector (word_len - 1 downto 0);
    signal xif1_m1_del2: std_logic_vector (word_len - 1 downto 0);
    signal xib_m1_del3: std_logic_vector (word_len - 1 downto 0);
    signal xif_m1_del3: std_logic_vector (word_len - 1 downto 0);
    signal xib_m1_del4: std_logic_vector (word_len - 1 downto 0);
    
    signal kf_m_del5: std_logic_vector (word_len - 1 downto 0);
    signal kb_m_del5: std_logic_vector (word_len - 1 downto 0);
    
    signal v_m_del3: std_logic_vector (word_len - 1 downto 0);
    signal e_m1_del3: std_logic_vector (word_len - 1 downto 0);
    signal ys_m1_del3: std_logic_vector (word_len - 1 downto 0);
    
begin

    u_gam: update_gamma
    port map (
        ck => ck,
        beta_m => beta_m,
        geb_m => geb_m,
        gam_m => gam_m,
        gam_m1 => gam_m1_del1
    );    
        
        
        
    u_epsilon: update_epsilon
    port map (
        ck => ck,
        Kb1_m => Kb1_m,
        Kf1_m => Kf1_m,
        eb1_m => eb1_m,
        ef_m => ef_m,
        eb_m1 => eb_m1_del1,
        ef_m1 => ef_m1_del1
    );
    
    
    
    del1_gam1_m1: delay_for_structures
    generic map (
        delay_len => 1
    )
    port map (
        i_ck => ck,
        i_data => gam1_m1,
        o_data => gam1_m1_del1
    );    

    u_gebgef: update_geb_gef
    port map (
        ck => ck,
        eb_m1 => eb_m1_del1,
        ef_m1 => ef_m1_del1,
        gam_m1 => gam_m1_del1,
        gam1_m1 => gam1_m1_del1,
        geb_m1 => geb_m1_del2,
        gef_m1 => gef_m1_del2
    );    


    
    del2_xib1_m1: delay_for_structures
    generic map (
        delay_len => 2
    )
    port map (
        i_ck => ck,
        i_data => xib1_m1,
        o_data => xib1_m1_del2
    );

    del2_xif1_m1: delay_for_structures
    generic map (
        delay_len => 2
    )
    port map (
        i_ck => ck,
        i_data => xif1_m1,
        o_data => xif1_m1_del2
    );

    del1_ef_m1: delay_for_structures
    generic map (
        delay_len => 1
    )
    port map (
        i_ck => ck,
        i_data => ef_m1_del1,
        o_data => ef_m1_del2
    );

    del1_eb_m1: delay_for_structures
    generic map (
        delay_len => 1
    )
    port map (
        i_ck => ck,
        i_data => eb_m1_del1,
        o_data => eb_m1_del2
    );

    u_xi: update_xi
    port map (
        ck => ck,
        eb_m1 => eb_m1_del2,
        ef_m1 => ef_m1_del2,
        geb_m1 => geb_m1_del2,
        gef_m1 => gef_m1_del2,
        xib1_m1 => xib1_m1_del2,
        xif1_m1 => xif1_m1_del2,
        xib_m1 => xib_m1_del3,
        xif_m1 => xif_m1_del3
    );



    del1_xib_m1: delay_for_structures
    generic map (
        delay_len => 1
    )
    port map (
        i_ck => ck,
        i_data => xib_m1_del3,
        o_data => xib_m1_del4
    );

    del2_geb_m1: delay_for_structures
    generic map (
        delay_len => 2
    )
    port map (
        i_ck => ck,
        i_data => geb_m1_del2,
        o_data => geb_m1_del4
    );

    u_kappa_and_beta: update_kappa
    port map (
        ck => ck,
        sel => sel,
        valid => valid,
        ef_m1 => ef_m1_del1,
        eb_m1 => eb_m1_del1,
        beta1_m => beta1_m,
        Kf1_m => Kf1_m,
        Kb1_m => Kb1_m,
        xif_m => xif_m,
        xib_m1 => xib_m1_del4,
        gef_m => gef_m,
        geb_m1 => geb_m1_del4,
        Kf_m => Kf_m_del5,
        Kb_m => Kb_m_del5,
        beta_m1 => beta_m1
    );



    u_feedforward: update_feedforward
    port map (
        ck => ck,
        v1_m => v1_m,
        eb_m => eb_m,
        e_m => e_m,
        beta_m => beta_m,
        ys_m => ys_m,
        e_m1 => e_m1_del3,
        v_m => v_m_del3,
        ys_m1 => ys_m1_del3
    );



    del6_geb_m1: delay_for_structures
    generic map (
        delay_len => 4
    )
    port map (
        i_ck => ck,
        i_data => geb_m1_del4,
        o_data => geb_m1
    );

    del6_gef_m1: delay_for_structures
    generic map (
        delay_len => 6
    )
    port map (
        i_ck => ck,
        i_data => gef_m1_del2,
        o_data => gef_m1
    );
    
    del6_eb_m1: delay_for_structures
    generic map (
        delay_len => 6
    )
    port map (
        i_ck => ck,
        i_data => eb_m1_del2,
        o_data => eb_m1
    );

    del6_ef_m1: delay_for_structures
    generic map (
        delay_len => 6
    )
    port map (
        i_ck => ck,
        i_data => ef_m1_del2,
        o_data => ef_m1
    );

    del7_gam_m1: delay_for_structures
    generic map (
        delay_len => 7
    )
    port map (
        i_ck => ck,
        i_data => gam_m1_del1,
        o_data => gam_m1
    );

    del3_Kb_m: delay_for_structures
    generic map (
        delay_len => 3
    )
    port map (
        i_ck => ck,
        i_data => Kb_m_del5,
        o_data => Kb_m
    );

    del3_Kf_m: delay_for_structures
    generic map (
        delay_len => 3
    )
    port map (
        i_ck => ck,
        i_data => Kf_m_del5,
        o_data => Kf_m
    );

    del4_xib_m: delay_for_structures
    generic map (
        delay_len => 4
    )
    port map (
        i_ck => ck,
        i_data => xib_m1_del4,
        o_data => xib_m1
    );

    del5_xif_m: delay_for_structures
    generic map (
        delay_len => 5
    )
    port map (
        i_ck => ck,
        i_data => xif_m1_del3,
        o_data => xif_m1
    );

    del5_v_m: delay_for_structures
    generic map (
        delay_len => 5
    )
    port map (
        i_ck => ck,
        i_data => v_m_del3,
        o_data => v_m
    );

    del5_e_m1: delay_for_structures
    generic map (
        delay_len => 5
    )
    port map (
        i_ck => ck,
        i_data => e_m1_del3,
        o_data => e_m1
    );

    del5_ys_m1: delay_for_structures
    generic map (
        delay_len => 5
    )    
    port map (
        i_ck => ck,
        i_data => ys_m1_del3,
        o_data => ys_m1
    );    

end structure;