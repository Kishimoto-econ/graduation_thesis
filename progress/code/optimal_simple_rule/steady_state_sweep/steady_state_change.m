clear
close all

dynare osr_param noclearall

rho_grid = 0.1:0.01:0.9; % rhoが高いと自己資本比率が高くなる

nrho = length(rho_grid);
nEndo  = M_.endo_nbr;

steady_state_all = NaN(nrho,nEndo);

for i = 1:nrho

    set_param_value('rho',rho_grid(i));
    steady;

    try
        
        [info, oo_] = stoch_simul(M_,options_,oo_,var_list_);

        steady_state_all(i,:) = oo_.steady_state;

    catch
        disp([num2str(rho_grid(i)),' BK condition not satisfied']);
    end
    
end

var_list = {'Y','q','N','k','b'};

for v = 1:length(var_list)

    idx = find(strcmp(M_.endo_names, var_list{v}));

    figure
    plot(rho_grid,steady_state_all(:,idx))

    xlabel('\rho')
    ylabel(var_list{v})
    title([var_list{v},' steady state'])
    grid on

    cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\steady_state_sweep\output
    saveas(gcf,[var_list{v},'_steady_state_rho.png'])
    cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\steady_state_sweep
end


