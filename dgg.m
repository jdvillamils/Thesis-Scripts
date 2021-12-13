function polarendBs(theta,rho,rhomin,rticks)
% Parámetros de configuración del gráfico %
da=0.001; % Paso en ángulo para
%circunferencia de radio 1 %
a=0:da:2*pi-da; % Ángulo para
%circunferencias %
la=length(a); % Número de ángulos %
dr=1/rticks; % Paso radial 
vr=0:dr:1; % Vector de radios %
lvr=length(vr); % Número de
%circunferencias %
angulot=45*pi/180;
X=zeros(la,lvr);
Y=zeros(la,lvr);
for I=1:lvr
 X(:,I)=vr(I)*cos(a);
 Y(:,I)=vr(I)*sin(a);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trazado del gráfico principal en polares %
r=0.5*(1-rho/rhomin+abs(1-rho/rhomin)); % Diagrama deradiación en coordenadas polares en dBs %
p=polar(theta,r); % Trazado del diagramade radiación polar en dBs %
hold on
%title('Diagrama polar (dB)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Borrado de líneas y texto por defecto en 'polar' %
h = findall(gca,'type','line');
h(h == p) = [];
delete(h(end-4:end));
h = findall(gca,'type','text');
h(h == p) = [];
delete(h(end-7:end-3)); %modificado para que se vean títulos
originalmente es end-4
%delete(h(end-4:end));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trazado de líneas y dibujo de textos auxiliares %
X3=(1+3/rhomin)*cos(theta);
Y3=(1+3/rhomin)*sin(theta);
plot(r.*cos(theta),r.*sin(theta),'LineWidth',2)
plot(X3,Y3,'color','g','LineWidth',2)
plot(X,Y,'color','k','LineWidth',1,'LineStyle',':')
drho=abs(rhomin)/(lvr-1); % Paso en dBs %
rhodB=rhomin:drho:0;
text(1.02*cos(angulot),1.02*sin(angulot),'0 dB')
for I=2:lvr-1
 texto=num2str(rhodB(lvr-I+1));
 text(vr(lvr-I+1)*cos(angulot),vr(lvr-I+1)*sin(angulot),texto)
end
hold off
