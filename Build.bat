c:
cd C:\Tools\Nuget

rem *** check out for edit ***
"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\tf.exe" checkout $/Tools/Nuget /recursive

rem *** update version ***
powershell C:\Tools\Nuget\UpdateVersion.ps1

rem *** build solution ***
"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" C:\Tools\Nuget\Nuget-Demo.sln


rem *** check in ***
for /F "Tokens=3*" %%a in ('reg query HKLM\SOFTWARE\Astea /v DSEBuild') do set DSEBuild=%%a %%b 

@set /a "DSECurrentBuild=%DSEBuild%-1"
echo %DSECurrentBuild%

"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\tf.exe" checkin /comment:"New DSE Build 1.0.%DSECurrentBuild%" /noprompt