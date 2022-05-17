%% Run unit tests
% This script runs unit tests and generates a test result summary in XML
% and a MATLAB code coverage report in HTML.

% Copyright 2022 The MathWorks, Inc.

RelStr = matlabRelease().Release;
disp("This is MATLAB " + RelStr)

ComponentName = "PowerSplitHEV_SpeedTracking";
  
PrjRoot = currentProject().RootFolder;

TopFolder = fullfile(PrjRoot, "HEV", "PowerSplitHEV_SpeedTracking");
assert(isfolder(TopFolder))

UnitTestFolder = fullfile(TopFolder, "test");
assert(isfolder(UnitTestFolder))

UnitTestFile = fullfile(UnitTestFolder, ComponentName+"_UnitTest.m");
assert(isfile(UnitTestFile))

suite = matlab.unittest.TestSuite.fromFile( UnitTestFile );

runner = matlab.unittest.TestRunner.withTextOutput( ...
            OutputDetail = matlab.unittest.Verbosity.Detailed );

%% JUnit Style Test Result

% Test result file is created. There is no need to check its existance.
TestResultFile = "TestResults_" + RelStr + ".xml";

plugin = matlab.unittest.plugins.XMLPlugin.producingJUnitFormat( ...
            fullfile(UnitTestFolder, TestResultFile));

addPlugin(runner, plugin)

%% MATLAB Code Coverage Report

CoverageReportFolder = fullfile(PrjRoot, "coverage" + RelStr);
if not(isfolder(CoverageReportFolder))
  mkdir(CoverageReportFolder)
end

CoverageReportFile = RelStr + "_" + ComponentName + ".html";

coverageReport = matlab.unittest.plugins.codecoverage.CoverageReport( ...
                  CoverageReportFolder, ...
                  MainFile = CoverageReportFile );

plugin = matlab.unittest.plugins.CodeCoveragePlugin.forFile( ...
  [ fullfile(UnitTestFolder, ComponentName+"_UnitTest.m"), ...
    fullfile(TopFolder, "PowerSplitHEV_SpeedTracking_main_script.mlx"), ...
    fullfile(TopFolder, "PowerSplitHEV_SpeedTracking_sweep.mlx"), ...
    fullfile(TopFolder, "drive_patterns", "PowerSplitHEV_SpeedTracking_Accelerate_Decelerate.mlx"), ...
    fullfile(TopFolder, "drive_patterns", "PowerSplitHEV_SpeedTracking_FTP75.mlx"), ...
    fullfile(TopFolder, "drive_patterns", "PowerSplitHEV_SpeedTracking_SimpleDrivePattern.mlx"), ...
    fullfile(TopFolder, "testcases", "PowerSplitHEV_SpeedTracking_testcase_basic.mlx"), ...
    fullfile(TopFolder, "testcases", "PowerSplitHEV_SpeedTracking_testcase_highSpeed.mlx"), ...
    fullfile(TopFolder, "utils", "PowerSplitHEV_SpeedTracking_example.m"), ...
    fullfile(TopFolder, "utils", "PowerSplitHEV_SpeedTracking_selectInput.m") ], ...
  Producing = coverageReport );

addPlugin(runner, plugin)

%%

results = run(runner, suite);

disp(results)
