clear all
clc

x = 0.1:1/22:1;
d = ((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x))/2;

figure(1)
plot(x, d,"kx")
hold on; grid on;

w0 = randn(1);
w1 = randn(1);
w2 = randn(1);

c1 = 0.18;
c2 = 0.89;
r1 = 0.15;
r2 = 0.15;

mok_zing = 0.15;

for k=1:1000
    for n=1:20
        
      F1=exp(-((x(n)-c1)^2)/(2*(r1^2)));
      F2=exp(-((x(n)-c2)^2)/(2*(r2^2)));

      y(n) = F1*w1+F2*w2+w0;
      
      e = d(n)-y(n);

      w1 = w1 + mok_zing * e * F1;
      w2 = w2 + mok_zing * e * F2;
      w0 = w0 + mok_zing * e;
      
    end
end
figure(2)
plot(x,y, "ro")
hold on; grid on;