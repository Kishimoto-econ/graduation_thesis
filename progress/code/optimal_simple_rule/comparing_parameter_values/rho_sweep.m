clear
close all

dynare osr_param noclearall

rho_grid = 0.1:0.2:0.9;
IRF = cell(length(rho_grid),1);

for i = 1:length(rho_grid)

    set_param_value('rho',rho_grid(i));
    steady;
    try
        [info, oo_] = stoch_simul(M_,options_,oo_,var_list_);

    
    catch ME
        fprintf('rho=%f\n', rho_grid(i));
        disp(ME.message)
    end   

    IRF{i}=oo_.irfs;
end

var_list = {'Y','q','N','k','b','phi','mu'};

for v = 1:length(var_list)

    figure
    hold on

    for i = 1:length(rho_grid)
        if ~isempty(IRF{i})
            plot(IRF{i}.([var_list{v} '_eN']), 'LineWidth', 2)
        end
    end

    title(var_list{v})
    legend(compose('\\rho=%.1f', rho_grid), ...
        "Position", [0.7724 0.5538 0.1110 0.2151])
    grid on
    hold off
    cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\comparing_parameter_values\output\rho_sweep
    saveas(gcf,[num2str(var_list{v}),'_rho_sweep.png'])
    cd C:\Users\Kohsu\OneDrive\Desktop\graduation_thesis\code\osr\comparing_parameter_values
end