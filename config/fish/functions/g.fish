function g --description "Git aliases"

    # Do we have a first argument?
    if [ $argv[1] ]

        if [ $argv[1] = "diff" ]
	    if [ $argv[2] ]
                git diff --color=always $argv[2..-1] | less -r
            else
                git diff --color=always | less -r
            end
        else if [ $argv[1] = "ignore" ]
            if [ $argv[2] ]
                if [ $argv[2] = "dl" ]
                    download-gitignore
                else if [ $argv[2] = "update" ]
                    git rm -r --cached .; and co "Add .gitignore"
                else
                    echo "Could not figure out which 'ignore' follow-up command to use."
                end
            else
                echo "Please specify something after 'git ignore'."
            end

        # Branch
        else if [ $argv[1] = "br" ]

            # Do we have a second argument?
            if [ $argv[2] ]

                if [ $argv[2] = "rm" ]
                    if [ $argv[3] ]
                        git branch -d $argv[3]; git push -d origin $argv[3]
                    else
                        echo "Please specify which branch to remove."
                    end
                else if [ $argv[2] = "push" ]
                    push --set-upstream origin (git branch | sed -n -e 's/^\* \(.*\)/\1/p')
                else if [ $argv[2] = "replace" ]
                    # g br replace <> with <>
                    #old = $argv[3]
                    #new = $argv[5]
                    git checkout $argv[5]; and git merge -s ours $argv[3]; and git checkout $argv[3]; and git merge $argv[5]; g br rm $argv[3]
                else
                    echo "Could not figure out what to do with 'branch'."
                end

            # No second argument defined by us. Execute builtin.
            else
                git branch
            end

        else if [ $argv[1] = "set-url" ]
            git remote set-url origin $argv[2]

        else if [ $argv[1] = "first-push" ]
            git remote add origin $argv[2]
            push -u origin master

        else if [ $argv[1] = "commit" ]
            co $argv[2..-1]

        else if [ $argv[1] = "iinit" ]
            iinit $argv[2..-1]

        else if [ $argv[1] = "ls" ]
            git log --graph --pretty=format:'%C(dim)%h %C(cyan)(%cr) %C(blue bold)|%C(reset)%C(yellow)%d%Creset %s %C(bold blue)- %an%Creset' --abbrev-commit --color=always | less -r

        else if [ $argv[1] = "ch" ]
            if [ $argv[2] = "br" ]
                if [ $argv[3] ]  
                    git checkout $argv[3..-1]
                else
		    #Display branches, search with fzf, read result, checkout result minus remotes/origin if present, so that we have it locally.
                    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout (string replace 'remotes/origin/' '' -- "$result")
                end
	    else if [ $argv[2] = "-b" ]

  # Check if user really wants to create a branch from non-dev
  set git_branch (git branch ^/dev/null | grep "\*" | sed 's/* //')
  if [ $git_branch != develop ]
    read -l -P 'Current branch is not develop, continue? [y/N] ' confirm
    switch $confirm
      case Y y
        git checkout $argv[2..-1]
      case '' N n
        return 1
    end
  else 
    git checkout $argv[2..-1]
  end

            else if [ $argv[2] ]
                git checkout $argv[2..-1]
            else
                echo "Please specify something after 'git checkout'."
            end

        else if [ $argv[1] = "st" ]
            git status

        else if [ $argv[1] = "pull" ]
            git pull

        else if [ $argv[1] = "push" ]
            git push

        else if [ $argv[1] = "clone" ]
            git clone

        else if [ $argv[1] = "ls" ]
            git clone

        # No first argument defined by us. Execute builtin.
        else 
            git $argv[1..-1]
        end
    else
        git status
    end
end

function iinit --description 'Check if git repo already exists'
    if test -d .git
        echo "Git repo already exists."
        if read_confirm
            echo "Removing old git repo."
            sudo rm .git -r
            download-gitignore $argv[1..-1]
            git init; and co Initial commit.
        else
            echo "Not removing old git repo."
        end
    else 
        echo "Git repo does not exist yet, initializing."
        download-gitignore $argv[1..-1]
        git init; and co Initial commit.
    end
end

function download-gitignore
    wget "https://www.gitignore.io/api/$argv[1..-1]" -O .gitignore2 -q; and cat .gitignore2 | sed '1,3d' - > .gitignore; and rm .gitignore2; and echo "Initialized gitignore from $argv[1..-1]."
    echo ".idea/" >> .gitignore
end
