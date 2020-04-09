function [T] = theor(m, num_of_trans, num_of_bits, tries)
    T = m * num_of_trans / (num_of_bits * tries);
end