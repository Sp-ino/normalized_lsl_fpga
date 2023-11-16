clear
close all

filter_len = 3;
sequ_len = 500;

rng(0, 'v4');
x = 0.5*randn(sequ_len, 1);

X = zeros(sequ_len, filter_len);
for i = 1 : filter_len
    X(:, i) = filter([zeros(1, i-1) 1], 1, x);
end

M = [0.25 0.1 0.1]';
y = X*M;


input_sequ = round(x*2^15);
output_sequ = round(y*2^15);

tb_data = [input_sequ, output_sequ];

writematrix(tb_data, "tb_data.txt");