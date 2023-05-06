function Ccorr = analyzer_corrected()
  % This is the base fcn for HW9 problem 3.  The
  % problem involves correcting the non-linear response
  % of a gas analyzer.
    
  % --------- Insert correction code here. ---------------
  Cact1 = Cactual();
  Vmeas = sensor_response(Cact1);
  Craw1 = analyzer_volt_to_raw_conc(Vmeas);
  d = Cact1 - Craw1;
  A = [Craw1 Vmeas d];
  disp(A)
  x1 = linspace(0,25,251);
  y1 = interp1(Cact1,d,x1);
  x3 = linspace(min(Vmeas),max(Vmeas),10000);
  z1 = interp1(Vmeas,d,x3);
  figure(1)
  plot(x3,z1,'b.',Vmeas,d,'ro')
  xlabel('Voltage')
  ylabel('Error')
  legend('Linear interpolation','Calibration points')



  Craw2 = analyzer_volt_to_raw_conc2();
  x2 = linspace(0,25,251);
  Ccorr = Craw2 + y1;
  figure(2)
  plot(x2,Craw2,'r',x2,Ccorr,'b')
  legend('Raw concentration','Corrected concentration')
  xlabel('Actual concentration')
  ylabel('Concentration')


end
