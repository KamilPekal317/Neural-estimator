%Sieæ neuronowa jako estymator:

siec = newff([-10 10;-10 10;-10 10;-10 10;-10 10;-10 10;-10 10;-10 10;],[5 6 1],{'tansig','tansig','purelin'},'trainlm');
siec.trainparam.epochs= 500;
siec.trainparam.show=50;
siec.trainparam.goal=0;

%Proces uczenia sieci - trening:
tic;
siec = train(siec,wektor_we',m_c');
t = toc

%Testowanie sieci:
mse = sim(siec,wektor_we');

%Generowanie bloczka sieci w simulinku:
gensim(siec,-1);

%Ró¿nica momentu skrêtnego i jego estymacji nuronowej:
e=(sum(abs(m_c - mse')))/length(m_c)

%Funkcja b³edu od liczby epok + zmierzony czas:
i = 100; 
wek_e = [];
wek_i = [];
time = [];

for d = 1:1:10
    
    wek_i(d)=i;
    siec.trainparam.epochs= i;  %polecenie ustawiaj¹ce liczê epok%
    i= i+100;
   
    %uczenie sieci:
    tic;
    siec = train(siec,wektor_we',m_c');
    time(d) = toc;
    
    %symulacja sieci;
    mse = sim(siec,wektor_we');
    
    %policzenie b³êdu:
    e=(sum(abs(m_c - mse')))/length(m_c)
    wek_e(d)= e;
end

blad = [0.0073, 0.0041, 0.0031, 0.0021, 0.0013, 0.0018, 0.0020, 0.0021, 0.0019, 0.0021]
    
epoki = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]

figure
plot(epoki,blad,"*");
grid on;
ylabel("œredni b³¹d");
xlabel("liczba epok");

%figure
%plot(Czas,mse,Czas,m_skretny);
%grid on;