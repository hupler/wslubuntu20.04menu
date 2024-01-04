@echo off
set /p UNAME=< uname.txt
:menu
color a
cls
cls
cls
ECHO.
echo %texte%
if exist uname.txt (
    set /p nm=< uname.txt  
    echo Your username is: %UNAME%
    rem Add your command here that needs the username
) else (
    echo Username not found. setup will open in 3 seconds
    timeout 3 /nobreak > Nul
    goto stup
)
ECHO ...............................................
ECHO PRESS 1, 2, 3, or 0 to EXIT.
ECHO ...............................................
ECHO.
ECHO 1 - START
ECHO 2 - SHUTDOWN
ECHO 3 - QUICK RUN COMMAND
ECHO 4 - SETUP MENU
ECHO 0 - EXIT
ECHO.
wsl -l -v
ECHO.
SET /P M=Type 1, 2, 3, 4, or 0 then press ENTER:
IF "%M%"=="1" GOTO on
IF "%M%"=="2" GOTO off
IF "%M%"=="3" (
    cls
    GOTO qckrn
)
IF "%M%"=="0" GOTO bubuntim_yey
IF "%M%"=="4" goto stup
GOTO menu

:stup
cls
SET /P UNAME=Enter your username: 
echo %UNAME%>uname.txt

ECHO after executing please reopen program
pause
wsl --cd "/home/%UNAME%" -d Ubuntu-20.04 -u %UNAME% wget https://raw.githubusercontent.com/hupler/wslubuntu20.04menu/main/setup.sh
GOTO menu

:bubuntim_yey
cls/
echo lol noob
timeout /t 2 /nobreak > Nul
EXIT

:on
cls
echo Starting Ubuntu-22.04...
echo please wait until you return to the menu
wsl -t Ubuntu-20.04
wsl -d Ubuntu-20.04 -u %UNAME% bash /home/%UNAME%/start.sh
echo completed 
echo to go back to the menu
pause
goto menu

:off
cls
wsl --shutdown
goto menu

:sts
wsl -l -v

:qckrn
color
SET /P E=type command[help]:
IF "%E%"=="8747" (
    GOTO menu
) ELSE IF "%E%"=="shell" (
    cls
    echo type exit to go back to menu
    echo shell will start in 10 seconds
    timeout /t 10 /nobreak 
    wsl.exe -d Ubuntu-20.04
    GOTO menu
) ELSE IF "%E%"=="help" (
    echo type 8747 to go to the menu or shell for shell mode
    GOTO qckrn
) ELSE (
    wsl --cd "/home/%UNAME%" -d Ubuntu-20.04 -u %UNAME% %E%
    GOTO qckrn
)

