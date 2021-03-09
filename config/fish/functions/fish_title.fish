function fish_title
	echo (cat /etc/os-release | sed -n '5 p' | grep -o '".*"' | sed 's/"//g')
end
