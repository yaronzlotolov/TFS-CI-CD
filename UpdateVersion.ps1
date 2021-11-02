xcopy "C:\Tools\Nuget\Nuget-Demo.csproj" "C:\Tools\Nuget\Nuget-Demo\" /r /y

$path = "C:\Tools\Nuget\Nuget-Demo\Nuget-Demo.csproj"

$VERSION =  Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Astea\' -Name DSEBuild

echo $VERSION

$VERSION.GetType().FullName

(Get-Content -path $path -Raw) -replace "1.0.1","1.0.$VERSION" | Set-Content -Path $path


[int]$VERSIONUPDATE = [int]$VERSION+1

echo $VERSIONUPDATE

$VERSIONUPDATE.GetType().FullName

Set-ItemProperty -Path 'HKLM:\SOFTWARE\Astea' -Name "DSEBuild" -Value $VERSIONUPDATE