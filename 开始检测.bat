@echo off&
echo.
echo ##### �����ηɽ���������⹤�� Mod By ���� #####
echo.
if exist "%~dp0\main.py" (echo ����SSRSpeedĿ¼�£���ӭʹ��) else (echo ����ڼ�⹤��Ŀ¼�����У� )
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (echo ��ǰ�޹���ԱȨ��) else (echo ��ǰ�ѻ�ȡ����ԱȨ��)
:start
echo ====================================
echo 1����ʼ���٣��Զ������ã�
echo 2���״�����ǰ��װpip�����֧�֣���Ҫ����ԱȨ�ޣ�
echo 3��Ϊ�������л�ȡ����ԱȨ��
echo ====================================
echo ��ѡ��1~3����
choice /c 123
if %errorlevel%==3 (goto :uac)
if %errorlevel%==2 (goto :pip)
if %errorlevel%==1 (goto :test2)


:pip
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (echo #��ǰ�޹���ԱȨ�ޣ��޷���װ�� && echo. && echo #������ͨ������3��ȡȨ�ޣ����Ҽ��Թ���ԱȨ�������� && pause && goto :start) else (goto :pip2)
:pip2
python -m pip install --upgrade pip
pip3 install -r %~dp0%\requirements.txt
::pip3 install requests
::pip3 install pyyaml
::pip3 install Pillow
::pip3 install pysocks
::pip3 install aiohttp
::pip3 install aiohttp_socks
::pip3 install requests[socks]
::pip3 install flask
::pip3 install flask-cors
pause
goto :start

:test2
echo.
echo      �����Զ���ѡ�����ջس���������
echo.
:test3
set /p a=���������Ķ�������(�Ҽ�ֱ��ճ������������):
if "%a%"=="" (
goto :test3
) else (
goto :jx1
)
:jx1
echo      ����2�����ͨ���ո�ָ��ؼ���
set /p e=1.ʹ�ùؼ���ͨ��ע��ɸѡ�ڵ�:
set /p i=2.ͨ��ʹ�ùؼ��ֵ�ע���ų��ڵ�:
set /p k=3.�������������:
echo.
if "%e%"=="" (
set e= && goto :jx1
) else (
set e=--include-remark %e% && goto :jx1
)
:jx1
if "%i%"=="" (
set i= && goto :jx2
) else (
set i=--exclude-remark %i% && goto :jx2
)
:jx2
if "%k%"=="" (
set k= && goto :jx3
) else (
set k=-g %k% && goto :jx3
)
:jx3
set o=--skip-requirements-check && goto :jx4
:jx4
echo python main.py -u "%a%" %e% %i% %k% %y% %m% %n%  %o%
echo.
python main.py -u "%a%" %e% %i% %k% %y% %m% %n%  %o%
pause
set e=
set i=
set k=
set o=
goto :start

:uac
echo.
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
echo ��ʾ��ͨ��������װ��Ҫ����ԱȨ��
echo.
echo      ���Ի�ȡ����ԱȨ�ޣ���������
ping -n 3 127.0.0.1>nul && %1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
cd /d "%~dp0"
echo.
echo �ѻ�ȡ����ԱȨ��
echo.
pause
goto :start