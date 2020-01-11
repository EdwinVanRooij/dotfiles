import subprocess
from subprocess import PIPE, run

filename = "/home/eddy/dotfiles/tmpfile-for-recent-workspace-switch.txt"

# Get current workspace
result = run(["xdotool", "get_desktop"], stdout=PIPE, stderr=PIPE, universal_newlines=True)
current_workspace = int(result.stdout) # int
print("Current workspace: " + str(current_workspace))

with open(filename, 'w') as f:
    f.write(str(current_workspace))

workspace_left = None # int
if current_workspace > 0: 
    workspace_left = current_workspace - 1
elif current_workspace is 0:
    workspace_left = 3
else:
    print("Shouldn't happen, current workspace = " + current_workspace + str(type(current_workspace)))
    workspace_left = 99

print("Workspace left be: " + str(workspace_left))

subprocess.call(["xdotool", "getactivewindow", "set_desktop_for_window", str(workspace_left)])
subprocess.call(["xdotool", "set_desktop", str(workspace_left)])
