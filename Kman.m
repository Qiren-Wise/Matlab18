close all;
F = [1 1
     0 1];
H = [1 0
     0 1];

x0 = [6 0]';
p0 = [100 0
      0   100];
  
Q = [0 0
     0 0];
 
R = [25 0
     0  1];
 
length = size(x_in.Time);
length = length(1,1); 

x_k = [];
p_k = [];
k_k = [];

plot_x = [];
x_k = x0;
p_k = p0;
for i = 1 : length
% % 状态方程更新
    x_k = F * x_k;
    p_k = F * p_k * F' + Q;    
% % 量测方程更新
    k_k = (p_k * H') * inv(H * p_k * H' + R); 
    z = [x_in.Data(i) 2.5]';
    x_k = x_k + k_k * (z - H * x_k);
    p_k = p_k - k_k * H * p_k;    
    plot_x(i) = x_k(1);         
end

figure(1)
plot(x_in.Data,'r');
hold on;
plot(plot_x,'g');
hold on;
plot(x_real_in.Data,'b');
grid on;