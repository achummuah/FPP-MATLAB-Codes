function phi_wrapped = compute_phase(I1, I2, I3)

phi_wrapped = atan2( sqrt(3)*(I1 - I3), ...
                     (2*I2 - I1 - I3) );

end