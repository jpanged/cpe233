@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 3122a36cb8a3486c817c1228d48621d3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot spkr_drvr_behav xil_defaultlib.spkr_drvr -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
