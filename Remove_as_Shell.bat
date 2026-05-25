@ECHO OFF

CALL :ModifyRegistryValue "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" Shell REG_SZ "explorer.exe"
EXIT /B

:ModifyRegistryValue
	%WINDIR%\System32\REG.EXE ADD "%~1" /V "%~2" /T %~3 /D "%~4" /F > NUL
	EXIT /B