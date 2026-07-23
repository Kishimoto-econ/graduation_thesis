%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'KM_Linear';
M_.dynare_version = '6.4';
oo_.dynare_version = '6.4';
options_.dynare_version = '6.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'eb'};
M_.exo_names_tex(1) = {'eb'};
M_.exo_names_long(1) = {'eb'};
M_.endo_names = cell(10,1);
M_.endo_names_tex = cell(10,1);
M_.endo_names_long = cell(10,1);
M_.endo_names(1) = {'q_hat'};
M_.endo_names_tex(1) = {'q\_hat'};
M_.endo_names_long(1) = {'q_hat'};
M_.endo_names(2) = {'phi_til'};
M_.endo_names_tex(2) = {'phi\_til'};
M_.endo_names_long(2) = {'phi_til'};
M_.endo_names(3) = {'k_hat'};
M_.endo_names_tex(3) = {'k\_hat'};
M_.endo_names_long(3) = {'k_hat'};
M_.endo_names(4) = {'kp_hat'};
M_.endo_names_tex(4) = {'kp\_hat'};
M_.endo_names_long(4) = {'kp_hat'};
M_.endo_names(5) = {'b_hat'};
M_.endo_names_tex(5) = {'b\_hat'};
M_.endo_names_long(5) = {'b_hat'};
M_.endo_names(6) = {'x_hat'};
M_.endo_names_tex(6) = {'x\_hat'};
M_.endo_names_long(6) = {'x_hat'};
M_.endo_names(7) = {'xp_hat'};
M_.endo_names_tex(7) = {'xp\_hat'};
M_.endo_names_long(7) = {'xp_hat'};
M_.endo_names(8) = {'mu_til'};
M_.endo_names_tex(8) = {'mu\_til'};
M_.endo_names_long(8) = {'mu_til'};
M_.endo_names(9) = {'C_hat'};
M_.endo_names_tex(9) = {'C\_hat'};
M_.endo_names_long(9) = {'C_hat'};
M_.endo_names(10) = {'Y_hat'};
M_.endo_names_tex(10) = {'Y\_hat'};
M_.endo_names_long(10) = {'Y_hat'};
M_.endo_partitions = struct();
M_.param_names = cell(16,1);
M_.param_names_tex = cell(16,1);
M_.param_names_long = cell(16,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'alpha'};
M_.param_names_long(1) = {'alpha'};
M_.param_names(2) = {'m'};
M_.param_names_tex(2) = {'m'};
M_.param_names_long(2) = {'m'};
M_.param_names(3) = {'K_bar'};
M_.param_names_tex(3) = {'K\_bar'};
M_.param_names_long(3) = {'K_bar'};
M_.param_names(4) = {'betap'};
M_.param_names_tex(4) = {'betap'};
M_.param_names_long(4) = {'betap'};
M_.param_names(5) = {'beta'};
M_.param_names_tex(5) = {'beta'};
M_.param_names_long(5) = {'beta'};
M_.param_names(6) = {'a'};
M_.param_names_tex(6) = {'a'};
M_.param_names_long(6) = {'a'};
M_.param_names(7) = {'c'};
M_.param_names_tex(7) = {'c'};
M_.param_names_long(7) = {'c'};
M_.param_names(8) = {'z'};
M_.param_names_tex(8) = {'z'};
M_.param_names_long(8) = {'z'};
M_.param_names(9) = {'kss'};
M_.param_names_tex(9) = {'kss'};
M_.param_names_long(9) = {'kss'};
M_.param_names(10) = {'kpss'};
M_.param_names_tex(10) = {'kpss'};
M_.param_names_long(10) = {'kpss'};
M_.param_names(11) = {'bss'};
M_.param_names_tex(11) = {'bss'};
M_.param_names_long(11) = {'bss'};
M_.param_names(12) = {'qss'};
M_.param_names_tex(12) = {'qss'};
M_.param_names_long(12) = {'qss'};
M_.param_names(13) = {'xss'};
M_.param_names_tex(13) = {'xss'};
M_.param_names_long(13) = {'xss'};
M_.param_names(14) = {'xpss'};
M_.param_names_tex(14) = {'xpss'};
M_.param_names_long(14) = {'xpss'};
M_.param_names(15) = {'muss'};
M_.param_names_tex(15) = {'muss'};
M_.param_names_long(15) = {'muss'};
M_.param_names(16) = {'phiss'};
M_.param_names_tex(16) = {'phiss'};
M_.param_names_long(16) = {'phiss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 10;
M_.param_nbr = 16;
M_.orig_endo_nbr = 10;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 10;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 4 14;
 0 5 15;
 1 6 0;
 2 7 0;
 3 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [2; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , 'b_hat' ;
  3 , 'name' , 'x_hat' ;
  4 , 'name' , 'phi_til' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'C_hat' ;
  10 , 'name' , 'Y_hat' ;
};
M_.mapping.q_hat.eqidx = [2 5 6 ];
M_.mapping.phi_til.eqidx = [4 5 ];
M_.mapping.k_hat.eqidx = [1 2 3 7 8 ];
M_.mapping.kp_hat.eqidx = [6 7 8 ];
M_.mapping.b_hat.eqidx = [1 2 ];
M_.mapping.x_hat.eqidx = [1 3 7 9 ];
M_.mapping.xp_hat.eqidx = [7 9 ];
M_.mapping.mu_til.eqidx = [4 5 ];
M_.mapping.C_hat.eqidx = [9 10 ];
M_.mapping.Y_hat.eqidx = [10 ];
M_.mapping.eb.eqidx = [2 5 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 8;
M_.block_structure.block(1).endo_nbr = 5;
M_.block_structure.block(1).mfs = 5;
M_.block_structure.block(1).equation = [ 3 8 1 2 6];
M_.block_structure.block(1).variable = [ 6 4 3 5 1];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 15;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [3 4 6 7 8 9 10 15 ];
M_.block_structure.block(2).Simulation_Type = 7;
M_.block_structure.block(2).endo_nbr = 2;
M_.block_structure.block(2).mfs = 2;
M_.block_structure.block(2).equation = [ 4 5];
M_.block_structure.block(2).variable = [ 8 2];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 6;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 2 0 ];
M_.block_structure.block(3).Simulation_Type = 3;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 7];
M_.block_structure.block(3).variable = [ 7];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [1 ];
M_.block_structure.block(4).Simulation_Type = 1;
M_.block_structure.block(4).endo_nbr = 2;
M_.block_structure.block(4).mfs = 2;
M_.block_structure.block(4).equation = [ 9 10];
M_.block_structure.block(4).variable = [ 9 10];
M_.block_structure.block(4).is_linear = true;
M_.block_structure.block(4).NNZDerivatives = 3;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [3 4 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([1 3 3 1 3 2 5 2 3 4 3 4 5 4 5 ]);
M_.block_structure.block(1).g1_sparse_colval = int32([3 3 4 6 6 7 7 8 8 8 9 9 10 15 15 ]);
M_.block_structure.block(1).g1_sparse_colptr = int32([1 1 1 3 4 4 6 8 11 13 14 14 14 14 14 16 ]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 2 1 2 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 1 2 2 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 3 5 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(4).g1_sparse_rowval = int32([]);
M_.block_structure.block(4).g1_sparse_colval = int32([]);
M_.block_structure.block(4).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 6 4 3 5 1 8 2 7 9 10];
M_.block_structure.equation_reordered = [ 3 8 1 2 6 4 5 7 9 10];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 1 3;
 1 5;
 3 3;
 7 3;
 7 4;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 3;
 1 5;
 1 6;
 2 3;
 2 5;
 3 6;
 4 2;
 4 8;
 5 1;
 5 2;
 5 8;
 6 1;
 6 4;
 7 6;
 7 7;
 8 3;
 8 4;
 9 6;
 9 7;
 9 9;
 10 9;
 10 10;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 2 1;
 4 2;
 5 1;
 5 2;
 6 1;
];
M_.block_structure.dyn_tmp_nbr = 1;
M_.state_var = [4 3 5 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(16, 1);
M_.endo_trends = struct('deflator', cell(10, 1), 'log_deflator', cell(10, 1), 'growth_factor', cell(10, 1), 'log_growth_factor', cell(10, 1));
M_.NNZDerivatives = [34; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([1 3 7 7 1 5 6 4 5 1 2 8 6 8 1 2 1 3 7 9 7 9 4 5 9 10 10 2 5 6 4 5 2 5 ]);
M_.dynamic_g1_sparse_colval = int32([3 3 3 4 5 11 11 12 12 13 13 13 14 14 15 15 16 16 16 16 17 17 18 18 19 19 20 21 21 21 22 22 31 31 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 4 5 6 6 6 6 6 6 8 10 13 15 17 21 23 25 27 28 31 33 33 33 33 33 33 33 33 33 35 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'qss*kss*k_hat+bss/betap*b_hat(-1)+xss*x_hat'; 
'b_hat'; 
'x_hat'; 
'phi_til'; 
'qss*(1+phiss)*q_hat+qss*phi_til+phi_til(1)*c*beta'; 
'qss*q_hat'; 
'xss*x_hat+m*xpss*xp_hat'; 
'kss*k_hat+kp_hat*kpss*m'; 
'C_hat'; 
'Y_hat'; 
};
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 6;
M_.block_structure_stat.block(1).endo_nbr = 5;
M_.block_structure_stat.block(1).mfs = 5;
M_.block_structure_stat.block(1).equation = [ 1 2 3 6 8];
M_.block_structure_stat.block(1).variable = [ 5 3 6 1 4];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 2;
M_.block_structure_stat.block(2).mfs = 2;
M_.block_structure_stat.block(2).equation = [ 4 5];
M_.block_structure_stat.block(2).variable = [ 8 2];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 7];
M_.block_structure_stat.block(3).variable = [ 7];
M_.block_structure_stat.block(4).Simulation_Type = 1;
M_.block_structure_stat.block(4).endo_nbr = 2;
M_.block_structure_stat.block(4).mfs = 2;
M_.block_structure_stat.block(4).equation = [ 9 10];
M_.block_structure_stat.block(4).variable = [ 9 10];
M_.block_structure_stat.variable_reordered = [ 5 3 6 1 4 8 2 7 9 10];
M_.block_structure_stat.equation_reordered = [ 1 2 3 6 8 4 5 7 9 10];
M_.block_structure_stat.incidence.sparse_IM = [
 1 3;
 1 5;
 1 6;
 2 1;
 2 3;
 2 5;
 3 3;
 3 6;
 4 2;
 4 8;
 5 1;
 5 2;
 5 8;
 6 1;
 6 4;
 7 3;
 7 4;
 7 6;
 7 7;
 8 3;
 8 4;
 9 6;
 9 7;
 9 9;
 10 9;
 10 10;
];
M_.block_structure_stat.tmp_nbr = 1;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 2 1 2 3 5 1 3 2 4 4 5 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 1 2 2 2 2 3 3 4 4 5 5 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 3 7 9 11 13 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 2 1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 2 2 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 3 5 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([2 5 6 4 5 1 2 3 7 8 6 7 8 1 2 1 3 7 9 7 9 4 5 9 10 10 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 3 3 3 3 3 4 4 4 5 5 6 6 6 6 7 7 8 8 9 9 10 ]);
M_.static_g1_sparse_colptr = int32([1 4 6 11 14 16 20 22 24 26 27 ]);
M_.params(1) = 0.3333333333333333;
alpha = M_.params(1);
M_.params(2) = 0.5;
m = M_.params(2);
M_.params(3) = 1;
K_bar = M_.params(3);
M_.params(4) = 0.99;
betap = M_.params(4);
M_.params(5) = 0.98;
beta = M_.params(5);
M_.params(6) = 0.7;
a = M_.params(6);
M_.params(7) = 0.3;
c = M_.params(7);
M_.params(8) = 0.01;
z = M_.params(8);
options_resid_ = struct();
display_static_residuals(M_, options_, oo_, options_resid_);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
model_diagnostics(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.0001;
options_.ar = 0;
options_.irf = 12;
options_.order = 1;
var_list_ = {'k_hat';'kp_hat';'b_hat';'q_hat';'x_hat';'xp_hat';'mu_til';'phi_til';'Y_hat'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
M_.endo_names(oo_.dr.state_var,:)


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'KM_Linear_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'KM_Linear_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'KM_Linear_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'KM_Linear_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'KM_Linear_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'KM_Linear_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'KM_Linear_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'KM_Linear_results.mat'], 'options_mom_', '-append');
end
disp('Note: 10 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
