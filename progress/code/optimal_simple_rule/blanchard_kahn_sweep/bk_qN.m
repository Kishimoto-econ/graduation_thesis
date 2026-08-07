clear;
close all

dynare osr_param.mod;

gamma_q_grid = -1:0.05:1;
gamma_N_grid = -1:0.05:1;

BK = zeros(length(gamma_q_grid),length(gamma_N_grid));

for i = 1:length(gamma_q_grid)

    set_param_value('gamma_q',gamma_q_grid(i));

    for j = 1:length(gamma_N_grid)

        set_param_value('gamma_N',gamma_N_grid(j));
        
        steady;
        check(M_,options_,oo_);

        try
            stoch_simul(M_,options_,oo_,var_list_);
    
            eigval = oo_.dr.eigval;
            nunstable = sum(abs(eigval) > 1);
            
            if nunstable == M_.nfwrd
                BK(i,j) = 0;
                disp('BK条件を満たす')
            else
                BK(i,j) = 1;
                disp('BK条件を満たさない')
            end
        catch
            BK(i,j)=NaN;
        end

    end
end

figure
hold on

for i = 1:length(gamma_q_grid)
    for j = 1:length(gamma_N_grid)
        if BK(i,j)==0
            plot(gamma_q_grid(i),gamma_N_grid(j),'.b','MarkerSize',15)
        end
    end
end

xlabel('\gamma_q')
ylabel('\gamma_N')
title('Region satisfying BK conditions')
xlim([-1 1])
ylim([-1 1])
grid on
box on

cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\blanchard_kahn_sweep\output
saveas(gcf,'bk_qb.png')
cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\blanchard_kahn_sweep