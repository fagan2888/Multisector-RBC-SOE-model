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
M_.exo_names = 'exo_NX';
M_.exo_names_tex = 'exo\_NX';
M_.exo_names_long = 'exo_NX';
M_.exo_names = char(M_.exo_names, 'exo_1');
M_.exo_names_tex = char(M_.exo_names_tex, 'exo\_1');
M_.exo_names_long = char(M_.exo_names_long, 'exo_1');
M_.exo_names = char(M_.exo_names, 'exo_2');
M_.exo_names_tex = char(M_.exo_names_tex, 'exo\_2');
M_.exo_names_long = char(M_.exo_names_long, 'exo_2');
M_.exo_names = char(M_.exo_names, 'exo_3');
M_.exo_names_tex = char(M_.exo_names_tex, 'exo\_3');
M_.exo_names_long = char(M_.exo_names_long, 'exo_3');
M_.endo_names = 'K';
M_.endo_names_tex = 'K';
M_.endo_names_long = 'K';
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names_long = char(M_.endo_names_long, 'C');
M_.endo_names = char(M_.endo_names, 'B');
M_.endo_names_tex = char(M_.endo_names_tex, 'B');
M_.endo_names_long = char(M_.endo_names_long, 'B');
M_.endo_names = char(M_.endo_names, 'NX');
M_.endo_names_tex = char(M_.endo_names_tex, 'NX');
M_.endo_names_long = char(M_.endo_names_long, 'NX');
M_.endo_names = char(M_.endo_names, 'rf');
M_.endo_names_tex = char(M_.endo_names_tex, 'rf');
M_.endo_names_long = char(M_.endo_names_long, 'rf');
M_.endo_names = char(M_.endo_names, 'G');
M_.endo_names_tex = char(M_.endo_names_tex, 'G');
M_.endo_names_long = char(M_.endo_names_long, 'G');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'N');
M_.endo_names_tex = char(M_.endo_names_tex, 'N');
M_.endo_names_long = char(M_.endo_names_long, 'N');
M_.endo_names = char(M_.endo_names, 'Y_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y\_1');
M_.endo_names_long = char(M_.endo_names_long, 'Y_1');
M_.endo_names = char(M_.endo_names, 'K_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_1');
M_.endo_names_long = char(M_.endo_names_long, 'K_1');
M_.endo_names = char(M_.endo_names, 'N_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'N\_1');
M_.endo_names_long = char(M_.endo_names_long, 'N_1');
M_.endo_names = char(M_.endo_names, 'W_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'W\_1');
M_.endo_names_long = char(M_.endo_names_long, 'W_1');
M_.endo_names = char(M_.endo_names, 'A_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'A\_1');
M_.endo_names_long = char(M_.endo_names_long, 'A_1');
M_.endo_names = char(M_.endo_names, 'Y_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y\_2');
M_.endo_names_long = char(M_.endo_names_long, 'Y_2');
M_.endo_names = char(M_.endo_names, 'K_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_2');
M_.endo_names_long = char(M_.endo_names_long, 'K_2');
M_.endo_names = char(M_.endo_names, 'N_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'N\_2');
M_.endo_names_long = char(M_.endo_names_long, 'N_2');
M_.endo_names = char(M_.endo_names, 'W_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'W\_2');
M_.endo_names_long = char(M_.endo_names_long, 'W_2');
M_.endo_names = char(M_.endo_names, 'A_2');
M_.endo_names_tex = char(M_.endo_names_tex, 'A\_2');
M_.endo_names_long = char(M_.endo_names_long, 'A_2');
M_.endo_names = char(M_.endo_names, 'Y_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y\_3');
M_.endo_names_long = char(M_.endo_names_long, 'Y_3');
M_.endo_names = char(M_.endo_names, 'K_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'K\_3');
M_.endo_names_long = char(M_.endo_names_long, 'K_3');
M_.endo_names = char(M_.endo_names, 'N_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'N\_3');
M_.endo_names_long = char(M_.endo_names_long, 'N_3');
M_.endo_names = char(M_.endo_names, 'W_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'W\_3');
M_.endo_names_long = char(M_.endo_names_long, 'W_3');
M_.endo_names = char(M_.endo_names, 'A_3');
M_.endo_names_tex = char(M_.endo_names_tex, 'A\_3');
M_.endo_names_long = char(M_.endo_names_long, 'A_3');
M_.endo_partitions = struct();
M_.param_names = 'alpha_1_p';
M_.param_names_tex = 'alpha\_1\_p';
M_.param_names_long = 'alpha_1_p';
M_.param_names = char(M_.param_names, 'alpha_2_p');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_2\_p');
M_.param_names_long = char(M_.param_names_long, 'alpha_2_p');
M_.param_names = char(M_.param_names, 'alpha_3_p');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_3\_p');
M_.param_names_long = char(M_.param_names_long, 'alpha_3_p');
M_.param_names = char(M_.param_names, 'beta_p');
M_.param_names_tex = char(M_.param_names_tex, 'beta\_p');
M_.param_names_long = char(M_.param_names_long, 'beta_p');
M_.param_names = char(M_.param_names, 'delta_p');
M_.param_names_tex = char(M_.param_names_tex, 'delta\_p');
M_.param_names_long = char(M_.param_names_long, 'delta_p');
M_.param_names = char(M_.param_names, 'rhoA_p');
M_.param_names_tex = char(M_.param_names_tex, 'rhoA\_p');
M_.param_names_long = char(M_.param_names_long, 'rhoA_p');
M_.param_names = char(M_.param_names, 'sigmaL_p');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaL\_p');
M_.param_names_long = char(M_.param_names_long, 'sigmaL_p');
M_.param_names = char(M_.param_names, 'sigmaC_p');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaC\_p');
M_.param_names_long = char(M_.param_names_long, 'sigmaC_p');
M_.param_names = char(M_.param_names, 'phiL_p');
M_.param_names_tex = char(M_.param_names_tex, 'phiL\_p');
M_.param_names_long = char(M_.param_names_long, 'phiL_p');
M_.param_names = char(M_.param_names, 'tauC_p');
M_.param_names_tex = char(M_.param_names_tex, 'tauC\_p');
M_.param_names_long = char(M_.param_names_long, 'tauC_p');
M_.param_names = char(M_.param_names, 'tauN_p');
M_.param_names_tex = char(M_.param_names_tex, 'tauN\_p');
M_.param_names_long = char(M_.param_names_long, 'tauN_p');
M_.param_names = char(M_.param_names, 'tauK_p');
M_.param_names_tex = char(M_.param_names_tex, 'tauK\_p');
M_.param_names_long = char(M_.param_names_long, 'tauK_p');
M_.param_names = char(M_.param_names, 'omegaNX_p');
M_.param_names_tex = char(M_.param_names_tex, 'omegaNX\_p');
M_.param_names_long = char(M_.param_names_long, 'omegaNX_p');
M_.param_names = char(M_.param_names, 'rhoNX_p');
M_.param_names_tex = char(M_.param_names_tex, 'rhoNX\_p');
M_.param_names_long = char(M_.param_names_long, 'rhoNX_p');
M_.param_names = char(M_.param_names, 'inbsectors_p');
M_.param_names_tex = char(M_.param_names_tex, 'inbsectors\_p');
M_.param_names_long = char(M_.param_names_long, 'inbsectors_p');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 25;
M_.param_nbr = 15;
M_.orig_endo_nbr = 25;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
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
M_.orig_eq_nbr = 25;
M_.eq_nbr = 25;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 7 0;
 0 8 32;
 2 9 0;
 3 10 0;
 0 11 33;
 0 12 0;
 0 13 0;
 0 14 34;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 0;
 0 20 0;
 4 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 5 26 0;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 6 31 0;]';
M_.nstatic = 16;
M_.nfwrd   = 3;
M_.npred   = 6;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 6;
M_.ndynamic   = 9;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(25, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(15, 1);
M_.NNZDerivatives = [95; 0; -1];
alpha_mat = [0.4; 0.41; 0.4; 0.44; 0.4];
M_.params( 1 ) = alpha_mat(1);
alpha_1_p = M_.params( 1 );
M_.params( 2 ) = alpha_mat(2);
alpha_2_p = M_.params( 2 );
M_.params( 3 ) = alpha_mat(3);
alpha_3_p = M_.params( 3 );
M_.params( 10 ) = 0;
tauC_p = M_.params( 10 );
M_.params( 11 ) = 0;
tauN_p = M_.params( 11 );
M_.params( 12 ) = 0;
tauK_p = M_.params( 12 );
M_.params( 4 ) = 0.99;
beta_p = M_.params( 4 );
M_.params( 5 ) = 0.05;
delta_p = M_.params( 5 );
M_.params( 7 ) = 1;
sigmaL_p = M_.params( 7 );
M_.params( 8 ) = 1;
sigmaC_p = M_.params( 8 );
M_.params( 9 ) = 1;
phiL_p = M_.params( 9 );
M_.params( 6 ) = 0.9;
rhoA_p = M_.params( 6 );
M_.params( 13 ) = 1e-6;
omegaNX_p = M_.params( 13 );
M_.params( 14 ) = 0.9;
rhoNX_p = M_.params( 14 );
M_.params( 15 ) = 3;
inbsectors_p = M_.params( 15 );
exo_mat = [0; 0; 0];
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 5 ) = 1/M_.params(4)-1;
oo_.steady_state( 8 ) = (1/M_.params(4)-1+M_.params(5))/(1-M_.params(12));
oo_.exo_steady_state( 2 ) = exo_mat(1);
oo_.steady_state( 15 ) = exp(oo_.exo_steady_state(2));
oo_.steady_state( 12 ) = 10;
oo_.steady_state( 13 ) = (oo_.steady_state(8)/M_.params(1)/oo_.steady_state(15))^(1/(1-M_.params(1)))*oo_.steady_state(12);
oo_.steady_state( 11 ) = oo_.steady_state(15)*oo_.steady_state(12)^M_.params(1)*oo_.steady_state(13)^(1-M_.params(1));
oo_.steady_state( 14 ) = (1-M_.params(1))*oo_.steady_state(11)/oo_.steady_state(13);
oo_.exo_steady_state( 3 ) = exo_mat(2);
oo_.steady_state( 20 ) = exp(oo_.exo_steady_state(3));
oo_.steady_state( 17 ) = 10;
oo_.steady_state( 18 ) = (oo_.steady_state(8)/M_.params(2)/oo_.steady_state(20))^(1/(1-M_.params(2)))*oo_.steady_state(17);
oo_.steady_state( 16 ) = oo_.steady_state(20)*oo_.steady_state(17)^M_.params(2)*oo_.steady_state(18)^(1-M_.params(2));
oo_.steady_state( 19 ) = (1-M_.params(2))*oo_.steady_state(16)/oo_.steady_state(18);
oo_.exo_steady_state( 4 ) = exo_mat(3);
oo_.steady_state( 25 ) = exp(oo_.exo_steady_state(4));
oo_.steady_state( 22 ) = 10;
oo_.steady_state( 23 ) = (oo_.steady_state(8)/M_.params(3)/oo_.steady_state(25))^(1/(1-M_.params(3)))*oo_.steady_state(22);
oo_.steady_state( 21 ) = oo_.steady_state(25)*oo_.steady_state(22)^M_.params(3)*oo_.steady_state(23)^(1-M_.params(3));
oo_.steady_state( 24 ) = (1-M_.params(3))*oo_.steady_state(21)/oo_.steady_state(23);
oo_.steady_state( 1 ) = oo_.steady_state(22)+oo_.steady_state(12)+oo_.steady_state(17);
oo_.steady_state( 9 ) = oo_.steady_state(21)+oo_.steady_state(11)+oo_.steady_state(16);
oo_.steady_state( 4 ) = M_.params(13)*oo_.steady_state(9)*exp(oo_.exo_steady_state(1));
oo_.steady_state( 3 ) = (-oo_.steady_state(4))/oo_.steady_state(5);
oo_.steady_state( 7 ) = M_.params(5)*oo_.steady_state(1);
oo_.steady_state( 2 ) = (oo_.steady_state(21)+oo_.steady_state(11)+oo_.steady_state(16)-oo_.steady_state(7)-oo_.steady_state(1)*M_.params(12)*oo_.steady_state(8)-oo_.steady_state(13)*M_.params(11)*oo_.steady_state(14)-oo_.steady_state(18)*M_.params(11)*oo_.steady_state(19)-oo_.steady_state(23)*M_.params(11)*oo_.steady_state(24))/(1+M_.params(10));
oo_.steady_state( 6 ) = oo_.steady_state(23)*M_.params(11)*oo_.steady_state(24)+oo_.steady_state(18)*M_.params(11)*oo_.steady_state(19)+oo_.steady_state(13)*M_.params(11)*oo_.steady_state(14)+oo_.steady_state(1)*M_.params(12)*oo_.steady_state(8)+M_.params(10)*oo_.steady_state(2);
oo_.steady_state( 10 ) = oo_.steady_state(23)+oo_.steady_state(13)+oo_.steady_state(18);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
exo_mat = [0.75; 0.75; 0.75];
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.steady_state( 5 ) = 1/M_.params(4)-1;
oo_.steady_state( 8 ) = (1/M_.params(4)-1+M_.params(5))/(1-M_.params(12));
oo_.exo_steady_state( 2 ) = exo_mat(1);
oo_.steady_state( 15 ) = exp(oo_.exo_steady_state(2));
oo_.steady_state( 12 ) = 10;
oo_.steady_state( 13 ) = (oo_.steady_state(8)/M_.params(1)/oo_.steady_state(15))^(1/(1-M_.params(1)))*oo_.steady_state(12);
oo_.steady_state( 11 ) = oo_.steady_state(15)*oo_.steady_state(12)^M_.params(1)*oo_.steady_state(13)^(1-M_.params(1));
oo_.steady_state( 14 ) = (1-M_.params(1))*oo_.steady_state(11)/oo_.steady_state(13);
oo_.exo_steady_state( 3 ) = exo_mat(2);
oo_.steady_state( 20 ) = exp(oo_.exo_steady_state(3));
oo_.steady_state( 17 ) = 10;
oo_.steady_state( 18 ) = (oo_.steady_state(8)/M_.params(2)/oo_.steady_state(20))^(1/(1-M_.params(2)))*oo_.steady_state(17);
oo_.steady_state( 16 ) = oo_.steady_state(20)*oo_.steady_state(17)^M_.params(2)*oo_.steady_state(18)^(1-M_.params(2));
oo_.steady_state( 19 ) = (1-M_.params(2))*oo_.steady_state(16)/oo_.steady_state(18);
oo_.exo_steady_state( 4 ) = exo_mat(3);
oo_.steady_state( 25 ) = exp(oo_.exo_steady_state(4));
oo_.steady_state( 22 ) = 10;
oo_.steady_state( 23 ) = (oo_.steady_state(8)/M_.params(3)/oo_.steady_state(25))^(1/(1-M_.params(3)))*oo_.steady_state(22);
oo_.steady_state( 21 ) = oo_.steady_state(25)*oo_.steady_state(22)^M_.params(3)*oo_.steady_state(23)^(1-M_.params(3));
oo_.steady_state( 24 ) = (1-M_.params(3))*oo_.steady_state(21)/oo_.steady_state(23);
oo_.steady_state( 1 ) = oo_.steady_state(22)+oo_.steady_state(12)+oo_.steady_state(17);
oo_.steady_state( 9 ) = oo_.steady_state(21)+oo_.steady_state(11)+oo_.steady_state(16);
oo_.steady_state( 4 ) = M_.params(13)*oo_.steady_state(9)*exp(oo_.exo_steady_state(1));
oo_.steady_state( 3 ) = (-oo_.steady_state(4))/oo_.steady_state(5);
oo_.steady_state( 7 ) = M_.params(5)*oo_.steady_state(1);
oo_.steady_state( 2 ) = (oo_.steady_state(21)+oo_.steady_state(11)+oo_.steady_state(16)-oo_.steady_state(7)-oo_.steady_state(1)*M_.params(12)*oo_.steady_state(8)-oo_.steady_state(13)*M_.params(11)*oo_.steady_state(14)-oo_.steady_state(18)*M_.params(11)*oo_.steady_state(19)-oo_.steady_state(23)*M_.params(11)*oo_.steady_state(24))/(1+M_.params(10));
oo_.steady_state( 6 ) = oo_.steady_state(23)*M_.params(11)*oo_.steady_state(24)+oo_.steady_state(18)*M_.params(11)*oo_.steady_state(19)+oo_.steady_state(13)*M_.params(11)*oo_.steady_state(14)+oo_.steady_state(1)*M_.params(12)*oo_.steady_state(8)+M_.params(10)*oo_.steady_state(2);
oo_.steady_state( 10 ) = oo_.steady_state(23)+oo_.steady_state(13)+oo_.steady_state(18);
options_.qz_zero_threshold = 1e-20;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
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
