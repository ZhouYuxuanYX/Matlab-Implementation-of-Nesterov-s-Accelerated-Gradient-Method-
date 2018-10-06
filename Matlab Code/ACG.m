function [w_min,x,Beta,iters,XX,YY,ZZ] = ACG(f,grad_f,K,t,x_init)
k = 1;
gamma_k1 = 1;
x_k0 = x_init;
x_k1 = x_init - t * grad_f(x_init);
iters = cell(K-1,1);
Beta = zeros(K-1,1);
while (k < K)
gamma_k2 = 1/2 * (4 * gamma_k1^2 + gamma_k1^4)^(1/2) - gamma_k1^2;
beta = -gamma_k2 * (1 - 1/gamma_k1);
y_k2 = x_k1 + beta*(x_k1 - x_k0);
x_k2 = y_k2 - t * grad_f(y_k2);
plot3(x_k0(1),x_k0(2),f(x_k0),'r-*');
hold on;
plot3([x_k0(1) x_k1(1)],[x_k0(2),x_k1(2)],[f(x_k0),f(x_k1)]);
iters{k}= x_k0 ;
Beta(k)= beta;
k =k + 1;
gamma_k1 = gamma_k2;
x_k0 = x_k1;
x_k1 = x_k2;
end
x = x_k2;
[w_min, f_min, f_max,XX,YY,ZZ]=draw_3D_surface(f, 20, -150, 150, -150, 150);
hold on;
end



