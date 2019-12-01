function [residual, g1, g2, g3] = RBC_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(29, 1);
T11 = y(4)^params(15);
T15 = exp(x(it_, 3))^(1-params(15));
T33 = y(20)^params(1);
T37 = y(21)^(1-params(1));
T54 = y(8)^(-params(17));
T66 = y(5)^params(15);
T69 = exp(x(it_, 4))^(1-params(15));
T86 = y(26)^params(5);
T90 = y(27)^(1-params(5));
T108 = y(6)^params(15);
T111 = exp(x(it_, 5))^(1-params(15));
T128 = y(32)^params(9);
T132 = y(33)^(1-params(9));
T183 = y(36)^(-params(17));
lhs =y(23);
rhs =T11*T15;
residual(1)= lhs-rhs;
lhs =y(19);
rhs =params(2)*y(17)+params(3)*y(17)^params(4);
residual(2)= lhs-rhs;
lhs =y(18);
rhs =y(23)*(1-y(19))*T33*T37;
residual(3)= lhs-rhs;
lhs =y(14);
rhs =y(18)*params(1)/y(20);
residual(4)= lhs-rhs;
lhs =y(22);
rhs =y(18)*(1-params(1))/y(21);
residual(5)= lhs-rhs;
lhs =y(22)*(1-params(20))*T54/(1+params(19));
rhs =params(18)*y(21)^params(16);
residual(6)= lhs-rhs;
lhs =y(29);
rhs =T66*T69;
residual(7)= lhs-rhs;
lhs =y(25);
rhs =y(17)*params(6)+params(7)*y(17)^params(8);
residual(8)= lhs-rhs;
lhs =y(24);
rhs =y(29)*(1-y(25))*T86*T90;
residual(9)= lhs-rhs;
lhs =y(14);
rhs =y(24)*params(5)/y(26);
residual(10)= lhs-rhs;
lhs =y(28);
rhs =y(24)*(1-params(5))/y(27);
residual(11)= lhs-rhs;
lhs =T54*(1-params(20))*y(28)/(1+params(19));
rhs =params(18)*y(27)^params(16);
residual(12)= lhs-rhs;
lhs =y(35);
rhs =T108*T111;
residual(13)= lhs-rhs;
lhs =y(31);
rhs =y(17)*params(10)+params(11)*y(17)^params(12);
residual(14)= lhs-rhs;
lhs =y(30);
rhs =y(35)*(1-y(31))*T128*T132;
residual(15)= lhs-rhs;
lhs =y(14);
rhs =y(30)*params(9)/y(32);
residual(16)= lhs-rhs;
lhs =y(34);
rhs =y(30)*(1-params(9))/y(33);
residual(17)= lhs-rhs;
lhs =T54*(1-params(20))*y(34)/(1+params(19));
rhs =params(18)*y(33)^params(16);
residual(18)= lhs-rhs;
lhs =y(17);
rhs =params(25)+x(it_, 1);
residual(19)= lhs-rhs;
lhs =y(30)+y(18)+y(24);
rhs =y(8)+y(13)+y(12)-y(10);
residual(20)= lhs-rhs;
lhs =y(10);
rhs =(-(y(9)-(1+y(11))*y(2)));
residual(21)= lhs-rhs;
lhs =y(10);
rhs =params(23)*y(3)+(1-params(23))*exp(x(it_, 2))*params(22)*y(15);
residual(22)= lhs-rhs;
lhs =T183*params(13)*(1+y(37));
rhs =T54-0.05*(y(9)-(steady_state(3)));
residual(23)= lhs-rhs;
lhs =y(12);
rhs =y(8)*params(19)+y(14)*params(21)*y(1)+y(21)*y(22)*params(20)+y(27)*params(20)*y(28)+y(33)*params(20)*y(34);
residual(24)= lhs-rhs;
lhs =y(7);
rhs =y(13)+y(1)*(1-params(14));
residual(25)= lhs-rhs;
lhs =y(1);
rhs =y(32)+y(20)+y(26);
residual(26)= lhs-rhs;
lhs =y(15);
rhs =y(30)+y(18)+y(24);
residual(27)= lhs-rhs;
lhs =params(13)*T183/(1+params(19))*(1+y(38)*(1-params(21))-params(14));
rhs =T54/(1+params(19));
residual(28)= lhs-rhs;
lhs =y(16);
rhs =y(33)+y(21)+y(27);
residual(29)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(29, 43);

  %
  % Jacobian matrix
  %

T237 = getPowerDeriv(y(8),(-params(17)),1);
T248 = getPowerDeriv(y(36),(-params(17)),1);
T302 = (1-params(20))*T54/(1+params(19));
  g1(1,4)=(-(T15*getPowerDeriv(y(4),params(15),1)));
  g1(1,23)=1;
  g1(1,41)=(-(T11*exp(x(it_, 3))*getPowerDeriv(exp(x(it_, 3)),1-params(15),1)));
  g1(2,17)=(-(params(2)+params(3)*getPowerDeriv(y(17),params(4),1)));
  g1(2,19)=1;
  g1(3,18)=1;
  g1(3,19)=(-(T37*T33*(-y(23))));
  g1(3,20)=(-(T37*y(23)*(1-y(19))*getPowerDeriv(y(20),params(1),1)));
  g1(3,21)=(-(y(23)*(1-y(19))*T33*getPowerDeriv(y(21),1-params(1),1)));
  g1(3,23)=(-(T37*(1-y(19))*T33));
  g1(4,14)=1;
  g1(4,18)=(-(params(1)/y(20)));
  g1(4,20)=(-((-(y(18)*params(1)))/(y(20)*y(20))));
  g1(5,18)=(-((1-params(1))/y(21)));
  g1(5,21)=(-((-(y(18)*(1-params(1))))/(y(21)*y(21))));
  g1(5,22)=1;
  g1(6,8)=y(22)*(1-params(20))*T237/(1+params(19));
  g1(6,21)=(-(params(18)*getPowerDeriv(y(21),params(16),1)));
  g1(6,22)=T302;
  g1(7,5)=(-(T69*getPowerDeriv(y(5),params(15),1)));
  g1(7,29)=1;
  g1(7,42)=(-(T66*exp(x(it_, 4))*getPowerDeriv(exp(x(it_, 4)),1-params(15),1)));
  g1(8,17)=(-(params(6)+params(7)*getPowerDeriv(y(17),params(8),1)));
  g1(8,25)=1;
  g1(9,24)=1;
  g1(9,25)=(-(T90*T86*(-y(29))));
  g1(9,26)=(-(T90*y(29)*(1-y(25))*getPowerDeriv(y(26),params(5),1)));
  g1(9,27)=(-(y(29)*(1-y(25))*T86*getPowerDeriv(y(27),1-params(5),1)));
  g1(9,29)=(-(T90*(1-y(25))*T86));
  g1(10,14)=1;
  g1(10,24)=(-(params(5)/y(26)));
  g1(10,26)=(-((-(y(24)*params(5)))/(y(26)*y(26))));
  g1(11,24)=(-((1-params(5))/y(27)));
  g1(11,27)=(-((-(y(24)*(1-params(5))))/(y(27)*y(27))));
  g1(11,28)=1;
  g1(12,8)=(1-params(20))*y(28)*T237/(1+params(19));
  g1(12,27)=(-(params(18)*getPowerDeriv(y(27),params(16),1)));
  g1(12,28)=T302;
  g1(13,6)=(-(T111*getPowerDeriv(y(6),params(15),1)));
  g1(13,35)=1;
  g1(13,43)=(-(T108*exp(x(it_, 5))*getPowerDeriv(exp(x(it_, 5)),1-params(15),1)));
  g1(14,17)=(-(params(10)+params(11)*getPowerDeriv(y(17),params(12),1)));
  g1(14,31)=1;
  g1(15,30)=1;
  g1(15,31)=(-(T132*T128*(-y(35))));
  g1(15,32)=(-(T132*y(35)*(1-y(31))*getPowerDeriv(y(32),params(9),1)));
  g1(15,33)=(-(y(35)*(1-y(31))*T128*getPowerDeriv(y(33),1-params(9),1)));
  g1(15,35)=(-(T132*(1-y(31))*T128));
  g1(16,14)=1;
  g1(16,30)=(-(params(9)/y(32)));
  g1(16,32)=(-((-(y(30)*params(9)))/(y(32)*y(32))));
  g1(17,30)=(-((1-params(9))/y(33)));
  g1(17,33)=(-((-(y(30)*(1-params(9))))/(y(33)*y(33))));
  g1(17,34)=1;
  g1(18,8)=(1-params(20))*y(34)*T237/(1+params(19));
  g1(18,33)=(-(params(18)*getPowerDeriv(y(33),params(16),1)));
  g1(18,34)=T302;
  g1(19,17)=1;
  g1(19,39)=(-1);
  g1(20,8)=(-1);
  g1(20,10)=1;
  g1(20,12)=(-1);
  g1(20,13)=(-1);
  g1(20,18)=1;
  g1(20,24)=1;
  g1(20,30)=1;
  g1(21,2)=(-(1+y(11)));
  g1(21,9)=1;
  g1(21,10)=1;
  g1(21,11)=(-y(2));
  g1(22,3)=(-params(23));
  g1(22,10)=1;
  g1(22,15)=(-((1-params(23))*exp(x(it_, 2))*params(22)));
  g1(22,40)=(-((1-params(23))*exp(x(it_, 2))*params(22)*y(15)));
  g1(23,8)=(-T237);
  g1(23,36)=(1+y(37))*params(13)*T248;
  g1(23,9)=0.05;
  g1(23,37)=T183*params(13);
  g1(24,1)=(-(y(14)*params(21)));
  g1(24,8)=(-params(19));
  g1(24,12)=1;
  g1(24,14)=(-(params(21)*y(1)));
  g1(24,21)=(-(y(22)*params(20)));
  g1(24,22)=(-(y(21)*params(20)));
  g1(24,27)=(-(params(20)*y(28)));
  g1(24,28)=(-(params(20)*y(27)));
  g1(24,33)=(-(params(20)*y(34)));
  g1(24,34)=(-(params(20)*y(33)));
  g1(25,1)=(-(1-params(14)));
  g1(25,7)=1;
  g1(25,13)=(-1);
  g1(26,1)=1;
  g1(26,20)=(-1);
  g1(26,26)=(-1);
  g1(26,32)=(-1);
  g1(27,15)=1;
  g1(27,18)=(-1);
  g1(27,24)=(-1);
  g1(27,30)=(-1);
  g1(28,8)=(-(T237/(1+params(19))));
  g1(28,36)=(1+y(38)*(1-params(21))-params(14))*params(13)*T248/(1+params(19));
  g1(28,38)=params(13)*T183/(1+params(19))*(1-params(21));
  g1(29,16)=1;
  g1(29,21)=(-1);
  g1(29,27)=(-1);
  g1(29,33)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],29,1849);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],29,79507);
end
end
end
end
