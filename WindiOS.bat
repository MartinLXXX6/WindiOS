@ECHO OFF
TITLE WindiOS
SETLOCAL ENABLEDELAYEDEXPANSION



REM Variables
SET "strLen=0"
SET "userInput=0"
SET "menuToLoadIndex=0"
SET "pinnedPrograms="
SET "programsIniFile=%~dp0PinnedPrograms.ini"



REM Main
CALL :LoadPinnedProgramsFromFile
:MainLoop
	CALL :MenuShowHandler
	CALL :DetectInput
	CALL :MenuInputHandler
	GOTO MainLoop



REM User Interface Functions
:MenuShowHandler
	IF "%menuToLoadIndex%" EQU "0" (
		CALL :ShowMainMenu
	) ELSE IF "%menuToLoadIndex%" EQU "1" (
		CALL :ShowProgramsMenu
	) ELSE IF "%menuToLoadIndex%" EQU "2" (
		CALL :ShowToolsMenu
	) ELSE IF "%menuToLoadIndex%" EQU "3" (
		CALL :ShowHelpMenu
	) ELSE IF "%menuToLoadIndex%" EQU "4" (
		CALL :ShowPowerMenu
	)
	EXIT /B

:ShowMainMenu
	CLS
	ECHO  ^|             _______            ^|             _______              ^|             ______             ^|
	ECHO  ^|              TOOLS             ^|              BASIC               ^|              TRAY              ^|
	ECHO  ^|                                ^|                                  ^|                                ^|
	ECHO  ^|T.        TASK MANAGER          ^|1.        PROGRAMS [MENU]         ^|A.    POWER OPTIONS [MENU]      ^|
	ECHO  ^|C.       COMMAND PROMPT         ^|2.          RUN COMMAND           ^|B.  VOLUME,BATTERY,BRIGHTNESS   ^|
	ECHO  ^|N.           NOTEPAD            ^|3.         FILE EXPLORER          ^|   NETWORK: {CTRL ^+ ALT ^+ DEL}  ^|
	ECHO  ^|M.         MORE [MENU]          ^|4.          HELP [MENU]           ^|  %DATE% ^| %TIME%  ^|
	ECHO  ^|________________________________^|5.           REFRESH              ^|________________________________^|
	ECHO                                   ^|__________________________________^|
	ECHO.
	ECHO                        ^>^>^> USE {CTRL ^+ MOUSE WHEEL} TO ZOOM IN/OUT THE WINDOW ^<^<^<
	EXIT /B

:ShowProgramsMenu
	CLS
	ECHO  ^|     ____________     ^|                                                                             ^|
	ECHO  ^|      NAVIGATION      ^|           _                  _                                              ^|
	ECHO  ^|                      ^|      _ __(_)_ _  _ _  ___ __^| ^|  _ __ _ _ ___  __ _ _ _ __ _ _ __  ___      ^|
	ECHO  ^|B.       BACK         ^|     ^| '_ \ ^| ' \^| ' \/ -_) _` ^| ^| '_ \ '_/ _ \/ _` ^| '_/ _` ^| '  \(_-^<      ^|
	ECHO  ^|X.   ALL PROGRAMS     ^|     ^| .__/_^|_^|^|_^|_^|^|_\___\__,_^| ^| .__/_^| \___/\__, ^|_^| \__,_^|_^|_^|_/__/      ^|
	ECHO  ^|Y.  UNPIN A PROGRAM   ^|     ^|_^|                         ^|_^|           ^|___/                         ^|
	ECHO  ^|Z.   PIN A PROGRAM    ^|                                                                             ^|
	ECHO  ^|______________________^|                                                                             ^|
	
	IF DEFINED pinnedPrograms (
		SET "forLoopCount=0"
		FOR %%i IN ("%pinnedPrograms:;=","%") DO (
			SET /A "forLoopCount+=1"
			
			CALL :GetStrLength "%%~i"
			SET /A "lengthOfProgram=!strLen!+3"
			SET "showStr=^|                                                                             "
			CALL SET "definitiveStr=%%showStr:~1,-!lengthOfProgram!%%"
			ECHO                         !definitiveStr!!forLoopCount!. %%~i^|
		)
	)
	
	ECHO                         ^|_____________________________________________________________________________^|
	EXIT /B

:ShowToolsMenu
	CLS
	ECHO  ^|     ____________     ^|                                   _______                                   ^|
	ECHO  ^|      NAVIGATION      ^|                                    TOOLS                                    ^|
	ECHO  ^|                      ^|                                                                             ^|
	ECHO  ^|B.       BACK         ^|----------------------------------PROGRAMS-----------------------------------^|
	ECHO  ^|Z.     ALL TOOLS      ^|    0. SERVICES VIEWER    ^|    1. TASK SCHEDULER   ^|    2. WINDOWS VERSION   ^|
	ECHO  ^|______________________^|    3. DISK MANAGEMENT    ^| 4. COMPUTER MANAGEMENT ^|    5. DEVICE MANAGER    ^|
	ECHO                         ^|     6. EVENT VIEWER      ^|   7. MOBILITY CENTER   ^|    8. CONTROL PANEL     ^|
	ECHO                         ^|  9. SYSTEM INFORMATION   ^|     10. POWERSHELL     ^|       11. RUN BOX       ^|
	ECHO                         ^|   12. COMMAND PROMPT     ^|   13. TASK MANAGER     ^|       14. NOTEPAD       ^|
	ECHO                         ^|   15. REGISTRY EDITOR    ^| 16. VIRUS REMOVAL TOOL ^|  17. WINDOWS FIREWALL   ^|
	ECHO                         ^|     18. DISK CLEANUP     ^|  19. DISK DEFRAGMENT   ^|  20. RESOURCE MONITOR   ^|
	ECHO                         ^|  21. DIRECTX DIAG. TOOL  ^|  22. EXECUTABLE TOOL   ^| 23. GROUP POLICY EDITOR ^|
	ECHO                         ^|           24. VOLUME MIXER           ^|          25. FILE EXPLORER           ^|
	ECHO                         ^|                                                                             ^|
	ECHO                         ^|----------------------------------SETTINGS-----------------------------------^|
	ECHO                         ^|    A. MOUSE SETTINGS     ^|    C. MANAGE USERS     ^|    D. UNINSTALL APPS    ^|
	ECHO                         ^| E. SYSTEM CONFIGURATION  ^| F. ADD/REMOVE FEATURES ^|   G. ADVANCED SETTINGS  ^|
	ECHO                         ^|  H. SCREENSAVER SETTINGS ^|    I. DESKTOP ICONS    ^|   J. KEYBOARD SETTINGS  ^|
	ECHO                         ^| K. FILE EXPLORER OPTIONS ^|   L. NETWORK SETTINGS  ^| M. ENVIROMENT VARIABLES ^|
	ECHO                         ^|  N. CONTROLLER SETTINGS  ^| O. PEN/TABLET SETTINGS ^|   P. VIEW ALL DEVICES   ^|
	ECHO                         ^| Q. SOUND DEVICE SETTINGS ^|  R. TIME/DATE SETTINGS ^|    S. REGION SETTINGS   ^|
	ECHO                         ^|   T. ADV. POWER OPTIONS  ^|    U. POWER OPTIONS    ^|     V. UAC SETTINGS     ^|
	ECHO                         ^|    W. COLOR MANAGEMENT   ^|   X. INTERNET OPTIONS  ^|   Y. INDEXING OPTIONS   ^|
	ECHO                         ^|    AA. THEME SETTINGS    ^| BB. DESKTOP WALLPAPER  ^|     CC. ACCENT COLOR    ^|
	ECHO                         ^|_____________________________________________________________________________^|
	EXIT /B
	
:ShowHelpMenu
	CLS
	ECHO  ^|     ____________     ^|                                    ______                                   ^|
	ECHO  ^|      NAVIGATION      ^|                                     HELP                                    ^|
	ECHO  ^|                      ^|                                                                             ^|
	ECHO  ^|B.       BACK         ^|------------------------WHY USE THIS SCRIPT AS SHELL^?------------------------^|
	ECHO  ^|Z.     MY GITHUB      ^|                               1. TO SAVE RAM.                               ^|
	ECHO  ^|______________________^|                         2. SIMPLER, SNAPPIER, LIGHTER.                      ^|
	ECHO                         ^|                                                                             ^|
	ECHO                         ^|------------------------------CONTACT ^& SUPPORT------------------------------^|
	ECHO                         ^|                            GITHUB.COM/MARTINLXXX6                           ^|
	ECHO                         ^|                                                                             ^|
	ECHO                         ^|----------------------------------SHORTCUTS----------------------------------^|
	ECHO                         ^|    CTRL ^+ ALT ^+ DEL (USEFUL MENU)   ^|   CTRL ^+ ^SHIFT ^+ ESC (TASK MANAGER)   ^|
	ECHO                         ^| CTRL ^+ ^SHIFT ^+ WIN ^+ B (RESET DISPLAY DRIVERS) ^| ALT ^+ TAB (SWITCH WINDOWS) ^|
	ECHO                         ^|                              WIN ^+ L (LOCK PC)                              ^|
	ECHO                         ^|_____________________________________________________________________________^|
	EXIT /B
	
:ShowPowerMenu
	CLS
	ECHO  ^|     ____________     ^|                                   _______                                   ^|
	ECHO  ^|      NAVIGATION      ^|                                    POWER                                    ^|
	ECHO  ^|                      ^|                                                                             ^|
	ECHO  ^|B.       BACK         ^|                                 1. SHUTDOWN                                 ^|
	ECHO  ^|______________________^|                                  2. REBOOT                                  ^|
	ECHO                         ^|                                 3. SIGN OUT                                 ^|
	ECHO                         ^|                                   4. LOCK                                   ^|
	ECHO                         ^|_____________________________________________________________________________^|
	EXIT /B
	
:DetectInput
	ECHO.
	SET /P "userInput=>>>"
	EXIT /B



REM Input Functions
:MenuInputHandler
	IF "%menuToLoadIndex%" EQU "0" (
		CALL :HandleMainMenuInput
	) ELSE IF "%menuToLoadIndex%" EQU "1" (
		CALL :HandleProgramsMenuInput
	) ELSE IF "%menuToLoadIndex%" EQU "2" (
		CALL :HandleToolsMenuInput
	) ELSE IF "%menuToLoadIndex%" EQU "3" (
		CALL :HandleHelpMenuInput
	) ELSE IF "%menuToLoadIndex%" EQU "4" (
		CALL :HandlePowerMenuInput
	)
	EXIT /B

:HandleMainMenuInput
	IF /I "%userInput%" EQU "T" (
		CALL :RunSystem32App "TASKMGR.EXE" "-d"
	) ELSE IF /I "%userInput%" EQU "C" (
		CALL :RunSystem32App "CMD.EXE"
	) ELSE IF /I "%userInput%" EQU "N" (
		CALL :RunSystem32App "NOTEPAD.EXE"
	) ELSE IF /I "%userInput%" EQU "M" (
		SET "menuToLoadIndex=2"
	) ELSE IF /I "%userInput%" EQU "A" (
		SET "menuToLoadIndex=4"
	) ELSE IF /I "%userInput%" EQU "B" (
		REG.EXE QUERY "HKCU\Software\Microsoft\MobilePC\MobilityCenter" >NUL 2>&1
		IF ERRORLEVEL 1 (
			CALL :RunSystem32App "SNDVOL.EXE"
		) ELSE (
			CALL :RunSystem32App "MBLCTR.EXE"
		)
	) ELSE IF "%userInput%" EQU "1" (
		SET "menuToLoadIndex=1"
	) ELSE IF "%userInput%" EQU "2" (
		CALL :RunSystem32App "RUNDLL32.EXE" "SHELL32.DLL,#61"
	) ELSE IF "%userInput%" EQU "3" (
		CALL :RunWindowsApp "EXPLORER.EXE" "shell:::{26EE0668-A00A-44D7-9371-BEB064C98683}\5\::{679f85cb-0220-4080-b29b-5540cc05aab6}"
	) ELSE IF "%userInput%" EQU "4" (
		SET "menuToLoadIndex=3"
	)
	SET "userInput=-1"
	EXIT /B

:HandleProgramsMenuInput
	IF /I "%userInput%" EQU "B" (
		SET "menuToLoadIndex=0"
		SET "userInput=-1"
		EXIT /B
	) ELSE IF /I "%userInput%" EQU "X" (
		CALL :RunWindowsApp "EXPLORER.EXE" "shell:::{26EE0668-A00A-44D7-9371-BEB064C98683}\5\::{4234d49b-0245-4df3-b780-3893943456e1}"
		SET "userInput=-1"
		EXIT /B
	) ELSE IF /I "%userInput%" EQU "Y" (
		SET /P "remPinnedProgram=ENTER INDEX OF THE PROGRAM: "
		CALL :RemoveProgramToPinnedProgramsVarWithIndex "!remPinnedProgram!"
		CALL :SavePinnedProgramsToFile
		SET "userInput=-1"
		EXIT /B
	) ELSE IF /I "%userInput%" EQU "Z" (
		SET /P "addPinnedProgram=ENTER FULL PROGRAM PATH (WITHOUT QUOTATION MARKS): "
		CALL :AddProgramToPinnedProgramsVar "!addPinnedProgram!"
		CALL :SavePinnedProgramsToFile
		SET "userInput=-1"
		EXIT /B
	) ELSE (
		CALL :TryRunPinnedProgramWithIndex "%userInput%"
	)
	SET "userInput=-1"
	EXIT /B
	
:HandleToolsMenuInput
	IF /I "%userInput%" EQU "0" (
		CALL :RunSystem32App "SERVICES.MSC"
	) ELSE IF /I "%userInput%" EQU "1" (
		CALL :RunSystem32App "TASKSCHD.MSC"
	) ELSE IF /I "%userInput%" EQU "2" (
		CALL :RunSystem32App "WINVER.EXE"
	) ELSE IF /I "%userInput%" EQU "3" (
		CALL :RunSystem32App "DISKMGMT.MSC"
	) ELSE IF /I "%userInput%" EQU "4" (
		CALL :RunSystem32App "COMPMGMT.MSC"
	) ELSE IF /I "%userInput%" EQU "5" (
		CALL :RunSystem32App "DEVMGMT.MSC"
	) ELSE IF /I "%userInput%" EQU "6" (
		CALL :RunSystem32App "EVENTVWR.MSC"
	) ELSE IF /I "%userInput%" EQU "7" (
		CALL :RunSystem32App "MBLCTR.EXE"
	) ELSE IF /I "%userInput%" EQU "8" (
		CALL :RunSystem32App "CONTROL.EXE"
	) ELSE IF /I "%userInput%" EQU "9" (
		CALL :RunSystem32App "MSINFO32.EXE"
	) ELSE IF /I "%userInput%" EQU "10" (
		CALL :RunPowershellCommand ""
	) ELSE IF /I "%userInput%" EQU "11" (
		CALL :RunSystem32App "RUNDLL32.EXE" "SHELL32.DLL,#61"
	) ELSE IF /I "%userInput%" EQU "12" (
		CALL :RunSystem32App "CMD.EXE"
	) ELSE IF /I "%userInput%" EQU "13" (
		CALL :RunSystem32App "TASKMGR.EXE" "-d"
	) ELSE IF /I "%userInput%" EQU "14" (
		CALL :RunSystem32App "NOTEPAD.EXE"
	) ELSE IF /I "%userInput%" EQU "15" (
		CALL :RunWindowsApp "REGEDIT.EXE"
	) ELSE IF /I "%userInput%" EQU "16" (
		CALL :RunSystem32App "MRT.EXE"
	) ELSE IF /I "%userInput%" EQU "17" (
		CALL :RunSystem32App "WF.MSC"
	) ELSE IF /I "%userInput%" EQU "18" (
		CALL :RunSystem32App "CLEANMGR.EXE"
	) ELSE IF /I "%userInput%" EQU "19" (
		CALL :RunSystem32App "DFRGUI.EXE"
	) ELSE IF /I "%userInput%" EQU "20" (
		CALL :RunSystem32App "RESMON.EXE"
	) ELSE IF /I "%userInput%" EQU "21" (
		CALL :RunSystem32App "DXDIAG.EXE"
	) ELSE IF /I "%userInput%" EQU "22" (
		CALL :RunSystem32App "IEXPRESS.EXE"
	) ELSE IF /I "%userInput%" EQU "23" (
		%WINDIR%\System32\GPEDIT.MSC >NUL 2>&1 || (
			CALL :ShowErrorPopup "ERROR:You must be using Windows Pro edition or better to use this app/feature."
		)
	) ELSE IF /I "%userInput%" EQU "24" (
		CALL :RunSystem32App "SNDVOL.EXE"
	) ELSE IF /I "%userInput%" EQU "25" (
		CALL :RunWindowsApp "EXPLORER.EXE" "shell:::{26EE0668-A00A-44D7-9371-BEB064C98683}\5\::{679f85cb-0220-4080-b29b-5540cc05aab6}"
	) ELSE IF /I "%userInput%" EQU "A" (
		CALL :RunSystem32App "MAIN.CPL"
	) ELSE IF /I "%userInput%" EQU "C" (
		CALL :RunSystem32App "NETPLWIZ.EXE"
	) ELSE IF /I "%userInput%" EQU "D" (
		CALL :RunSystem32App "APPWIZ.CPL"
	) ELSE IF /I "%userInput%" EQU "E" (
		CALL :RunSystem32App "MSCONFIG.EXE"
	) ELSE IF /I "%userInput%" EQU "F" (
		CALL :RunSystem32App "OPTIONALFEATURES.EXE"
	) ELSE IF /I "%userInput%" EQU "G" (
		CALL :RunSystem32App "SYSDM.CPL"
	) ELSE IF /I "%userInput%" EQU "H" (
		CALL :RunSystem32App "CONTROL.EXE" "DESK.CPL,,1"
	) ELSE IF /I "%userInput%" EQU "I" (
		CALL :RunSystem32App "CONTROL.EXE" "DESK.CPL,,0"
	) ELSE IF /I "%userInput%" EQU "J" (
		CALL :RunSystem32App "MAIN.CPL" "@1"
	) ELSE IF /I "%userInput%" EQU "K" (
		CALL :RunSystem32App "RUNDLL32.EXE" "SHELL32.DLL,Options_RunDLL"
	) ELSE IF /I "%userInput%" EQU "L" (
		CALL :RunSystem32App "NCPA.CPL"
	) ELSE IF /I "%userInput%" EQU "M" (
		CALL :RunSystem32App "RUNDLL32.EXE" "SYSDM.CPL,EditEnvironmentVariables"
	) ELSE IF /I "%userInput%" EQU "N" (
		CALL :RunSystem32App "JOY.CPL"
	) ELSE IF /I "%userInput%" EQU "O" (
		CALL :RunSystem32App "TABLETPC.CPL"
	) ELSE IF /I "%userInput%" EQU "P" (
		CALL :RunWindowsApp "EXPLORER.EXE" "shell:::{26EE0668-A00A-44D7-9371-BEB064C98683}\5\::{A8A91A66-3A7D-4424-8D24-04E180695C7A}"
	) ELSE IF /I "%userInput%" EQU "Q" (
		CALL :RunSystem32App "MMSYS.CPL"
	) ELSE IF /I "%userInput%" EQU "R" (
		CALL :RunSystem32App "TIMEDATE.CPL"
	) ELSE IF /I "%userInput%" EQU "S" (
		CALL :RunSystem32App "INTL.CPL"
	) ELSE IF /I "%userInput%" EQU "T" (
		CALL :RunSystem32App "CONTROL.EXE" "POWERCFG.CPL,,3"
	) ELSE IF /I "%userInput%" EQU "U" (
		CALL :RunSystem32App "POWERCFG.CPL"
	) ELSE IF /I "%userInput%" EQU "V" (
		CALL :RunSystem32App "USERACCOUNTCONTROLSETTINGS.EXE"
	) ELSE IF /I "%userInput%" EQU "W" (
		CALL :RunSystem32App "COLORCPL.EXE"
	) ELSE IF /I "%userInput%" EQU "X" (
		CALL :RunSystem32App "INETCPL.CPL"
	) ELSE IF /I "%userInput%" EQU "Y" (
		CALL :RunSystem32App "RUNDLL32.EXE" "SHELL32.DLL,Control_RunDLL SRCHADMIN.DLL"
	) ELSE IF /I "%userInput%" EQU "AA" (
		CALL :RunwindowsApp "EXPLORER.EXE" "shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}"
	) ELSE IF /I "%userInput%" EQU "BB" (
		CALL :RunwindowsApp "EXPLORER.EXE" "shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921} -Microsoft.Personalization\pageWallpaper"
	) ELSE IF /I "%userInput%" EQU "CC" (
		CALL :RunwindowsApp "EXPLORER.EXE" "shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921} -Microsoft.Personalization\pageColorization"
	) ELSE IF /I "%userInput%" EQU "B" (
		SET "menuToLoadIndex=0"
	) ELSE IF /I "%userInput%" EQU "Z" (
		CALL :RunWindowsApp "EXPLORER.EXE" "shell:::{26EE0668-A00A-44D7-9371-BEB064C98683}\5\::{D20EA4E1-3957-11d2-A40B-0C5020524153}"
	)
	SET "userInput=-1"
	EXIT /B
	
:HandleHelpMenuInput
	IF /I "%userInput%" EQU "B" (
		SET "menuToLoadIndex=0"
	) ELSE IF /I "%userInput%" EQU "Z" (
		START "" "https://github.com/martinlxxx6"
	)
	SET "userInput=-1"
	EXIT /B
	
:HandlePowerMenuInput
	IF /I "%userInput%" EQU "B" (
		SET "menuToLoadIndex=0"
	) ELSE IF /I "%userInput%" EQU "1" (
		SET /P "confirmation=ARE YOU SURE YOU WANT TO SHUTDOWN YOUR PC? (Y)(N): "
		IF /I "!confirmation!" EQU "Y" (
			CALL :RunSystem32App "SHUTDOWN.EXE" "/S /T 0"
		)
	) ELSE IF /I "%userInput%" EQU "2" (
		SET /P "confirmation=ARE YOU SURE YOU WANT TO REBOOT YOUR PC? (Y)(N): "
		IF /I "!confirmation!" EQU "Y" (
			CALL :RunSystem32App "SHUTDOWN.EXE" "/R /T 0"
		)
	) ELSE IF /I "%userInput%" EQU "3" (
		SET /P "confirmation=ARE YOU SURE YOU WANT TO SIGN OUT? (Y)(N): "
		IF /I "!confirmation!" EQU "Y" (
			CALL :RunSystem32App "SHUTDOWN.EXE" "/L"
		)
	) ELSE IF /I "%userInput%" EQU "4" (
		CALL :RunSystem32App "RUNDLL32.EXE" "USER32.DLL,LockWorkStation"
	)
	SET "userInput=-1"
	EXIT /B



REM Useful Functions
:GetStrLength
	SET "str=%~1"
	SET "strLen=0"
	:Loop
		IF DEFINED str (
			SET "str=%str:~1%"
			SET /A "strLen+=1"
			GOTO Loop
		)
	EXIT /B

:RunSystem32App
	START "" %WINDIR%\System32\%~1 %~2
	EXIT /B

:RunWindowsApp
	START "" %WINDIR%\%~1 %~2
	EXIT /B
	
:RunPowershellCommand
	START "" %WINDIR%\System32\WindowsPowershell\v1.0\POWERSHELL.EXE %~1
	EXIT /B
	
:ShowErrorPopup
	START "" %WINDIR%\System32\MSHTA.EXE "about:<script>alert('%~1');close()</script>"
	EXIT /B



REM Save & Load Functions
:SavePinnedProgramsToFile
	ECHO [PinnedPrograms]>"%programsIniFile%"
	IF NOT DEFINED pinnedPrograms (
		EXIT /B
	)

	FOR %%i IN ("%pinnedPrograms:;=","%") DO (
		ECHO Program=%%~i>>"%programsIniFile%"
	)
	EXIT /B

:LoadPinnedProgramsFromFile
	IF NOT EXIST "%programsIniFile%" (
		EXIT /B
	)

	FOR /F "usebackq tokens=1,2 delims==" %%a IN ("%programsIniFile%") DO (
		IF "%%a" EQU "Program" (
			CALL :AddProgramToPinnedProgramsVar "%%b"
		)
	)
	EXIT /B

:AddProgramToPinnedProgramsVar
	IF NOT DEFINED pinnedPrograms (
		SET "pinnedPrograms=%~1"
		EXIT /B
	) ELSE (
		SET "pinnedPrograms=%pinnedPrograms%;%~1"
	)
	EXIT /B
	
:RemoveProgramToPinnedProgramsVarWithIndex
	IF NOT DEFINED pinnedPrograms (
		ECHO NO PROGRAMS PINNED FOUND.
		PAUSE
		EXIT /B
	)
	
	SET "removeIndex=%~1"
	SET "newPinnedPrograms="
	SET "forLoopCount=0"
	FOR %%i IN ("%pinnedPrograms:;=","%") DO (
		SET /A forLoopCount+=1

		IF "!forLoopCount!" NEQ "%removeIndex%" (
			IF DEFINED newPinnedPrograms (
				SET "newPinnedPrograms=!newPinnedPrograms!;%%~i"
			) ELSE (
				SET "newPinnedPrograms=%%~i"
			)
		)
	)
	SET "pinnedPrograms=!newPinnedPrograms!"
	EXIT /B
	
:TryRunPinnedProgramWithIndex
	IF NOT DEFINED pinnedPrograms (
		ECHO NO PROGRAMS ARE PINNED YET, TRY PINNING A PROGRAM TO RUN IT.
		PAUSE
		EXIT /B
	)
	
	SET "forLoopCount=0"
	FOR %%i IN ("%pinnedPrograms:;=","%") DO (
		SET /A "forLoopCount+=1"
		
		IF "%~1" EQU "!forLoopCount!" (
			START "" "%%~i"
			EXIT /B
		)
	)
	EXIT /B