%Regulacja prêdkoœci z po³¹czeniem sprê¿ystym:

T1=0.203;
T2=0.203;
Tc=0.0026;

Te=0.0001;

%Nastawy regulatora bez dodstkowych sprzê¿eñ:

zeta = 0.7;
%Kp = 2*(sqrt(T1/Tc));
Kms =(((zeta^2*4*T1)/T2)-1);
Kp = 4*T1*(sqrt((1+Kms)/(4*T1*Tc)));
Ki = T1/(T2*Tc);

Tfin = 0.010;

%Nastawy regulatora ze sprzê¿eniem od ró¿nicy prêdkoœci:
omega = 20;

%Wykresy:
figure
plot(Czas,m_c_porow);
grid on;
ylabel("m_c, m_sc [p.u]");
xlabel("t[s]");
legend( "m_c","m_{msc}");

%Wykresy:
figure
plot(Czas,predkosci_napedu);
grid on;
ylabel("w_1, w_2, w_{ref} [p.u]");
xlabel("t[s]");
legend( "w_1","w_2","w_{ref}");

%Wykresy:
figure
plot(Czas,momenty_porow);
grid on;
ylabel("m_e, m_c [p.u]");
xlabel("t[s]");
legend( "m_e","m_c");


%figure
%plot(Czas,momenty);
%grid on;
%ylabel("me [p.u], mc [p.u]");
%xlabel("t[s]");
%legend( "me","mc");
%axis([0 3, -0.4 1.2]);



