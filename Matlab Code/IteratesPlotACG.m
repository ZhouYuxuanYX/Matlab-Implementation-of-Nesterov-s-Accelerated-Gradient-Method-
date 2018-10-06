function IteratesPlotACG(w_min,iters,K,XX,YY,ZZ,t)
figure;
contour(XX,YY,ZZ,60);
hold on;
for k = 1:(K-2)
    plot(iters{k}(1),iters{k}(2),'or');
%     text(iters{k}(1),iters{k}(2),num2str(k-1),'Color','r')
    hold on;
    plot([iters{k}(1),iters{k+1}(1)],[iters{k}(2),iters{k+1}(2)],'r')
    plot(w_min(1),w_min(2),'g+');
end
dim = [.1 .1 .2 .1];
str=sprintf('K:%0.2f step size t:%0.2f Start Point:[%d %d]',K,t,w_min(1),w_min(2));
annotation('textbox',dim,'String',str,'FitBoxToText','on');
end