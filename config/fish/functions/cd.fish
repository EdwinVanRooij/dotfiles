function cd --description "Change directory"

    if not test -d $argv

	for x in */
            switch $x
                case "$argv*"
                    cd $x
                    return 0;
            end
	end

        z $argv
        return 0;

    end

    builtin cd $argv; and ls
end

