function fig = MotorDriveUnit_plotResultMotorSpeed(nvpairs)
% plots the simulation result.

% Copyright 2021 The MathWorks, Inc.

arguments
  nvpairs.SimData timetable
  nvpairs.PlotParent (1,1) % matlab.ui.Figure
end

t = nvpairs.SimData.Time;
y = nvpairs.SimData.("Motor Speed");

lix = nvpairs.SimData.Properties.VariableNames == "Motor Speed";
unitStr = nvpairs.SimData.Properties.VariableUnits{lix};

if not(isfield(nvpairs, "PlotParent"))
  fig = figure;
  fig.Position(3:4) = [700 300];  % width height
else
  fig = nvpairs.PlotParent;
end

plot(fig, t, y, LineWidth = 2)
hold on
grid on
xlabel("Time")
title("Motor Speed (" + unitStr + ")")

end
