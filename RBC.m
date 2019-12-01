%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'RBC';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('RBC.log');
M_.exo_names = 'exo_T';
M_.exo_names_tex = '{\eta_{T}}';
M_.exo_names_long = 'exogenus temperature';
M_.exo_names = char(M_.exo_names, 'exo_NX');
M_.exo_names_tex = char(M_.exo_names_tex, '{\eta_{NX}}');
M_.exo_names_long = char(M_.exo_names_long, 'exogenus net exports');
M_.exo_names = char(M_.exo_names, 'exo_1');
M_.exo_names_tex = char(M_.exo_names_tex, '{\eta_{NX}}');
M_.exo_names_long = char(M_.exo_names_long, 'exogenus TFP');
M_.exo_names = char(M_.exo_names, 'exo_2');
M_.exo_names_tex = char(M_.exo_names_tex, '{\eta_{NX}}');
M_.exo_names_long = char(M_.exo_names_long, 'exogenus TFP');
M_.exo_names = char(M_.exo_names, 'exo_3');
M_.exo_names_tex = char(M_.exo_names_tex, '{\eta_{NX}}');
M_.exo_names_long = char(M_.exo_names_long, 'exogenus TFP');
M_.endo_names = 'K';
M_.endo_names_tex = 'K';
M_.endo_names_long = 'capital stock';
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names_long = char(M_.endo_names_long, 'consumption');
M_.endo_names = char(M_.endo_names, 'B');
M_.endo_names_tex = char(M_.endo_names_tex, 'B');
M_.endo_names_long = char(M_.endo_names_long, 'international traded bonds');
M_.endo_names = char(M_.endo_names, 'NX');
M_.endo_names_tex = char(M_.endo_names_tex, 'NX');
M_.endo_names_long = char(M_.endo_names_long, 'net exports');
M_.endo_names = char(M_.endo_names, 'rf');
M_.endo_names_tex = char(M_.endo_names_tex, 'rf');
M_.endo_names_long = char(M_.endo_names_long, 'foreign interest rate');
M_.endo_names = char(M_.endo_names, 'G');
M_.endo_names_tex = char(M_.endo_names_tex, 'G');
M_.endo_names_long = char(M_.endo_names_long, 'government exenditure');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'private investment');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'rental rate of capital');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'GDP');
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'labour');
M_.endo_names = char(M_.endo_names, 'T');
M_.endo_names_tex = char(M_.endo_names_tex, 'T');
M_.endo_names_long = char(M_.endo_names_long, 'temperature');
M_.endo_names = char(M_.endo_names, 'Y_1');
M_.endo_names_tex = char(M_.endo_names_tex, '{Y_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector GDP');
M_.endo_names = char(M_.endo_names, 'D_1');
M_.endo_names_tex = char(M_.endo_names_tex, '{D_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector damages');
M_.endo_names = char(M_.endo_names, 'K_1');
M_.endo_names_tex = char(M_.endo_names_tex, '{K_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector capital');
M_.endo_names = char(M_.endo_names, 'N_1');
M_.endo_names_tex = char(M_.endo_names_tex, '{N_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector employment');
M_.endo_names = char(M_.endo_names, 'W_1');
M_.endo_names_tex = char(M_.endo_names_tex, '{W_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector wages');
M_.endo_names = char(M_.endo_names, 'A_1');
M_.endo_names_tex = char(M_.endo_names_tex, '{A_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector TFP');
M_.endo_names = char(M_.endo_names, 'Y_2');
M_.endo_names_tex = char(M_.endo_names_tex, '{Y_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector GDP');
M_.endo_names = char(M_.endo_names, 'D_2');
M_.endo_names_tex = char(M_.endo_names_tex, '{D_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector damages');
M_.endo_names = char(M_.endo_names, 'K_2');
M_.endo_names_tex = char(M_.endo_names_tex, '{K_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector capital');
M_.endo_names = char(M_.endo_names, 'N_2');
M_.endo_names_tex = char(M_.endo_names_tex, '{N_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector employment');
M_.endo_names = char(M_.endo_names, 'W_2');
M_.endo_names_tex = char(M_.endo_names_tex, '{W_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector wages');
M_.endo_names = char(M_.endo_names, 'A_2');
M_.endo_names_tex = char(M_.endo_names_tex, '{A_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector TFP');
M_.endo_names = char(M_.endo_names, 'Y_3');
M_.endo_names_tex = char(M_.endo_names_tex, '{Y_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector GDP');
M_.endo_names = char(M_.endo_names, 'D_3');
M_.endo_names_tex = char(M_.endo_names_tex, '{D_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector damages');
M_.endo_names = char(M_.endo_names, 'K_3');
M_.endo_names_tex = char(M_.endo_names_tex, '{K_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector capital');
M_.endo_names = char(M_.endo_names, 'N_3');
M_.endo_names_tex = char(M_.endo_names_tex, '{N_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector employment');
M_.endo_names = char(M_.endo_names, 'W_3');
M_.endo_names_tex = char(M_.endo_names_tex, '{W_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector wages');
M_.endo_names = char(M_.endo_names, 'A_3');
M_.endo_names_tex = char(M_.endo_names_tex, '{A_k}');
M_.endo_names_long = char(M_.endo_names_long, 'sector TFP');
M_.endo_partitions = struct();
M_.param_names = 'alpha_1_p';
M_.param_names_tex = '{\alpha_{k}}';
M_.param_names_long = 'sector capital share';
M_.param_names = char(M_.param_names, 'a_1_1_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_1_{k}}');
M_.param_names_long = char(M_.param_names_long, 'intercept of damage function');
M_.param_names = char(M_.param_names, 'a_2_1_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_2_{k}}');
M_.param_names_long = char(M_.param_names_long, 'slope of damage function');
M_.param_names = char(M_.param_names, 'a_3_1_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_2_{k}}');
M_.param_names_long = char(M_.param_names_long, 'exponent of damage function');
M_.param_names = char(M_.param_names, 'alpha_2_p');
M_.param_names_tex = char(M_.param_names_tex, '{\alpha_{k}}');
M_.param_names_long = char(M_.param_names_long, 'sector capital share');
M_.param_names = char(M_.param_names, 'a_1_2_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_1_{k}}');
M_.param_names_long = char(M_.param_names_long, 'intercept of damage function');
M_.param_names = char(M_.param_names, 'a_2_2_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_2_{k}}');
M_.param_names_long = char(M_.param_names_long, 'slope of damage function');
M_.param_names = char(M_.param_names, 'a_3_2_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_2_{k}}');
M_.param_names_long = char(M_.param_names_long, 'exponent of damage function');
M_.param_names = char(M_.param_names, 'alpha_3_p');
M_.param_names_tex = char(M_.param_names_tex, '{\alpha_{k}}');
M_.param_names_long = char(M_.param_names_long, 'sector capital share');
M_.param_names = char(M_.param_names, 'a_1_3_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_1_{k}}');
M_.param_names_long = char(M_.param_names_long, 'intercept of damage function');
M_.param_names = char(M_.param_names, 'a_2_3_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_2_{k}}');
M_.param_names_long = char(M_.param_names_long, 'slope of damage function');
M_.param_names = char(M_.param_names, 'a_3_3_p');
M_.param_names_tex = char(M_.param_names_tex, '{a_2_{k}}');
M_.param_names_long = char(M_.param_names_long, 'exponent of damage function');
M_.param_names = char(M_.param_names, 'beta_p');
M_.param_names_tex = char(M_.param_names_tex, '{\beta}');
M_.param_names_long = char(M_.param_names_long, 'discount factor');
M_.param_names = char(M_.param_names, 'delta_p');
M_.param_names_tex = char(M_.param_names_tex, '{\delta}');
M_.param_names_long = char(M_.param_names_long, 'capital depreciation rate');
M_.param_names = char(M_.param_names, 'rhoA_p');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_{A}}');
M_.param_names_long = char(M_.param_names_long, 'persistency in TFP');
M_.param_names = char(M_.param_names, 'sigmaL_p');
M_.param_names_tex = char(M_.param_names_tex, '{\sigma_{L}}');
M_.param_names_long = char(M_.param_names_long, 'inverse Firsch elasticity');
M_.param_names = char(M_.param_names, 'sigmaC_p');
M_.param_names_tex = char(M_.param_names_tex, '{\sigma_{C}}');
M_.param_names_long = char(M_.param_names_long, 'intertemporal elasticity of substitution');
M_.param_names = char(M_.param_names, 'phiL_p');
M_.param_names_tex = char(M_.param_names_tex, '{\phi_{L}}');
M_.param_names_long = char(M_.param_names_long, 'coefficient of disutility to work');
M_.param_names = char(M_.param_names, 'tauC_p');
M_.param_names_tex = char(M_.param_names_tex, '{\tau_{C}}');
M_.param_names_long = char(M_.param_names_long, 'consumption tax');
M_.param_names = char(M_.param_names, 'tauN_p');
M_.param_names_tex = char(M_.param_names_tex, '{\tau_{N}}');
M_.param_names_long = char(M_.param_names_long, 'labour tax');
M_.param_names = char(M_.param_names, 'tauK_p');
M_.param_names_tex = char(M_.param_names_tex, '{\tau_{K}}');
M_.param_names_long = char(M_.param_names_long, 'capital tax');
M_.param_names = char(M_.param_names, 'omegaNX_p');
M_.param_names_tex = char(M_.param_names_tex, '{\omega_{NX}}');
M_.param_names_long = char(M_.param_names_long, 'share of net exports relative to domestic GDP');
M_.param_names = char(M_.param_names, 'rhoNX_p');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_{NX}}');
M_.param_names_long = char(M_.param_names_long, 'persistency in net exports');
M_.param_names = char(M_.param_names, 'inbsectors_p');
M_.param_names_tex = char(M_.param_names_tex, '{K}');
M_.param_names_long = char(M_.param_names_long, 'number of sectors');
M_.param_names = char(M_.param_names, 'T0_p');
M_.param_names_tex = char(M_.param_names_tex, '{T_0}');
M_.param_names_long = char(M_.param_names_long, 'initial temperature');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 5;
M_.endo_nbr = 29;
M_.param_nbr = 25;
M_.orig_endo_nbr = 29;
M_.aux_vars = [];
M_.Sigma_e = zeros(5, 5);
M_.Correlation_matrix = eye(5, 5);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('RBC_static');
erase_compiled_function('RBC_dynamic');
M_.orig_eq_nbr = 29;
M_.eq_nbr = 29;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 7 0;
 0 8 36;
 2 9 0;
 3 10 0;
 0 11 37;
 0 12 0;
 0 13 0;
 0 14 38;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 0;
 0 20 0;
 0 21 0;
 0 22 0;
 4 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 5 29 0;
 0 30 0;
 0 31 0;
 0 32 0;
 0 33 0;
 0 34 0;
 6 35 0;]';
M_.nstatic = 20;
M_.nfwrd   = 3;
M_.npred   = 6;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 6;
M_.ndynamic   = 9;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:5];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(29, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(5, 1);
M_.params = NaN(25, 1);
M_.NNZDerivatives = [106; 0; -1];
alpha_mat = [0.4; 0.41; 0.4; 0.44; 0.4];
M_.params( 1 ) = alpha_mat(1);
alpha_1_p = M_.params( 1 );
M_.params( 2 ) = 0;
a_1_1_p = M_.params( 2 );
M_.params( 3 ) = 0.00236;
a_2_1_p = M_.params( 3 );
M_.params( 4 ) = 2;
a_3_1_p = M_.params( 4 );
M_.params( 5 ) = alpha_mat(2);
alpha_2_p = M_.params( 5 );
M_.params( 6 ) = 0;
a_1_2_p = M_.params( 6 );
M_.params( 7 ) = 0.00236;
a_2_2_p = M_.params( 7 );
M_.params( 8 ) = 2;
a_3_2_p = M_.params( 8 );
M_.params( 9 ) = alpha_mat(3);
alpha_3_p = M_.params( 9 );
M_.params( 10 ) = 0;
a_1_3_p = M_.params( 10 );
M_.params( 11 ) = 0.00236;
a_2_3_p = M_.params( 11 );
M_.params( 12 ) = 2;
a_3_3_p = M_.params( 12 );
M_.params( 19 ) = 0;
tauC_p = M_.params( 19 );
M_.params( 20 ) = 0;
tauN_p = M_.params( 20 );
M_.params( 21 ) = 0;
tauK_p = M_.params( 21 );
M_.params( 13 ) = 0.99;
beta_p = M_.params( 13 );
M_.params( 14 ) = 0.05;
delta_p = M_.params( 14 );
M_.params( 16 ) = 1;
sigmaL_p = M_.params( 16 );
M_.params( 17 ) = 1;
sigmaC_p = M_.params( 17 );
M_.params( 18 ) = 1;
phiL_p = M_.params( 18 );
M_.params( 15 ) = 0.9;
rhoA_p = M_.params( 15 );
M_.params( 22 ) = 1e-6;
omegaNX_p = M_.params( 22 );
M_.params( 23 ) = 0.9;
rhoNX_p = M_.params( 23 );
M_.params( 24 ) = 3;
inbsectors_p = M_.params( 24 );
M_.params( 25 ) = 0.85;
T0_p = M_.params( 25 );
exo_mat = [0; 0; 0];
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 14 ) = 10;
oo_.exo_steady_state( 3 ) = exo_mat(1);
oo_.steady_state( 20 ) = 10;
oo_.exo_steady_state( 4 ) = exo_mat(2);
oo_.steady_state( 26 ) = 10;
oo_.exo_steady_state( 5 ) = exo_mat(3);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
exo_mat = [0; 0; 0];
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.exo_steady_state( 1 ) = 1.6;
oo_.steady_state( 14 ) = 10;
oo_.exo_steady_state( 3 ) = exo_mat(1);
oo_.steady_state( 20 ) = 10;
oo_.exo_steady_state( 4 ) = exo_mat(2);
oo_.steady_state( 26 ) = 10;
oo_.exo_steady_state( 5 ) = exo_mat(3);
options_.qz_zero_threshold = 1e-20;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:10,'value',0.16) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',11:20,'value',0.32) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',21:30,'value',0.48) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',31:40,'value',0.64) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',41:50,'value',0.82) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',51:60,'value',1) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',61:70,'value',1.16) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',71:80,'value',1.32) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',81:90,'value',1.48) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',91:100,'value',1.64) ];
M_.exo_det_length = 0;
options_.periods = 1000;
perfect_foresight_setup;
options_.simul.maxit = 1000;
perfect_foresight_solver;
save('RBC_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('RBC_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('RBC_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('RBC_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('RBC_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('RBC_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('RBC_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
