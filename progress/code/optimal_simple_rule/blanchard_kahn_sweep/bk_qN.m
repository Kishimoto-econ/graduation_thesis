clear;
close all

dynare osr_param.mod;

gamma_q_grid = -5:0.25:5;
gamma_Ne_grid = -5:0.25:5;

BK = zeros(length(gamma_q_grid),length(gamma_Ne_grid));

for i = 1:length(gamma_q_grid)

    set_param_value('gamma_q',gamma_q_grid(i));

    for j = 1:length(gamma_Ne_grid)

        set_param_value('gamma_Ne',gamma_Ne_grid(j));
        
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

for i = 1:length(gamma_q_grid)
    for j = 1:length(gamma_Ne_grid)
        if BK(i,j)==0
            plot(gamma_q_grid(i),gamma_Ne_grid(j),'.b','MarkerSize',15)
        end
    end
end

xlabel('\gamma_q')
ylabel('\gamma_Ne')
xlim([-5 5])
ylim([-5 5])
fontsize(16,"points")
grid on
box on

cd C:\Users\Kohsu\Desktop\graduation_thesis\progress\code\optimal_simple_rule\blanchard_kahn_sweep\output
saveas(gcf,'bk_qN.png')
cd C:\Users\Kohsu\Desktop\graduation_thesis\progress\code\optimal_simple_rule\blanchard_kahn_sweep