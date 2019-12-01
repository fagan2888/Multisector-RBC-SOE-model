@# define Sectors = 3

var 
K $K$ (long_name = 'capital stock')
C
B
NX
rf
G
I
r
Y
N
@# for sec in 1:Sectors
    Y_@{sec}
    K_@{sec}
    N_@{sec}
    W_@{sec}
    A_@{sec}
@# endfor
;

varexo 
exo_NX
@# for sec in 1:Sectors
    exo_@{sec}
@# endfor
;
parameters 
@# for sec in 1:Sectors
    alpha_@{sec}_p
@# endfor
beta_p
delta_p
rhoA_p
sigmaL_p
sigmaC_p
phiL_p
tauC_p
tauN_p
tauK_p
omegaNX_p
rhoNX_p
inbsectors_p
;
alpha_mat = [0.4; 0.41; 0.4; 0.44; 0.4];
@# for sec in 1:Sectors
    alpha_@{sec}_p = alpha_mat(@{sec});
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
model;

@# for sec in 1:Sectors
    A_@{sec} = A_@{sec}(-1)^rhoA_p * exp(exo_@{sec})^(1 - rhoA_p);
    
    Y_@{sec} = A_@{sec} * K_@{sec}^alpha_@{sec}_p * (N_@{sec})^(1-alpha_@{sec}_p);

    r = alpha_@{sec}_p * Y_@{sec} / K_@{sec};

    W_@{sec} = (1 - alpha_@{sec}_p) * Y_@{sec} / N_@{sec};

    (1 - tauN_p) * W_@{sec} * C^(-sigmaC_p) / (1 + tauC_p) = phiL_p * N_@{sec}^(sigmaL_p);
@# endfor

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
rf = 1/beta_p-1;
r = (1/beta_p - 1 + delta_p)/(1 - tauK_p);
@# for sec in 1:Sectors
    exo_@{sec} = exo_mat(@{sec});
    A_@{sec} = exp(exo_@{sec});
    K_@{sec} = 10;
    N_@{sec} = (r / alpha_@{sec}_p / A_@{sec})^(1/(1-alpha_@{sec}_p)) * K_@{sec};
    Y_@{sec} = A_@{sec} * K_@{sec}^alpha_@{sec}_p * (N_@{sec})^(1 - alpha_@{sec}_p);
    W_@{sec} = (1 - alpha_@{sec}_p) * Y_@{sec} / N_@{sec};
@# endfor
K = 
@# for sec in 1:Sectors
    + K_@{sec}
@# endfor
;
Y = 
@# for sec in 1:Sectors
 + Y_@{sec}
@# endfor
;
NX = omegaNX_p * Y * exp(exo_NX);
B = -NX/rf;
I = delta_p * K;
C = (
@# for sec in 1:Sectors
    + Y_@{sec}
@# endfor
- I - tauK_p * r * K
@# for sec in 1:Sectors
    - tauN_p * W_@{sec} * N_@{sec}
@# endfor
) / (1 + tauC_p)
;

G = tauC_p * C + tauK_p * r * K
@# for sec in 1:Sectors
    + tauN_p * W_@{sec} * N_@{sec}
@# endfor
;

N = 
@# for sec in 1:Sectors
    + N_@{sec}
@# endfor
;
end;
steady;
check;

exo_mat = [0.75; 0.75; 0.75];
endval;
rf = 1/beta_p-1;
r = (1/beta_p - 1 + delta_p)/(1 - tauK_p);
@# for sec in 1:Sectors
    exo_@{sec} = exo_mat(@{sec});
    A_@{sec} = exp(exo_@{sec});
    K_@{sec} = 10;
    N_@{sec} = (r / alpha_@{sec}_p / A_@{sec})^(1/(1-alpha_@{sec}_p)) * K_@{sec};
    Y_@{sec} = A_@{sec} * K_@{sec}^alpha_@{sec}_p * (N_@{sec})^(1 - alpha_@{sec}_p);
    W_@{sec} = (1 - alpha_@{sec}_p) * Y_@{sec} / N_@{sec};
@# endfor
K = 
@# for sec in 1:Sectors
    + K_@{sec}
@# endfor
;
Y = 
@# for sec in 1:Sectors
 + Y_@{sec}
@# endfor
;
NX = omegaNX_p * Y * exp(exo_NX);
B = -NX / rf;
I = delta_p * K;
C = (
@# for sec in 1:Sectors
    + Y_@{sec}
@# endfor
- I - tauK_p * r * K
@# for sec in 1:Sectors
    - tauN_p * W_@{sec} * N_@{sec}
@# endfor
) / (1 + tauC_p)
;

G = tauC_p * C + tauK_p * r * K
@# for sec in 1:Sectors
    + tauN_p * W_@{sec} * N_@{sec}
@# endfor
;

N = 
@# for sec in 1:Sectors
    + N_@{sec}
@# endfor
;

end;
options_.qz_zero_threshold = 1e-20;
steady;
check;



perfect_foresight_setup(periods = 1000);
perfect_foresight_solver(maxit = 1000);

