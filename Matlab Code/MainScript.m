A = [2 5;1 7];
b = [100 70]';
[Problem] = quadratic(A, b);
f = Problem.cost;
grad_f = Problem.grad;
x_init = [-37,88]';
K = 10;
t= 0.1;
[w_min,x_solACG,Beta,itersACG,XACG,YACG,ZACG] = ACG(f,grad_f,K,t,x_init); % Accelerated Gradient Method
[x_solHB,itersHB,XHB,YHB,ZHB] = HeavyBall(f,grad_f,K,t,x_init,0.7);       % Heavy Ball Method
% [x_solHB1,itersHB1,XHB1,YHB1,ZHB1] = HeavyBall(f,grad_f,K,t,x_init,0.5); 
% [x_solHB3,itersHB2,XHB3,YHB3,ZHB2] = HeavyBall(f,grad_f,K,t,x_init,0.9);
[x,iters,XX,YY,ZZ] = GradientDescent(f,grad_f,K,t,x_init);                % Gradient descent
%% Accelerated Gradient Method, Gradient calculated in the current position instead of intermediate point
% [w,x_solACGnoIn,Beta1,itersACGnoIn,X,Y,Z] = ACGnoInterm(f,grad_f,K,t,x_init);
%% Heavy Ball Method, Gradient calculated in the intermediate point
% [x_solHBInt,itersHBInt,X2,Y2,Z2] = HeavyBallInterm(f,grad_f,K,t,x_init,0.9);
%% Accelerated Gradient Method, but beta function substituded with 1-1/k
colorHB = 'b';
pointHB = 'or';
colorACG = 'r';
pointACG = 'og';
IteratesPlotHB(w_min,itersHB,K,XHB,YHB,ZHB,t);
hold off;
IteratesPlotACG(w_min,itersACG,K,XACG,YACG,ZACG,t);
% hold off;
plottr(w_min,itersHB,K,XACG,YACG,ZACG,itersACG,iters,t); % compare the three methods
% plottr(w_min,itersHB,K,XACG,YACG,ZACG,itersHB1,itersHB2,t);
hold off;
% plottr(w_min,itersHB,K,XACG,YACG,ZACG,itersACG,itersACGnoIn,t);
% plottwHB(w_min,itersHB,K,XACG,YACG,ZACG,itersHBInt,t);
% plottr(w_min,itersHB,K,XACG,YACG,ZACG,itersACG,itersACGbeta2,t);


