import subprocess
from subprocess import PIPE, run

filename = "/home/eddy/dotfiles/tmpfile-for-recent-workspace-switch.txt"

# Get current workspace
result = run(["xdotool", "get_desktop"], stdout=PIPE, stderr=PIPE, universal_newlines=True)
current_workspace = result.stdout

with open(filename, 'w') as f:
    f.write(str(current_workspace))

subprocess.call(["xdotool", "set_desktop", "--relative", "3"])
