import subprocess
from subprocess import PIPE, run

filename = "/home/eddy/dotfiles/tmpfile-for-recent-workspace-switch.txt"

# Get previous workspace
previous_workspace = None
with open(filename) as f:
    previous_workspace = f.readline().strip()

# Get current workspace
result = run(["xdotool", "get_desktop"], stdout=PIPE, stderr=PIPE, universal_newlines=True)
current_workspace = result.stdout

with open(filename, 'w') as f:
    f.write(str(current_workspace))

subprocess.call(["xdotool", "getactivewindow", "set_desktop_for_window", str(previous_workspace)])
subprocess.call(["xdotool", "set_desktop", str(previous_workspace)])