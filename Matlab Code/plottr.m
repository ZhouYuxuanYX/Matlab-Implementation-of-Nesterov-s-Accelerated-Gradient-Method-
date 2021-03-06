function plottr(w_min,itersHB,K,XX,YY,ZZ,itersACG,iters,t)
figure;
for k = 1:(K-2)
    plot(itersHB{k}(1),itersHB{k}(2),'ob',itersACG{k}(1),itersACG{k}(2),'xr',iters{k}(1),iters{k}(2),'*g');
    legend('Heavy Ball','ACG','Gradient Descent')
%     text(itersHB{k}(1),itersHB{k}(2),num2str(k-1),'Color','b')
%     text(itersACG{k}(1),itersACG{k}(2),num2str(k-1),'Color','r')
%     text(iters{k}(1),iters{k}(2),num2str(k-1),'Color','g')
    hold on;
    a = plot([itersHB{k}(1),itersHB{k+1}(1)],[itersHB{k}(2),itersHB{k+1}(2)],'-b');
    c = plot([iters{k}(1),iters{k+1}(1)],[iters{k}(2),iters{k+1}(2)],':g');
    b = plot([itersACG{k}(1),itersACG{k+1}(1)],[itersACG{k}(2),itersACG{k+1}(2)],'--r');
end
hold on;
contour(XX,YY,ZZ,60);

hold on;
plot(w_min(1),w_min(2),'g+');
dim = [.1 .1 .2 .1];
str=sprintf('K:%0.2f step size t:%0.2f Start Point:[%d %d]',K,t,w_min(1),w_min(2));
annotation('textbox',dim,'String',str,'FitBoxToText','on');

end