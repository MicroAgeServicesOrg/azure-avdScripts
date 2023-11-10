##Script to download azCopy and download software package from Blob. 


New-Item -Type Directory -Path 'c:\' -Name ImageBuilder

invoke-webrequest -uri 'https://aka.ms/downloadazcopy-v10-windows' -OutFile 'c:\\ImageBuilder\\azcopy.zip'

Expand-Archive 'c:\\ImageBuilder\\azcopy.zip' 'c:\\ImageBuilder'

copy-item 'C:\\ImageBuilder\\azcopy_windows_amd64_*\\azcopy.exe\\' -Destination 'c:\\ImageBuilder'



# Inline command that uses AZCopy to download the archive file and extract to the ImageBuilder directory
# Use the SAS URL for the <ArchiveSource>
c:\ImageBuilder\azcopy.exe copy 'https://wbeusavdapps.blob.core.windows.net/avdbaselinesoftware/software.zip?sp=rl&st=2023-11-10T19:03:24Z&se=2024-11-11T03:03:24Z&spr=https&sv=2022-11-02&sr=c&sig=xyXQye8IRT3DL9gUlRz8V1Tqo2XAXHi6BnbSrktHMdU%3D' c:\\ImageBuilder\\software.zip
Expand-Archive 'c:\\ImageBuilder\\software.zip' c:\\ImageBuilder