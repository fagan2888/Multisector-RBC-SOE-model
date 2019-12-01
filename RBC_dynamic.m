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

residual = zeros(25, 1);
T11 = y(4)^params(6);
T15 = exp(x(it_, 2))^(1-params(6));
T21 = y(18)^params(1);
T22 = y(21)*T21;
T25 = y(19)^(1-params(1));
T42 = y(8)^(-params(8));
T54 = y(5)^params(6);
T57 = exp(x(it_, 3))^(1-params(6));
T63 = y(23)^params(2);
T64 = y(26)*T63;
T67 = y(24)^(1-params(2));
T85 = y(6)^params(6);
T88 = exp(x(it_, 4))^(1-params(6));
T94 = y(28)^params(3);
T95 = y(31)*T94;
T98 = y(29)^(1-params(3));
T145 = y(32)^(-params(8));
lhs =y(21);
rhs =T11*T15;
residual(1)= lhs-rhs;
lhs =y(17);
rhs =T22*T25;
residual(2)= lhs-rhs;
lhs =y(14);
rhs =y(17)*params(1)/y(18);
residual(3)= lhs-rhs;
lhs =y(20);
rhs =y(17)*(1-params(1))/y(19);
residual(4)= lhs-rhs;
lhs =y(20)*(1-params(11))*T42/(1+params(10));
rhs =params(9)*y(19)^params(7);
residual(5)= lhs-rhs;
lhs =y(26);
rhs =T54*T57;
residual(6)= lhs-rhs;
lhs =y(22);
rhs =T64*T67;
residual(7)= lhs-rhs;
lhs =y(14);
rhs =y(22)*params(2)/y(23);
residual(8)= lhs-rhs;
lhs =y(25);
rhs =y(22)*(1-params(2))/y(24);
residual(9)= lhs-rhs;
lhs =T42*(1-params(11))*y(25)/(1+params(10));
rhs =params(9)*y(24)^params(7);
residual(10)= lhs-rhs;
lhs =y(31);
rhs =T85*T88;
residual(11)= lhs-rhs;
lhs =y(27);
rhs =T95*T98;
residual(12)= lhs-rhs;
lhs =y(14);
rhs =y(27)*params(3)/y(28);
residual(13)= lhs-rhs;
lhs =y(30);
rhs =y(27)*(1-params(3))/y(29);
residual(14)= lhs-rhs;
lhs =T42*(1-params(11))*y(30)/(1+params(10));
rhs =params(9)*y(29)^params(7);
residual(15)= lhs-rhs;
lhs =y(27)+y(17)+y(22);
rhs =y(8)+y(13)+y(12)-y(10);
residual(16)= lhs-rhs;
lhs =y(10);
rhs =(-(y(9)-(1+y(11))*y(2)));
residual(17)= lhs-rhs;
lhs =y(10);
rhs =params(14)*y(3)+(1-params(14))*exp(x(it_, 1))*params(13)*y(15);
residual(18)= lhs-rhs;
lhs =T145*params(4)*(1+y(33));
rhs =T42-0.05*(y(9)-(steady_state(3)));
residual(19)= lhs-rhs;
lhs =y(12);
rhs =y(8)*params(10)+y(14)*params(12)*y(1)+y(19)*y(20)*params(11)+y(24)*params(11)*y(25)+y(29)*params(11)*y(30);
residual(20)= lhs-rhs;
lhs =y(7);
rhs =y(13)+y(1)*(1-params(5));
residual(21)= lhs-rhs;
lhs =y(1);
rhs =y(28)+y(18)+y(23);
residual(22)= lhs-rhs;
lhs =y(15);
rhs =y(27)+y(17)+y(22);
residual(23)= lhs-rhs;
lhs =params(4)*T145/(1+params(10))*(1+y(34)*(1-params(12))-params(5));
rhs =T42/(1+params(10));
residual(24)= lhs-rhs;
lhs =y(16);
rhs =y(29)+y(19)+y(24);
residual(25)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(25, 38);

  %
  % Jacobian matrix
  %

T199 = getPowerDeriv(y(8),(-params(8)),1);
T210 = getPowerDeriv(y(32),(-params(8)),1);
T248 = (1-params(11))*T42/(1+params(10));
  g1(1,4)=(-(T15*getPowerDeriv(y(4),params(6),1)));
  g1(1,21)=1;
  g1(1,36)=(-(T11*exp(x(it_, 2))*getPowerDeriv(exp(x(it_, 2)),1-params(6),1)));
  g1(2,17)=1;
  g1(2,18)=(-(T25*y(21)*getPowerDeriv(y(18),params(1),1)));
  g1(2,19)=(-(T22*getPowerDeriv(y(19),1-params(1),1)));
  g1(2,21)=(-(T21*T25));
  g1(3,14)=1;
  g1(3,17)=(-(params(1)/y(18)));
  g1(3,18)=(-((-(y(17)*params(1)))/(y(18)*y(18))));
  g1(4,17)=(-((1-params(1))/y(19)));
  g1(4,19)=(-((-(y(17)*(1-params(1))))/(y(19)*y(19))));
  g1(4,20)=1;
  g1(5,8)=y(20)*(1-params(11))*T199/(1+params(10));
  g1(5,19)=(-(params(9)*getPowerDeriv(y(19),params(7),1)));
  g1(5,20)=T248;
  g1(6,5)=(-(T57*getPowerDeriv(y(5),params(6),1)));
  g1(6,26)=1;
  g1(6,37)=(-(T54*exp(x(it_, 3))*getPowerDeriv(exp(x(it_, 3)),1-params(6),1)));
  g1(7,22)=1;
  g1(7,23)=(-(T67*y(26)*getPowerDeriv(y(23),params(2),1)));
  g1(7,24)=(-(T64*getPowerDeriv(y(24),1-params(2),1)));
  g1(7,26)=(-(T63*T67));
  g1(8,14)=1;
  g1(8,22)=(-(params(2)/y(23)));
  g1(8,23)=(-((-(y(22)*params(2)))/(y(23)*y(23))));
  g1(9,22)=(-((1-params(2))/y(24)));
  g1(9,24)=(-((-(y(22)*(1-params(2))))/(y(24)*y(24))));
  g1(9,25)=1;
  g1(10,8)=(1-params(11))*y(25)*T199/(1+params(10));
  g1(10,24)=(-(params(9)*getPowerDeriv(y(24),params(7),1)));
  g1(10,25)=T248;
  g1(11,6)=(-(T88*getPowerDeriv(y(6),params(6),1)));
  g1(11,31)=1;
  g1(11,38)=(-(T85*exp(x(it_, 4))*getPowerDeriv(exp(x(it_, 4)),1-params(6),1)));
  g1(12,27)=1;
  g1(12,28)=(-(T98*y(31)*getPowerDeriv(y(28),params(3),1)));
  g1(12,29)=(-(T95*getPowerDeriv(y(29),1-params(3),1)));
  g1(12,31)=(-(T94*T98));
  g1(13,14)=1;
  g1(13,27)=(-(params(3)/y(28)));
  g1(13,28)=(-((-(y(27)*params(3)))/(y(28)*y(28))));
  g1(14,27)=(-((1-params(3))/y(29)));
  g1(14,29)=(-((-(y(27)*(1-params(3))))/(y(29)*y(29))));
  g1(14,30)=1;
  g1(15,8)=(1-params(11))*y(30)*T199/(1+params(10));
  g1(15,29)=(-(params(9)*getPowerDeriv(y(29),params(7),1)));
  g1(15,30)=T248;
  g1(16,8)=(-1);
  g1(16,10)=1;
  g1(16,12)=(-1);
  g1(16,13)=(-1);
  g1(16,17)=1;
  g1(16,22)=1;
  g1(16,27)=1;
  g1(17,2)=(-(1+y(11)));
  g1(17,9)=1;
  g1(17,10)=1;
  g1(17,11)=(-y(2));
  g1(18,3)=(-params(14));
  g1(18,10)=1;
  g1(18,15)=(-((1-params(14))*exp(x(it_, 1))*params(13)));
  g1(18,35)=(-((1-params(14))*exp(x(it_, 1))*params(13)*y(15)));
  g1(19,8)=(-T199);
  g1(19,32)=(1+y(33))*params(4)*T210;
  g1(19,9)=0.05;
  g1(19,33)=T145*params(4);
  g1(20,1)=(-(y(14)*params(12)));
  g1(20,8)=(-params(10));
  g1(20,12)=1;
  g1(20,14)=(-(params(12)*y(1)));
  g1(20,19)=(-(y(20)*params(11)));
  g1(20,20)=(-(y(19)*params(11)));
  g1(20,24)=(-(params(11)*y(25)));
  g1(20,25)=(-(params(11)*y(24)));
  g1(20,29)=(-(params(11)*y(30)));
  g1(20,30)=(-(params(11)*y(29)));
  g1(21,1)=(-(1-params(5)));
  g1(21,7)=1;
  g1(21,13)=(-1);
  g1(22,1)=1;
  g1(22,18)=(-1);
  g1(22,23)=(-1);
  g1(22,28)=(-1);
  g1(23,15)=1;
  g1(23,17)=(-1);
  g1(23,22)=(-1);
  g1(23,27)=(-1);
  g1(24,8)=(-(T199/(1+params(10))));
  g1(24,32)=(1+y(34)*(1-params(12))-params(5))*params(4)*T210/(1+params(10));
  g1(24,34)=params(4)*T145/(1+params(10))*(1-params(12));
  g1(25,16)=1;
  g1(25,19)=(-1);
  g1(25,24)=(-1);
  g1(25,29)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],25,1444);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],25,54872);
end
end
end
end
