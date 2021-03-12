if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadline
    
    Set-PSReadLineKeyHandler -Key Ctrl+u -Function RevertLine
    Set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
    Set-PSReadLineKeyHandler -Key Ctrl+w -Function ShellBackwardKillWord
}

# Easier Navigation: .., ..., ...., ....., and ~
${function:~} = { Set-Location ~ }
# PoSh won't allow ${function:..} because of an invalid path error, so...
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }

# General shortcuts
New-Alias c clear
New-Alias l ls
New-Alias sw winget.exe

${function:run-dbqg} = { cd C:\Projects\NICAPRA-GIT\Deployments\Powershell\BatchFiles\; & '.\Run DBQG in Kestrel.bat' }

function makedir { CreateAndSet-Directory }
New-Alias mkd makedir

function ex { exit }
New-Alias e ex

# Navigation Shortcuts
${function:drop} = { Set-Location ~\Documents\Dropbox }
${function:dt} = { Set-Location ~\Desktop }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }

# Empty the Recycle Bin on all drives
Set-Alias emptytrash Empty-RecycleBin

# Cleanup old files all drives
Set-Alias cleandisks Clean-Disks

# Reload the shell
Set-Alias powershell Reload-Powershell