function show --description 'Shows the files (opens explorer).'

set distro (lsb_release -i | cut -d: -f2 | sed 's/	//')
    if [ $distro = "Ubuntu" ]
	explorer.exe
    else
        nautilus . &
        disown
    end
end
