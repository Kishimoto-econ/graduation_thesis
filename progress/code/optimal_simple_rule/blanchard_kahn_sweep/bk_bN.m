clear;
close all

dynare osr_param.mod;

gamma_b_grid = -1:0.05:1;
gamma_N_grid = -1:0.05:1;

BK = zeros(length(gamma_b_grid),length(gamma_N_grid));

for i = 1:length(gamma_b_grid)

    set_param_value('gamma_b',gamma_b_grid(i));

    for j = 1:length(gamma_N_grid)

        set_param_value('gamma_N',gamma_N_grid(j));
        
        steady;
        
        try
            stoch_simul(M_,options_,oo_,var_list_);

            BK(i,j) = 0;
        catch    
            BK(i,j) = 1;
        end
    end
end

figure
hold on

for i = 1:length(gamma_b_grid)
    for j = 1:length(gamma_N_grid)
        if BK(i,j)==0
            plot(gamma_b_grid(i),gamma_N_grid(j),'.b','MarkerSize',15)
        end
    end
end

xlabel('\gamma_b')
ylabel('\gamma_N')
title('Region satisfying BK conditions')
xlim([-1 1])
ylim([-1 1])
grid on
box on

cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\blanchard_kahn_sweep\output
saveas(gcf,'bk_qb.png')
cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\blanchard_kahn_sweep