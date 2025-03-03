imax=122;
niter=10000; %needs to be 10000 or greater
psn=1;
CFL=0.1;
L=2.35;
%k=99.9;
%res=99.9;
%C=99.9;

d= 1.27;
g= 9.81;
pden= 2.68E+03;

vis= 1.85E-05;

delx=L/(imax-1);
for i=2:imax
h(i)=(i-1)*delx;
end 


for i=2:60
 %   k(i)=0.15;
      %k(i)= 0.0048*(h(i)^3.0)-0.0231*(h(i)^2.0)+0.029*h(i) +0.055; %thermal plume
k(i)= 0.2101*(h(i)^3.0)-0.4951*(h(i)^2.0)+0.2948*h(i) +0.0231;
%k(i)= (0.0462*(h(i)^3.0)-0.2314*(h(i)^2.0)+0.3107*h(i)+0.0615);
end
for i=61:imax
 %   k(i)=0.15;
      %k(i)= 0.0048*(h(i)^3.0)-0.0231*(h(i)^2.0)+0.029*h(i) +0.055; %thermal plume
k(i)= (2.35-h(i))/40.6;
%k(i)= (0.0462*(h(i)^3.0)-0.2314*(h(i)^2.0)+0.3107*h(i)+0.0615);
end

for (i=2:55)
 %   k(i)=0.15;
      %k(i)= 0.0048*(h(i)^3.0)-0.0231*(h(i)^2.0)+0.029*h(i) +0.055; %thermal plume
k1(i)= 0.2101*((h(i)+0.03)^3.0)-0.4951*((h(i)+0.03)^2.0)+0.2948*(h(i)+0.03) +0.0231-0.015;
%k(i)= (0.0462*(h(i)^3.0)-0.2314*(h(i)^2.0)+0.3107*h(i)+0.0615);
end

for i=56:imax
 %   k(i)=0.15;
      %k(i)= 0.0048*(h(i)^3.0)-0.0231*(h(i)^2.0)+0.029*h(i) +0.055; %thermal plume
k1(i)= (2.35-h(i))/84;
%k(i)= (0.0462*(h(i)^3.0)-0.2314*(h(i)^2.0)+0.3107*h(i)+0.0615);
end

for (i=2:55)
 %   k(i)=0.15;
      %k(i)= 0.0048*(h(i)^3.0)-0.0231*(h(i)^2.0)+0.029*h(i) +0.055; %thermal plume
k3(i)= 0.2101*((h(i)+0.1)^3.0)-0.4951*((h(i)+0.1)^2.0)+0.3018*(h(i)+0.1) +0.0231-0.028;
%k(i)= (0.0462*(h(i)^3.0)-0.2314*(h(i)^2.0)+0.3107*h(i)+0.0615);
end

for i=56:imax
 %   k(i)=0.15;
      %k(i)= 0.0048*(h(i)^3.0)-0.0231*(h(i)^2.0)+0.029*h(i) +0.055; %thermal plume
k3(i)= (2.35-h(i))/176.42;
%k(i)= (0.0462*(h(i)^3.0)-0.2314*(h(i)^2.0)+0.3107*h(i)+0.0615);
end
for (i=2:55)
k2=0.9*k1;
end
for i=56:imax
 %   k(i)=0.15;
      %k(i)= 0.0048*(h(i)^3.0)-0.0231*(h(i)^2.0)+0.029*h(i) +0.055; %thermal plume
k2(i)= (2.35-h(i))/93.29;
%k(i)= (0.0462*(h(i)^3.0)-0.2314*(h(i)^2.0)+0.3107*h(i)+0.0615);
end


figure,
%plot(k(2:end),h(2:end),0.75*k1(2:end),h(2:end))
a=plot(k(2:end),h(2:end),k1(2:end),h(2:end),k2(2:end),h(2:end),k3(2:end),h(2:end))
%plot(k(2:end),h(2:end),0.76*k1(2:end),h(2:end),0.73*k1(2:end),h(2:end),0.68*k3(2:end),h(2:end))
xlim([0 0.1])
ylim([0 2.35])

xlabel('Eddy Diffusion Coefficient k, [m{^2}s{^{-1}}]','FontSize', 16) 
ylabel('Height above floor z, [m]','FontSize', 16) 
set(gca,'FontSize',16)
set(a,'linewidth',1.5)
legend('1 m tall child, [7]','19 month olds', '15 month olds', '12 month olds')
print(gcf,'C:\Users\neerj\OneDrive\Desktop\eddy.png','-dpng','-r1200');



