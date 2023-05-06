function Craw = analyzer_volt_to_raw_conc2()
  % This function takes as input a voltage.  It assumes
  % the gas concentration is a linear function of the
  % input voltage.  It returns the inferred concentration
  % given the input voltage.

 [pmr,Vz,Vs] = globals();
  
  dV = Vs - Vz;
  Cact = linspace(0,25,251);
  Vmeas = sensor_response(Cact);
  % Concentration to report.
  Craw = (pmr./dV).*(Vmeas-Vz);


end