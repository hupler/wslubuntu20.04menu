::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCJVXwmLMleeCaIS5Of66/m7jX4ieOsxbZfkiOfdebld40brFQ==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAjk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCJVXwmLMleeCaIS5Of66/m7t08IWvYqOJjI1vSDJe4G1lDmYJg5wzoIyIVcWFtVexy+Llxm52taswQ=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:menu
color a
cls
ECHO.
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
ECHO after executing please reopen program
pause
wsl -d Ubuntu-20.04 -u hupli bash -c 'echo -e "#!/bin/bash

#screen -d -m -S KEEPALIVE /home/hupli/keepalive.sh
nohup sleep 2628002 &

clear
clear
sleep 1
clear

<<'kys'
download_animation() {
    local width=20
    local chars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
    local total_steps=${#chars[@]}
    local delay=0.1

    for ((i = 0; i < width; i++)); do
        local progress=""
        local index=$((i % total_steps))

        for ((j = 0; j < width; j++)); do
            if [ ${j} -lt ${i} ]; then
                progress+="${chars[-1]}"  # Filled part
            elif [ ${j} -eq ${i} ]; then
                progress+="${chars[${index}]}"  # Current progress
            else
                progress+=" "  # Empty part
            fi
        done

        echo -n -e "\\r[${progress}]"
        sleep ${delay}
    done
}
kys
bash /home/hupli/loading.sh
echo -e "\\nBubuntim anak yatim"
sleep 1" > ~/keepalive.sh'
GOTO menu

:bubuntim_yey
cls
echo lol noob
timeout /t 2 /nobreak > Nul
EXIT

:on
cls
echo Starting Ubuntu-22.04...
echo please wait until you return to the menu
wsl -t Ubuntu-20.04
wsl -d Ubuntu-20.04 -u hupli bash ~/keepalive.sh
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
    timeout 10
    wsl.exe -d Ubuntu-20.04 -- bash -c "echo Loading... && sleep 3"
    GOTO menu
) ELSE IF "%E%"=="help" (
    echo type 8747 to go to the menu or shell for shell mode
    GOTO qckrn
) ELSE (
    wsl -d Ubuntu-20.04 -u hupli cd ~ ^& %E%
    GOTO qckrn
)

:menu1
cls
GOTO menu
