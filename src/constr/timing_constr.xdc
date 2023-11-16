# the -name is useful if I need to refer to
# this clock in another statement
create_clock -period 16.000 -name master_ck [get_ports i_ck]
