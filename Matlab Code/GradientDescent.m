function [x,iters,XX,YY,ZZ] = GradientDescent(f,grad_f,K,t,x_init)
k = 1;
x_k0 = x_init;
iters = cell(K-1,1);
while (k < K)
x_k1 = x_k0 - t * grad_f(x_k0);
plot3(x_k0(1),x_k0(2),f(x_k0),'r-*');
hold on;
plot3([x_k0(1) x_k1(1)],[x_k0(2),x_k1(2)],[f(x_k0),f(x_k1)]);
iters{k}= x_k0 ;
k =k + 1;
x_k0 = x_k1;
end
x = x_k1;
[ w_min, f_min, f_max,XX,YY,ZZ ] = draw_3D_surface(f, 20, -150, 150, -150, 150);
hold on;
end



