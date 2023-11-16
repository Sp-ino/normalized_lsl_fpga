library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.dsp_pkg.all;



entity tb is
end tb;


architecture behavioral of tb is

    constant tck: time := 10ns;
    constant sampling_period: time := tck*update_latency;

    constant sequ_len: integer := 100;
    type sequence is array (0 to sequ_len - 1) of integer;

    constant x_sequence: sequence := (19087,10270,1230,5761,-11412,27790,968,29443,4326,14281,-23694,-11488,20414,-10469,9459,-5899,-2221,
        -22108,-20815,16131,-735,-13090,-12537,14119,-921,8413,6499,12390,6562,-21977,6145,18435,11938,-38952,-4486,-5291,5210,-8375,-33,26321,
        13888, 4393, -15130, -1155, 2423, -9127, -5517, 6803, 25523, -40047, -17993, 18393, 9530, -4446, 6786, -16021, -16736, 5205, 24840,
        12279, -8318, 14505, -4065, -11899, -7292, -10042, -3427, 9210, -17431, 5760, 18563, 2458, 11520, -859, 33071, 15141, -29722, 573,
        -29620, 16846, 6465, 10476, 14323, 28711, -5244, -2251, 10089, 16022, -18274, -9012, 653, -40679, 18983, -16815, 18899, -12885, 10401,
        13442, -2884, 9216);

    constant y_sequence: sequence := (4772,4476,3243,2590,-2154,6382,1880,10237,4123,6947,-4063,-3813,1585,-1725,3359,-1576,-199,-6339,-7637,
        -259,-652,-1733,-4517,967,-72,3423,2374,4589,3529,-3599,-5,3025,5442,-6701,-3823,-5667,325,-2102,-325,5739, 6101,5119,-1955,-1363,
        -1023,-2155,-2050,236,6509,-6779,-5951,-1206,2423,1681,2205,-3771,-5107,-1974,5057,6074,1632,4022,-398,-1931,-3419,-4430,-2590,956,
        -3779,618,3474,3047,4982,1183,9334,7007,-2609,-1315,-10320,1307,339,4950,5275,9658,2993,1784,1773,4789,-1957,-2478,-2565,-11006,743,
        -6373,4942,-3013,3202,3112,1663,3360);


    component lsl_core is
        port (
            i_ck: in std_logic;
            i_en: in std_logic;
            i_x: in std_logic_vector (word_len - 1 downto 0);
            i_y: in std_logic_vector (word_len - 1 downto 0);
            o_ys: out std_logic_vector (word_len - 1 downto 0)
        );
    end component;

    signal ck: std_logic;
    signal en: std_logic := '0';
    signal x: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal y: std_logic_vector (word_len - 1 downto 0) := (others => '0');
    signal ys: std_logic_vector (word_len - 1 downto 0) := (others => '0');

begin

    core: lsl_core
    port map (
        i_ck => ck,
        i_en => en,
        i_x => x,
        i_y => y,
        o_ys => ys
    );

    clock_gen: process
    begin
        ck <= '1';
        wait for tck/2;
        ck <= '0';
        wait for tck/2;
    end process clock_gen;

    stimuli: process
    begin

        wait for tck/2;
        en <= '0';
        wait for tck;
        en <= '1';

        wait for 2*tck;

        for idx in 0 to sequ_len - 1 loop
            x <= std_logic_vector(to_signed(x_sequence(idx), 18));
            y <= std_logic_vector(to_signed(y_sequence(idx), 18));
            wait for sampling_period;
        end loop;

    end process stimuli;

end behavioral;
