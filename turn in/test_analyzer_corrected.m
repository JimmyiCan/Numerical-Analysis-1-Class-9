function test_analyzer_corrected()
Cact1 = Cactual();
Vmeas = sensor_response(Cact1);
Craw1 = analyzer_volt_to_raw_conc(Vmeas);
d = Cact1 - Craw1;
x = linspace(0,25,251);
y = interp1(Cact1,d,x);
Craw2 = analyzer_volt_to_raw_conc2();
Ccorr = Craw2 + y;
figure(2)
plot(x,Craw2,'r',x,Ccorr,'b')
legend('Raw concentration','Corrected concentration')
xlabel('Actual concentration')
ylabel('Concentration')
s = size(x);
for i = 1:s(1)
    if(abs(x(i) - Ccorr(i)) >= 0.05*i)
        error('False')
    end
end
disp('true')
