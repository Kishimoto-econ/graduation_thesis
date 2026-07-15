clear;
close all

dynare osr_param.mod noclearall;

gamma_N_grid = -1:0.25:1;
gamma_b_grid = -1:0.25:1;
gamma_q_grid = -1:0.25:1;

BK = zeros(length(gamma_N_grid),length(gamma_b_grid),length(gamma_q_grid));

for i = 1:length(gamma_N_grid)

    set_param_value('gamma_N',gamma_N_grid(i));

    for j = 1:length(gamma_b_grid)

        set_param_value('gamma_b',gamma_b_grid(j));

        for v = 1:length(gamma_q_grid)
            set_param_value('gamma_q',gamma_q_grid(v));

            try
                info = stoch_simul(M_,options_,oo_,var_list_);
            catch
                info = 1;
            end
    
            if info == 0
                BK(i,j,v) = 1;
            else
                BK(i,j,v) = 0;
            end
        end
    end
end

figure
hold on

for i = 1:length(gamma_N_grid)
    for j = 1:length(gamma_b_grid)
        for v = 1:length(gamma_q_grid)
            if BK(i,j,v)==1
                plot3(gamma_N_grid(i),gamma_b_grid(j),gamma_q_grid(v),'.b','MarkerSize',15)
            end
        end
    end
end

xlabel('\gamma_N')
ylabel('\gamma_b')
zlabel('\gamma_q')
title('Region satisfying BK conditions')
grid on
box on

view(3)
rotate3d on
axis vis3d

cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\output
saveas(gcf,'bk_3D.png')
cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr