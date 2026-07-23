clear;
close all

dynare osr_param.mod noclearall;

gamma_N_grid = -1:0.05:1;
gamma_b_grid = -1:0.05:1;

solu = zeros(length(gamma_N_grid),length(gamma_b_grid));

for i = 1:length(gamma_N_grid)

    set_param_value('gamma_N',gamma_N_grid(i));

    for j = 1:length(gamma_b_grid)

        set_param_value('gamma_b',gamma_b_grid(j));
        steady;
        try
            [info, oo_] = stoch_simul(M_,options_,oo_,var_list_);
        catch
            info = 1;
        end

        if info == 0
            solu(i,j) = 1;
        else
            solu(i,j) = 0;
        end

    end
end

figure
hold on

for i = 1:length(gamma_N_grid)
    for j = 1:length(gamma_b_grid)
        if solu(i,j)==1
            plot(gamma_N_grid(i),gamma_b_grid(j),'.b','MarkerSize',15)
        end
    end
end

xlabel('\gamma_N')
ylabel('\gamma_b')
title('解の決定領域')
grid on
box on

cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\blanchard_kahn_sweep\output
saveas(gcf,'bk_bN.png')
cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\blanchard_kahn_sweep

