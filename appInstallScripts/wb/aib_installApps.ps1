# Software install Script
#
# Applications to install:
# Chrome Enterprise
# Zoom for VDI
# Adobe Acrobat Pro DC




#region Set logging 
$logFile = "c:\ImageBuilder\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion

#region Chrome Enterprise
try {
    Start-Process -filepath msiexec.exe -Wait -ErrorAction Stop -ArgumentList '/i', 'c:\ImageBuilder\google\googlechromestandaloneenterprise64.msi', '/quiet'
    if (Test-Path "C:\Program Files\Google\Chrome\Application\chrome.exe") {
        Write-Log "Google Chrome Enterprise"
    }
    else {
        write-log "Error locating the chrome executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing chrome: $ErrorMessage"
}
#endregion

#region Adobe Acrobat
try {
    Start-Process -filepath 'C:\ImageBuilder\Adobe Acrobat\setup.exe' -Wait -ErrorAction Stop -ArgumentList '/sALL' 
    if (Test-Path "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe") {
        Write-Log "Adobe Acrobat has been installed"
    }
    else {
        write-log "Error locating the Acrobat executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Acrobat: $ErrorMessage"
}
#endregion


#region Zoom VDI
try {
    Start-Process -filepath 'C:\ImageBuilder\zoom\ZoomInstallerVDI.msi' -Wait -ErrorAction Stop -ArgumentList '/quiet', '/qn', '/norestart','ZoomAutoUpdate=1', 'zConfig="nogoogle=1"', 'CUSTOMINSTALL=2', 'INSTALLFORAVD=1'
    if (Test-Path "C:\Program Files\ZoomVDI\bin\Zoom.exe") {
        Write-Log "Zoom VDI has been installed"
    }
    else {
        write-log "Error locating the Zoom VDI executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Zoom VDI: $ErrorMessage"
}
#endregion
