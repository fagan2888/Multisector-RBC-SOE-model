@# define Sectors = 3

var 
K $K$ (long_name = 'capital stock')
C $C$ (long_name = 'consumption')
B $B$ (long_name = 'international traded bonds')
NX $NX$ (long_name = 'net exports')
rf $rf$ (long_name = 'foreign interest rate')
G $G$ (long_name = 'government exenditure')
I $I$ (long_name = 'private investment')
r $r$ (long_name = 'rental rate of capital')
Y $Y$ (long_name = 'GDP')
N $N$ (long_name = 'labour')
T $T$ (long_name = 'temperature')
@# for sec in 1:Sectors
    Y_@{sec} ${Y_k}$ (long_name = 'sector GDP')
    D_@{sec} ${D_k}$ (long_name = 'sector damages')
    K_@{sec} ${K_k}$ (long_name = 'sector capital')
    N_@{sec} ${N_k}$ (long_name = 'sector employment')
    W_@{sec} ${W_k}$ (long_name = 'sector wages')
    A_@{sec} ${A_k}$ (long_name = 'sector TFP')
@# endfor
;

varexo 
exo_T ${\eta_{T}}$ (long_name = 'exogenus temperature')
exo_NX ${\eta_{NX}}$ (long_name = 'exogenus net exports')
@# for sec in 1:Sectors
    exo_@{sec} ${\eta_{NX}}$ (long_name = 'exogenus TFP')
@# endfor
;
parameters 
@# for sec in 1:Sectors
    alpha_@{sec}_p ${\alpha_{k}}$ (long_name = 'sector capital share')
    a_1_@{sec}_p ${a_1_{k}}$ (long_name = 'intercept of damage function')
    a_2_@{sec}_p ${a_2_{k}}$ (long_name = 'slope of damage function')
    a_3_@{sec}_p ${a_2_{k}}$ (long_name = 'exponent of damage function')
@# endfor
beta_p ${\beta}$ (long_name = 'discount factor')
delta_p ${\delta}$ (long_name = 'capital depreciation rate')
rhoA_p ${\rho_{A}}$ (long_name = 'persistency in TFP')
sigmaL_p ${\sigma_{L}}$ (long_name = 'inverse Firsch elasticity')
sigmaC_p ${\sigma_{C}}$ (long_name = 'intertemporal elasticity of substitution')
phiL_p ${\phi_{L}}$ (long_name = 'coefficient of disutility to work')
tauC_p  ${\tau_{C}}$ (long_name = 'consumption tax')
tauN_p ${\tau_{N}}$ (long_name = 'labour tax')
tauK_p  ${\tau_{K}}$ (long_name = 'capital tax')
omegaNX_p  ${\omega_{NX}}$ (long_name = 'share of net exports relative to domestic GDP')
rhoNX_p  ${\rho_{NX}}$ (long_name = 'persistency in net exports')
inbsectors_p  ${K}$ (long_name = 'number of sectors')
T0_p ${T_0}$ (long_name = 'initial temperature')
;
alpha_mat = [0.4; 0.41; 0.4; 0.44; 0.4];
@# for sec in 1:Sectors
    alpha_@{sec}_p = alpha_mat(@{sec});
    a_1_@{sec}_p = 0;
    a_2_@{sec}_p = 0.00236;
    a_3_@{sec}_p = 2;
@# endfor
tauC_p = 0;
tauN_p = 0;
tauK_p = 0;
beta_p = 0.99;
delta_p = 0.05;
sigmaL_p = 1;
sigmaC_p = 1;
phiL_p = 1;
rhoA_p = 0.9;
omegaNX_p = 1e-6;
rhoNX_p = 0.9;
inbsectors_p = @{Sectors};
T0_p = 0.85;
model;

@# for sec in 1:Sectors
    A_@{sec} = A_@{sec}(-1)^rhoA_p * exp(exo_@{sec})^(1 - rhoA_p);

    D_@{sec} = a_1_@{sec}_p * T + a_2_@{sec}_p * T^(a_3_@{sec}_p);
    
    Y_@{sec} = (1 - D_@{sec}) * A_@{sec} * K_@{sec}^alpha_@{sec}_p * (N_@{sec})^(1-alpha_@{sec}_p);

    r = alpha_@{sec}_p * Y_@{sec} / K_@{sec};

    W_@{sec} = (1 - alpha_@{sec}_p) * Y_@{sec} / N_@{sec};

    (1 - tauN_p) * W_@{sec} * C^(-sigmaC_p) / (1 + tauC_p) = phiL_p * N_@{sec}^(sigmaL_p);
@# endfor

T = T0_p + exo_T;

@# for sec in 1:Sectors
+ Y_@{sec}
@# endfor
= 
C + I + G - NX;

NX = -(B - (1 + rf) * B(-1));

NX = rhoNX_p * NX(-1) + (1 - rhoNX_p) * exp(exo_NX) * omegaNX_p * Y;

C(+1)^(-sigmaC_p) * beta_p * (1 + rf(+1)) = C^(-sigmaC_p) - 0.05*(B - steady_state(B));

G = tauC_p * C + tauK_p * r * K(-1) 
@# for sec in 1:Sectors
    + tauN_p * W_@{sec} * N_@{sec}
@# endfor
;

K = (1 - delta_p) * K(-1) + I;

K(-1) = 
@# for sec in 1:Sectors
 + K_@{sec}
@# endfor
;

Y = 
@# for sec in 1:Sectors
 + Y_@{sec}
@# endfor
;

C(+1)^(-sigmaC_p)/(1 + tauC_p) * beta_p * (1 + r(+1) * (1 - tauK_p) - delta_p) = C^(-sigmaC_p)/(1 + tauC_p);

N = 
@# for sec in 1:Sectors
    + N_@{sec}
@# endfor
;
end;
exo_mat = [0; 0; 0];
initval;
@# for sec in 1:Sectors
    K_@{sec} = 10;
    exo_@{sec} = exo_mat(@{sec});
@# endfor
end;
steady;
check;

exo_mat = [0; 0; 0];
endval;
exo_T = 1.6;
@# for sec in 1:Sectors
    K_@{sec} = 10;
    exo_@{sec} = exo_mat(@{sec});
@# endfor

end;
options_.qz_zero_threshold = 1e-20;
steady;
check;


shocks;
var exo_T;
periods 1:10 11:20 21:30 31:40 41:50 51:60 61:70 71:80 81:90 91:100;
values 0.16 0.32 0.48 0.64 0.82 1 1.16 1.32 1.48 1.64;
end;

perfect_foresight_setup(periods = 1000);
perfect_foresight_solver(maxit = 1000);

