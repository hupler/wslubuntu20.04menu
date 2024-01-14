set /p UNAME=< uname.txtd
echo Starting Ubuntu-20.04...
wsl -t Ubuntu-20.04
wsl -d Ubuntu-20.04 -u %UNAME% bash /home/%UNAME%/start.sh
