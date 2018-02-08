@ECHO OFF
@ECHO BACKUP DE ARCHIVOS TRACE

if [%1] == [] (goto proc1) else (goto proc2)

:proc1
SET TERNET_FOLDER=c:\TERNET
@ECHO Ruta ternet por defecto
GOTO check_dir

:proc2
SET TERNET_FOLDER=%1
@ECHO Ruta ternet %1
GOTO check_dir

:check_dir
if not exist %TERNET_FOLDER% (goto no_dir)
goto main

:no_dir
ECHO LA CARPETA %TERNET_FOLDER% NO EXISTE
pause
goto end

:main
REM creamos una variable conteniendo la fecha actual con el formato año-mes-dia
SET FOLDER=%date:~6,4%-%date:~3,2%-%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%  

REM Creamos la carpeta donde se guardará la copia de respaldo

REM Seteamos las propiedades del comando XCOPY
SET BACKUPCMD=XCOPY /E /I

REM Ejecutamos la instrucción
%BACKUPCMD% "%TERNET_FOLDER%\trace" %TERNET_FOLDER%\Backup_trace\Trace_%FOLDER%

REM Borramos la carpeta original para que el ternet la cree nuevamente
DEL %TERNET_FOLDER%\trace /S /Q

:end
