@echo off
:: Store start time
set StartTIME=%TIME%
set H=%StartTIME:~0,2%
if "%H:~0,1%"==" " set H=%H:~1,1%
if "%H:~0,1%"=="0" set H=%H:~1,1%
set M=%StartTIME:~3,2%
if "%M:~0,1%"=="0" set M=%M:~1,1%
set S=%StartTIME:~6,2%
if "%S:~0,1%"=="0" set S=%S:~1,1%
set U=%StartTIME:~9,2%
if "%U:~0,1%"=="0" set U=%U:~1,1%
)
set /a Start100S=%H%*360000+%M%*6000+%S%*100+%U%

:: 
:: Add your script functionality here

color a
python %1

::

:: Get the end time
set StopTIME=%TIME%
set H=%StopTIME:~0,2%
if "%H:~0,1%"==" " set H=%H:~1,1%
if "%H:~0,1%"=="0" set H=%H:~1,1%
set M=%StopTIME:~3,2%
if "%M:~0,1%"=="0" set M=%M:~1,1%
set S=%StopTIME:~6,2%
if "%S:~0,1%"=="0" set S=%S:~1,1%
set U=%StopTIME:~9,2%
if "%U:~0,1%"=="0" set U=%U:~1,1%
)

set /a Stop100S=%H%*360000+%M%*6000+%S%*100+%U%

:: Test midnight rollover. If so, add 1 day=8640000 1/100ths secs
if %Stop100S% LSS %Start100S% set /a Stop100S+=8640000
set /a TookTime=%Stop100S%-%Start100S%

:: echo Started: %StartTime%
:: echo Stopped: %StopTime%
echo.
echo ------------------------------------------------------------
echo Time: %TookTime:~0,-2%.%TookTime:~-2% seconds
pause
exit
