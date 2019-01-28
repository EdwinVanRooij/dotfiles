function d --description "Docker aliases"

    # Do we have a first argument?
    if [ $argv[1] ]

        # Switch over first argument
        # Container
        if [ $argv[1] = "c" ]

            # Do we have a second argument?
            if [ $argv[2] ]

                if [ $argv[2] = "rm" ]
                    if [ $argv[3] = "-a" ]
                        docker container rm (docker container ls -a -q)
                    else
                        docker container rm $argv[3..-1]
                    end
                else if [ $argv[2] = "stop" ]
                    if [ $argv[3] = "-a" ]
                        docker container stop (docker container ls -a -q)
                    else
                        docker container stop $argv[3..-1]
                    end
    
                else if [ $argv[2] = "ls" ]
                    echo "You're listing processes, not files. Use 'ps' instead."
                else
                    docker container $argv[2..-1]
                end
    
            # No second argument defined by us. Execute builtin.
            else
                docker container
            end

        # Image
        else if [ $argv[1] = "i" ]

            # Do we have a second argument?
            if [ $argv[2] ]
                if [ $argv[2] = "rm" ]
                    if [ $argv[3] = "-a" ]
                        docker image rm (docker image ls -a -q)
                    else
                        docker image rm $argv[3..-1]
                    end
                else
                    docker image  $argv[2..-1]
                end

            # No second argument defined by us. Execute builtin.
            else
                docker image
            end

        # Run
        else if [ $argv[1] = "r" ]
            docker run $argv[2..-1]

        # No first argument defined by us. Execute builtin.
        else 
            docker $argv[1..-1]
        end
    else
        docker
    end
end
