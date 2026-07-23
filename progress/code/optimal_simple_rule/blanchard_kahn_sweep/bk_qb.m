clear;
close all

dynare osr_param.mod noclearall;

gamma_q_grid = -1:0.05:1;
gamma_b_grid = -1:0.05:1;

BK = zeros(length(gamma_q_grid),length(gamma_b_grid));

for i = 1:length(gamma_q_grid)

    set_param_value('gamma_q',gamma_q_grid(i));

    for j = 1:length(gamma_b_grid)

        set_param_value('gamma_b',gamma_b_grid(j));

        try
            info = stoch_simul(M_,options_,oo_,var_list_);
        catch
            info = 1;
        end

        if info == 0
            BK(i,j) = 1;
        else
            BK(i,j) = 0;
        end

    end
end

figure
hold on

for i = 1:length(gamma_q_grid)
    for j = 1:length(gamma_b_grid)
        if BK(i,j)==1
            plot(gamma_q_grid(i),gamma_b_grid(j),'.b','MarkerSize',15)
        end
    end
end

xlabel('\gamma_q')
ylabel('\gamma_b')
title('Region satisfying BK conditions')
grid on
box on

cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\blanchard_kahn_sweep\output
saveas(gcf,'bk_qb.png')
cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\blanchard_kahn_sweep