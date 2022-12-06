%% Parameters for Motor Drive Unit

% Copyright 2021-2022 The MathWorks, Inc.

%% Block parameters

motorDriveUnit.trqMax_Nm = 163;
% motorDriveUnit.spdMax_rpm = 17000;
motorDriveUnit.powerMax_kW = 53;
motorDriveUnit.responseTime_s = 0.02;

motorDriveUnit.efficiency_pct = 98;
motorDriveUnit.spd_eff_rpm = 2000;
motorDriveUnit.trq_eff_Nm = 50;

motorDriveUnit.thermalMass_J_perK = 5000;

motorDriveUnit.dampSpringStiffness_Nm_per_rad = 10000;
motorDriveUnit.dampSpringFriction_Nm_per_rpm = 100;

smoothing.mdu_dampSpringVelTol_rpm = 0.1;

%% Initial conditions

initial.motorDriveUnitTemperature_degC = 20;

initial.AirTemp_degC = 20;
