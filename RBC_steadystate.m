function [ys,check] = RBC_steadystate(ys,exo)
    % function [ys,check] = NK_baseline_steadystate(ys,exo)
    % computes the steady state for the NK_baseline.mod and uses a numerical
    % solver to do so
    % Inputs: 
    %   - ys        [vector] vector of initial values for the steady state of
    %                   the endogenous variables
    %   - exo       [vector] vector of values for the exogenous variables
    %
    % Output: 
    %   - ys        [vector] vector of steady state values fpr the the endogenous variables
    %   - check     [scalar] set to 0 if steady state computation worked and to
    %                    1 of not (allows to impos restriction on parameters)
    check = 0;
    global M_
    % read out parameters to access them with their name
    NumberOfParameters = M_.param_nbr;
    strpar.Init = nan;
    for ii = 1:NumberOfParameters
      paramname = deblank(M_.param_names(ii,:));
      eval([ paramname ' = M_.params(' int2str(ii) ');']);
      strpar.(paramname) = M_.params(ii);
    end
    
    % read out parameters to access them with their name
    NumberOfEndo = M_.endo_nbr;
    strys.Init = nan;
    for ii = 1:NumberOfEndo
      varname = deblank(M_.endo_names(ii,:));
      strys.(varname) = ys(ii);
    end
    
    % read out parameters to access them with their name
    NumberOfExo = M_.exo_nbr;
    strexo.Init = nan;
    for ii = 1:NumberOfExo
      exoname = deblank(M_.exo_names(ii,:));
      strexo.(exoname) = exo(ii);
    end

    %% Enter model equations here
    options = optimset('Display', 'iter', 'TolFun', 1e-20, 'TolX', 1e-20, 'Algorithm', 'levenberg-marquardt', 'MaxFunEval', 1000);
    xstart_vec = nan(strpar.inbsectors_p,1);
    for icosec = 1:strpar.inbsectors_p
        ssec = num2str(icosec);
        xstart_vec(icosec) = strys.(['K_' ssec]);
    end
    
    xopt = fsolve(@FindK, xstart_vec, options, strys, strexo, strpar);
    [~, strys] = FindK(xopt, strys, strexo, strpar);
    %% end own model equations

    for iter = 1:length(M_.params) %update parameters set in the file
      eval([ 'M_.params(' num2str(iter) ') = ' deblank(M_.param_names(iter,:)) ';' ])
    end

    NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
    for ii = 1:NumberOfEndogenousVariables
      varname = deblank(M_.endo_names(ii,:));
      ys(ii) = strys.(varname);
    end
end



function [fval_vec,strys] = FindK(x,strendo,strexo,strpar)

    for icosec = 1:strpar.inbsectors_p
        ssec = num2str(icosec);
        strys.(['K_' ssec]) = x(icosec);
    end
    strys.rf = 1/strpar.beta_p-1;
    strys.r = (1/strpar.beta_p - 1 + strpar.delta_p)/(1 - strpar.tauK_p);
    strys.T = strpar.T0_p + strexo.exo_T;
    for icosec = 1:strpar.inbsectors_p
        ssec = num2str(icosec);
        strys.(['A_' ssec]) = exp(strexo.(['exo_' ssec]));
        strys.(['D_' ssec]) = strpar.(['a_1_' ssec '_p']) + strpar.(['a_2_' ssec '_p']) * strys.T^(strpar.(['a_3_' ssec '_p']));
        strys.(['N_' ssec]) = (strys.r / (strpar.(['alpha_' ssec '_p']) * strys.(['A_' ssec]) * (1 - strys.(['D_' ssec]))))^(1/(1-strpar.(['alpha_' ssec '_p']))) * strys.(['K_' ssec]);
        strys.(['Y_' ssec]) = strys.(['A_' ssec]) * (1 - strys.(['D_' ssec])) * strys.(['K_' ssec])^strpar.(['alpha_' ssec '_p']) * (strys.(['N_' ssec]))^(1 - strpar.(['alpha_' ssec '_p']));
        strys.(['W_' ssec]) = (1 - strpar.(['alpha_' ssec '_p'])) * strys.(['Y_' ssec]) / strys.(['N_' ssec]);
    end
    strys.K = 0;
    for icosec = 1:strpar.inbsectors_p
        strys.K = strys.K + strys.(['K_' num2str(icosec)]);
    end
    strys.Y = 0;
    for icosec = 1:strpar.inbsectors_p
        strys.Y = strys.Y + strys.(['Y_' num2str(icosec)]);
    end
    
    strys.N = 0;
    for icosec = 1:strpar.inbsectors_p
        strys.N = strys.N + strys.(['N_' num2str(icosec)]);
    end
    
    strys.wagebill = 0;
    for icosec = 1:strpar.inbsectors_p
        ssec = num2str(icosec);
        strys.wagebill = strys.wagebill + strys.(['N_' ssec]) * strys.(['W_' ssec]);
    end
    strys.NX = strpar.omegaNX_p * strys.Y * exp(strexo.exo_NX);
    strys.B = strys.NX/strys.rf;
    strys.I = strpar.delta_p * strys.K;

    strys.C = (strys.Y + strys.NX - strys.I - strpar.tauN_p * strys.wagebill  - strpar.tauK_p * strys.r * strys.K) / (1 + strpar.tauC_p);
    strys.G = (strpar.tauN_p * strys.wagebill + strpar.tauK_p * strys.r * strys.K + strpar.tauC_p * strys.C);
    fval_vec = nan(strpar.inbsectors_p,1);
    for icosec = 1:strpar.inbsectors_p
        ssec = num2str(icosec);
        lhs = (1 - strpar.tauN_p) * strys.(['W_' ssec]) * strys.C^(-strpar.sigmaC_p) / (1 + strpar.tauC_p);
        rhs = strpar.phiL_p * strys.(['N_' ssec])^(strpar.sigmaL_p);
        fval_vec(icosec) = lhs - rhs;
    end
end