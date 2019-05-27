function sudo --description 'Run command using sudo.'

      if test (count $argv) -gt 0
          set cmd "command sudo $argv"
      else
          if test (count $argv) -gt 1
              set cmd "command sudo $history[1] $argv[2..-1]"
          else
              set cmd "command sudo $history[1]"
          end
      end
      eval $cmd
end
