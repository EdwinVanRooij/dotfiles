function sw --description 'Shows the files (opens explorer).'

set distro (lsb_release -i | cut -d: -f2 | sed 's/	//')
    if [ $distro = "Ubuntu" ]
	sudo apt-get $argv
    else
	sudo eopkg $argv
    end
end
