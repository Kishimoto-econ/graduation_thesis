clear
close all

dynare osr_param noclearall

gamma_q_grid = -0.3:0.1:0.3;
IRF = cell(length(gamma_q_grid),1);

for i = 1:length(gamma_q_grid)

    set_param_value('gamma_q',gamma_q_grid(i));

    [info, oo_] = stoch_simul(M_,options_,oo_,var_list_);

    if info
        fprintf('gamma_q=%4.2f failed\n',gamma_q_grid(i));
        continue
    end
    
    steady;

    IRF{i}=oo_.irfs;

end

var_list = {'Y','q','N','k','b','phi','mu'};

for v = 1:length(var_list)

    figure
    hold on

    for i = 1:length(gamma_q_grid)
        if ~isempty(IRF{i})
            plot(IRF{i}.([var_list{v} '_eN']), 'LineWidth', 2)
        end
    end

    title(var_list{v})
    legend(compose('\\gamma_q=%.1f', gamma_q_grid), ...
        "Position", [0.7724 0.5538 0.1110 0.2151])
    grid on
    hold off

end