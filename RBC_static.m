function [residual, g1, g2, g3] = RBC_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 29, 1);

%
% Model equations
%

T14 = exp(x(3))^(1-params(15));
T32 = y(14)^params(1);
T36 = y(15)^(1-params(1));
T53 = y(2)^(-params(17));
T67 = exp(x(4))^(1-params(15));
T84 = y(20)^params(5);
T88 = y(21)^(1-params(5));
T108 = exp(x(5))^(1-params(15));
T125 = y(26)^params(9);
T129 = y(27)^(1-params(9));
lhs =y(17);
rhs =y(17)^params(15)*T14;
residual(1)= lhs-rhs;
lhs =y(13);
rhs =params(2)*y(11)+params(3)*y(11)^params(4);
residual(2)= lhs-rhs;
lhs =y(12);
rhs =y(17)*(1-y(13))*T32*T36;
residual(3)= lhs-rhs;
lhs =y(8);
rhs =y(12)*params(1)/y(14);
residual(4)= lhs-rhs;
lhs =y(16);
rhs =y(12)*(1-params(1))/y(15);
residual(5)= lhs-rhs;
lhs =y(16)*(1-params(20))*T53/(1+params(19));
rhs =params(18)*y(15)^params(16);
residual(6)= lhs-rhs;
lhs =y(23);
rhs =y(23)^params(15)*T67;
residual(7)= lhs-rhs;
lhs =y(19);
rhs =y(11)*params(6)+params(7)*y(11)^params(8);
residual(8)= lhs-rhs;
lhs =y(18);
rhs =y(23)*(1-y(19))*T84*T88;
residual(9)= lhs-rhs;
lhs =y(8);
rhs =y(18)*params(5)/y(20);
residual(10)= lhs-rhs;
lhs =y(22);
rhs =y(18)*(1-params(5))/y(21);
residual(11)= lhs-rhs;
lhs =T53*(1-params(20))*y(22)/(1+params(19));
rhs =params(18)*y(21)^params(16);
residual(12)= lhs-rhs;
lhs =y(29);
rhs =y(29)^params(15)*T108;
residual(13)= lhs-rhs;
lhs =y(25);
rhs =y(11)*params(10)+params(11)*y(11)^params(12);
residual(14)= lhs-rhs;
lhs =y(24);
rhs =y(29)*(1-y(25))*T125*T129;
residual(15)= lhs-rhs;
lhs =y(8);
rhs =y(24)*params(9)/y(26);
residual(16)= lhs-rhs;
lhs =y(28);
rhs =y(24)*(1-params(9))/y(27);
residual(17)= lhs-rhs;
lhs =T53*(1-params(20))*y(28)/(1+params(19));
rhs =params(18)*y(27)^params(16);
residual(18)= lhs-rhs;
lhs =y(11);
rhs =params(25)+x(1);
residual(19)= lhs-rhs;
lhs =y(24)+y(12)+y(18);
rhs =y(2)+y(7)+y(6)-y(4);
residual(20)= lhs-rhs;
lhs =y(4);
rhs =(-(y(3)-y(3)*(1+y(5))));
residual(21)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(23)+(1-params(23))*exp(x(2))*params(22)*y(9);
residual(22)= lhs-rhs;
lhs =(1+y(5))*T53*params(13);
rhs =T53-0.05*(y(3)-(y(3)));
residual(23)= lhs-rhs;
lhs =y(6);
rhs =y(2)*params(19)+y(8)*params(21)*y(1)+y(15)*y(16)*params(20)+y(21)*params(20)*y(22)+y(27)*params(20)*y(28);
residual(24)= lhs-rhs;
lhs =y(1);
rhs =y(7)+y(1)*(1-params(14));
residual(25)= lhs-rhs;
lhs =y(1);
rhs =y(26)+y(14)+y(20);
residual(26)= lhs-rhs;
lhs =y(9);
rhs =y(24)+y(12)+y(18);
residual(27)= lhs-rhs;
lhs =params(13)*T53/(1+params(19))*(1+y(8)*(1-params(21))-params(14));
rhs =T53/(1+params(19));
residual(28)= lhs-rhs;
lhs =y(10);
rhs =y(27)+y(15)+y(21);
residual(29)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(29, 29);

  %
  % Jacobian matrix
  %

T225 = getPowerDeriv(y(2),(-params(17)),1);
T287 = (1-params(20))*T53/(1+params(19));
  g1(1,17)=1-T14*getPowerDeriv(y(17),params(15),1);
  g1(2,11)=(-(params(2)+params(3)*getPowerDeriv(y(11),params(4),1)));
  g1(2,13)=1;
  g1(3,12)=1;
  g1(3,13)=(-(T36*T32*(-y(17))));
  g1(3,14)=(-(T36*y(17)*(1-y(13))*getPowerDeriv(y(14),params(1),1)));
  g1(3,15)=(-(y(17)*(1-y(13))*T32*getPowerDeriv(y(15),1-params(1),1)));
  g1(3,17)=(-(T36*(1-y(13))*T32));
  g1(4,8)=1;
  g1(4,12)=(-(params(1)/y(14)));
  g1(4,14)=(-((-(y(12)*params(1)))/(y(14)*y(14))));
  g1(5,12)=(-((1-params(1))/y(15)));
  g1(5,15)=(-((-(y(12)*(1-params(1))))/(y(15)*y(15))));
  g1(5,16)=1;
  g1(6,2)=y(16)*(1-params(20))*T225/(1+params(19));
  g1(6,15)=(-(params(18)*getPowerDeriv(y(15),params(16),1)));
  g1(6,16)=T287;
  g1(7,23)=1-T67*getPowerDeriv(y(23),params(15),1);
  g1(8,11)=(-(params(6)+params(7)*getPowerDeriv(y(11),params(8),1)));
  g1(8,19)=1;
  g1(9,18)=1;
  g1(9,19)=(-(T88*T84*(-y(23))));
  g1(9,20)=(-(T88*y(23)*(1-y(19))*getPowerDeriv(y(20),params(5),1)));
  g1(9,21)=(-(y(23)*(1-y(19))*T84*getPowerDeriv(y(21),1-params(5),1)));
  g1(9,23)=(-(T88*(1-y(19))*T84));
  g1(10,8)=1;
  g1(10,18)=(-(params(5)/y(20)));
  g1(10,20)=(-((-(y(18)*params(5)))/(y(20)*y(20))));
  g1(11,18)=(-((1-params(5))/y(21)));
  g1(11,21)=(-((-(y(18)*(1-params(5))))/(y(21)*y(21))));
  g1(11,22)=1;
  g1(12,2)=(1-params(20))*y(22)*T225/(1+params(19));
  g1(12,21)=(-(params(18)*getPowerDeriv(y(21),params(16),1)));
  g1(12,22)=T287;
  g1(13,29)=1-T108*getPowerDeriv(y(29),params(15),1);
  g1(14,11)=(-(params(10)+params(11)*getPowerDeriv(y(11),params(12),1)));
  g1(14,25)=1;
  g1(15,24)=1;
  g1(15,25)=(-(T129*T125*(-y(29))));
  g1(15,26)=(-(T129*y(29)*(1-y(25))*getPowerDeriv(y(26),params(9),1)));
  g1(15,27)=(-(y(29)*(1-y(25))*T125*getPowerDeriv(y(27),1-params(9),1)));
  g1(15,29)=(-(T129*(1-y(25))*T125));
  g1(16,8)=1;
  g1(16,24)=(-(params(9)/y(26)));
  g1(16,26)=(-((-(y(24)*params(9)))/(y(26)*y(26))));
  g1(17,24)=(-((1-params(9))/y(27)));
  g1(17,27)=(-((-(y(24)*(1-params(9))))/(y(27)*y(27))));
  g1(17,28)=1;
  g1(18,2)=(1-params(20))*y(28)*T225/(1+params(19));
  g1(18,27)=(-(params(18)*getPowerDeriv(y(27),params(16),1)));
  g1(18,28)=T287;
  g1(19,11)=1;
  g1(20,2)=(-1);
  g1(20,4)=1;
  g1(20,6)=(-1);
  g1(20,7)=(-1);
  g1(20,12)=1;
  g1(20,18)=1;
  g1(20,24)=1;
  g1(21,3)=1-(1+y(5));
  g1(21,4)=1;
  g1(21,5)=(-y(3));
  g1(22,4)=1-params(23);
  g1(22,9)=(-((1-params(23))*exp(x(2))*params(22)));
  g1(23,2)=(1+y(5))*params(13)*T225-T225;
  g1(23,5)=T53*params(13);
  g1(24,1)=(-(y(8)*params(21)));
  g1(24,2)=(-params(19));
  g1(24,6)=1;
  g1(24,8)=(-(params(21)*y(1)));
  g1(24,15)=(-(y(16)*params(20)));
  g1(24,16)=(-(y(15)*params(20)));
  g1(24,21)=(-(params(20)*y(22)));
  g1(24,22)=(-(params(20)*y(21)));
  g1(24,27)=(-(params(20)*y(28)));
  g1(24,28)=(-(params(20)*y(27)));
  g1(25,1)=1-(1-params(14));
  g1(25,7)=(-1);
  g1(26,1)=1;
  g1(26,14)=(-1);
  g1(26,20)=(-1);
  g1(26,26)=(-1);
  g1(27,9)=1;
  g1(27,12)=(-1);
  g1(27,18)=(-1);
  g1(27,24)=(-1);
  g1(28,2)=(1+y(8)*(1-params(21))-params(14))*params(13)*T225/(1+params(19))-T225/(1+params(19));
  g1(28,8)=params(13)*T53/(1+params(19))*(1-params(21));
  g1(29,10)=1;
  g1(29,15)=(-1);
  g1(29,21)=(-1);
  g1(29,27)=(-1);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],29,841);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],29,24389);
end
end
end
end
