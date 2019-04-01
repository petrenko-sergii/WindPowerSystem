@echo off

echo WPS Oracle DB 
set wps_folder=D:\WPS\WindPowerSystem\sql\
set result_file=%wps_folder%result.log

set user_name=C##WPS
set password=82385779
set oracle_sid=wps

cd C:\Users\Petrenko

if exist %result_file% (
	echo Old log-file is deleted.
	del %result_file% >nul 2>&1
)

(
echo @%wps_folder%DropTables.sql
echo exit
) | sqlplus %user_name%/%password%@%oracle_sid% >> %result_file%

call :PrintGreen WPS Oracle DB TABLES are dropped.
call :PrintGreen For more data check the log-file %result_file%

pause

:PrintGreen 
powershell -Command Write-Host "%*" -foreground "Green"






