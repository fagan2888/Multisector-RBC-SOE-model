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

residual = zeros( 25, 1);

%
% Model equations
%

T14 = exp(x(2))^(1-params(6));
T20 = y(12)^params(1);
T21 = y(15)*T20;
T24 = y(13)^(1-params(1));
T41 = y(2)^(-params(8));
T55 = exp(x(3))^(1-params(6));
T61 = y(17)^params(2);
T62 = y(20)*T61;
T65 = y(18)^(1-params(2));
T85 = exp(x(4))^(1-params(6));
T91 = y(22)^params(3);
T92 = y(25)*T91;
T95 = y(23)^(1-params(3));
lhs =y(15);
rhs =y(15)^params(6)*T14;
residual(1)= lhs-rhs;
lhs =y(11);
rhs =T21*T24;
residual(2)= lhs-rhs;
lhs =y(8);
rhs =y(11)*params(1)/y(12);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =y(11)*(1-params(1))/y(13);
residual(4)= lhs-rhs;
lhs =y(14)*(1-params(11))*T41/(1+params(10));
rhs =params(9)*y(13)^params(7);
residual(5)= lhs-rhs;
lhs =y(20);
rhs =y(20)^params(6)*T55;
residual(6)= lhs-rhs;
lhs =y(16);
rhs =T62*T65;
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(16)*params(2)/y(17);
residual(8)= lhs-rhs;
lhs =y(19);
rhs =y(16)*(1-params(2))/y(18);
residual(9)= lhs-rhs;
lhs =T41*(1-params(11))*y(19)/(1+params(10));
rhs =params(9)*y(18)^params(7);
residual(10)= lhs-rhs;
lhs =y(25);
rhs =y(25)^params(6)*T85;
residual(11)= lhs-rhs;
lhs =y(21);
rhs =T92*T95;
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(21)*params(3)/y(22);
residual(13)= lhs-rhs;
lhs =y(24);
rhs =y(21)*(1-params(3))/y(23);
residual(14)= lhs-rhs;
lhs =T41*(1-params(11))*y(24)/(1+params(10));
rhs =params(9)*y(23)^params(7);
residual(15)= lhs-rhs;
lhs =y(21)+y(11)+y(16);
rhs =y(2)+y(7)+y(6)-y(4);
residual(16)= lhs-rhs;
lhs =y(4);
rhs =(-(y(3)-y(3)*(1+y(5))));
residual(17)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(14)+(1-params(14))*exp(x(1))*params(13)*y(9);
residual(18)= lhs-rhs;
lhs =(1+y(5))*T41*params(4);
rhs =T41-0.05*(y(3)-(y(3)));
residual(19)= lhs-rhs;
lhs =y(6);
rhs =y(2)*params(10)+y(8)*params(12)*y(1)+y(13)*y(14)*params(11)+y(18)*params(11)*y(19)+y(23)*params(11)*y(24);
residual(20)= lhs-rhs;
lhs =y(1);
rhs =y(7)+y(1)*(1-params(5));
residual(21)= lhs-rhs;
lhs =y(1);
rhs =y(22)+y(12)+y(17);
residual(22)= lhs-rhs;
lhs =y(9);
rhs =y(21)+y(11)+y(16);
residual(23)= lhs-rhs;
lhs =params(4)*T41/(1+params(10))*(1+y(8)*(1-params(12))-params(5));
rhs =T41/(1+params(10));
residual(24)= lhs-rhs;
lhs =y(10);
rhs =y(23)+y(13)+y(18);
residual(25)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(25, 25);

  %
  % Jacobian matrix
  %

T187 = getPowerDeriv(y(2),(-params(8)),1);
T233 = (1-params(11))*T41/(1+params(10));
  g1(1,15)=1-T14*getPowerDeriv(y(15),params(6),1);
  g1(2,11)=1;
  g1(2,12)=(-(T24*y(15)*getPowerDeriv(y(12),params(1),1)));
  g1(2,13)=(-(T21*getPowerDeriv(y(13),1-params(1),1)));
  g1(2,15)=(-(T20*T24));
  g1(3,8)=1;
  g1(3,11)=(-(params(1)/y(12)));
  g1(3,12)=(-((-(y(11)*params(1)))/(y(12)*y(12))));
  g1(4,11)=(-((1-params(1))/y(13)));
  g1(4,13)=(-((-(y(11)*(1-params(1))))/(y(13)*y(13))));
  g1(4,14)=1;
  g1(5,2)=y(14)*(1-params(11))*T187/(1+params(10));
  g1(5,13)=(-(params(9)*getPowerDeriv(y(13),params(7),1)));
  g1(5,14)=T233;
  g1(6,20)=1-T55*getPowerDeriv(y(20),params(6),1);
  g1(7,16)=1;
  g1(7,17)=(-(T65*y(20)*getPowerDeriv(y(17),params(2),1)));
  g1(7,18)=(-(T62*getPowerDeriv(y(18),1-params(2),1)));
  g1(7,20)=(-(T61*T65));
  g1(8,8)=1;
  g1(8,16)=(-(params(2)/y(17)));
  g1(8,17)=(-((-(y(16)*params(2)))/(y(17)*y(17))));
  g1(9,16)=(-((1-params(2))/y(18)));
  g1(9,18)=(-((-(y(16)*(1-params(2))))/(y(18)*y(18))));
  g1(9,19)=1;
  g1(10,2)=(1-params(11))*y(19)*T187/(1+params(10));
  g1(10,18)=(-(params(9)*getPowerDeriv(y(18),params(7),1)));
  g1(10,19)=T233;
  g1(11,25)=1-T85*getPowerDeriv(y(25),params(6),1);
  g1(12,21)=1;
  g1(12,22)=(-(T95*y(25)*getPowerDeriv(y(22),params(3),1)));
  g1(12,23)=(-(T92*getPowerDeriv(y(23),1-params(3),1)));
  g1(12,25)=(-(T91*T95));
  g1(13,8)=1;
  g1(13,21)=(-(params(3)/y(22)));
  g1(13,22)=(-((-(y(21)*params(3)))/(y(22)*y(22))));
  g1(14,21)=(-((1-params(3))/y(23)));
  g1(14,23)=(-((-(y(21)*(1-params(3))))/(y(23)*y(23))));
  g1(14,24)=1;
  g1(15,2)=(1-params(11))*y(24)*T187/(1+params(10));
  g1(15,23)=(-(params(9)*getPowerDeriv(y(23),params(7),1)));
  g1(15,24)=T233;
  g1(16,2)=(-1);
  g1(16,4)=1;
  g1(16,6)=(-1);
  g1(16,7)=(-1);
  g1(16,11)=1;
  g1(16,16)=1;
  g1(16,21)=1;
  g1(17,3)=1-(1+y(5));
  g1(17,4)=1;
  g1(17,5)=(-y(3));
  g1(18,4)=1-params(14);
  g1(18,9)=(-((1-params(14))*exp(x(1))*params(13)));
  g1(19,2)=(1+y(5))*params(4)*T187-T187;
  g1(19,5)=T41*params(4);
  g1(20,1)=(-(y(8)*params(12)));
  g1(20,2)=(-params(10));
  g1(20,6)=1;
  g1(20,8)=(-(params(12)*y(1)));
  g1(20,13)=(-(y(14)*params(11)));
  g1(20,14)=(-(y(13)*params(11)));
  g1(20,18)=(-(params(11)*y(19)));
  g1(20,19)=(-(params(11)*y(18)));
  g1(20,23)=(-(params(11)*y(24)));
  g1(20,24)=(-(params(11)*y(23)));
  g1(21,1)=1-(1-params(5));
  g1(21,7)=(-1);
  g1(22,1)=1;
  g1(22,12)=(-1);
  g1(22,17)=(-1);
  g1(22,22)=(-1);
  g1(23,9)=1;
  g1(23,11)=(-1);
  g1(23,16)=(-1);
  g1(23,21)=(-1);
  g1(24,2)=(1+y(8)*(1-params(12))-params(5))*params(4)*T187/(1+params(10))-T187/(1+params(10));
  g1(24,8)=params(4)*T41/(1+params(10))*(1-params(12));
  g1(25,10)=1;
  g1(25,13)=(-1);
  g1(25,18)=(-1);
  g1(25,23)=(-1);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],25,625);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],25,15625);
end
end
end
end
