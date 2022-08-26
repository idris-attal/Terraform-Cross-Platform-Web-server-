@ECHO OFF

ECHO.
ECHO ===================================================================
ECHO Welcome to the cross platform Terrafrom web server generating tool
ECHO ===================================================================
ECHO.
ECHO 1. AWS
ECHO 2. GCP
ECHO 3. AZURE

ECHO -------------------------------------------------------------------


CHOICE /N /C:123 /M "PLEASE PICK A NUMBER TO DEPLOY YOUR WEB SERVER (1, 2, or 3)"%1
IF ERRORLEVEL ==3 GOTO AZURE
IF ERRORLEVEL ==2 GOTO GCP
IF ERRORLEVEL ==1 GOTO AWS


:AZURE
ECHO YOU HAVE CHOOSEN AZURE AS YOUR DEOPLOYMENT ENGINE
cd\UNIBZ\2nd semester\cloud\project\azure
cmd.exe /k 


:GCP
ECHO YOU HAVE CHOOSEN GOOGLE CLOUD AS YOUR DEOPLOYMENT ENGINE
cd\UNIBZ\2nd semester\cloud\project\google_cloud
cmd.exe /k 

:AWS
ECHO YOU HAVE CHOOSEN AWS AS YOUR DEOPLOYMENT ENGINE
cd\UNIBZ\2nd semester\cloud\project\aws
cmd.exe /k 


