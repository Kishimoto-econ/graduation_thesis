clear
close all

dynare osr_param noclearall

m_grid = 0.8:0.01:1.5; % mが高いと自己資本比率が高くなる

nm = length(m_grid);
nEndo  = M_.endo_nbr;

steady_state_all = NaN(nm,nEndo);

for i = 1:nm

    set_param_value('m',m_grid(i));
    steady;

    try
        
        [info, oo_] = stoch_simul(M_,options_,oo_,var_list_);

        steady_state_all(i,:) = oo_.steady_state;

    catch
        disp([num2str(m_grid(i)),' BK condition not satisfied']);
    end
    
end

var_list = {'xp'};

for v = 1:length(var_list)

    idx = find(strcmp(M_.endo_names, var_list{v}));

    figure
    plot(m_grid,steady_state_all(:,idx))

    xlabel('\m')
    ylabel(var_list{v})
    title([var_list{v},' steady state'])
    grid on

    cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\steady_state_sweep\output
    saveas(gcf,[var_list{v},'_steady_state_m.png'])
    cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\steady_state_sweep
end


