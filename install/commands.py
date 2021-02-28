import json
import shlex
import subprocess
from os import path
from subprocess import Popen, PIPE

from disks import parse_disks
from interaction import info, fail, ok, prompt


def cmd_literal(command):
    p = subprocess.Popen(command, universal_newlines=True, shell=True, stdout=subprocess.PIPE,
                         stderr=subprocess.STDOUT)
    return p.stdout.read().strip()


def __cmd(command, interactive=False):
    """
    Execute a shell command
    :param command: a list of strings with command + parameters
    :return:
    """
    # try:
    if not isinstance(command, list):
        command = shlex.split(command)

    if interactive:
        """Interactive commands will show their debug information on their own. 
        We can't block their input by sending stdout and stderr into a variable here."""
        process = Popen(command, universal_newlines=True)
        process.communicate()
        return

    process = Popen(command, stdout=PIPE, stderr=PIPE, universal_newlines=True)
    stdout, stderr = process.communicate()
    returncode = process.returncode

    if returncode == 0:
        if stdout:
            info(stdout)
        ok("Return return code {}.".format(returncode))
    elif returncode == 1:
        fail("Return return code {}.\n{}".format(returncode, stderr))
    else:
        fail("Unknown return code {} (not necessarily an error).\nPlease investigate.\n"
             "Stdout: '{}'\nStderr: '{}'"
             .format(returncode, stdout, stderr))


def git_ssh_setup(email):
    info("Generating ssh keys... {}".format(email))
    __cmd("ssh-keygen -t rsa -b 4096 -C {}".format(email), interactive=True)  # Generate key
    info("Execute the next command manually, in a separate window. Press enter when done.")
    print("eval \"$(ssh-agent -s)\" && ", end="")
    print("ssh-add ~/.ssh/id_rsa && ", end="")
    print("xclip -sel clip < ~/.ssh/id_rsa.pub")
    if prompt('Done?'):
        __cmd("xdg-open https://github.com/settings/ssh/new")


def set_locale_keyboard():
    __cmd('localectl set-keymap dvorak')


def set_fish_shell():
    __cmd("sudo usermod -s /usr/bin/fish eddy")


def get_disks():
    output = cmd_literal("sudo parted -l")
    return parse_disks(output)


def get_config(file_path):
    info("Retrieving configuration file from {}...".format(file_path))
    config = json.load(open(file_path))
    if config:
        ok("Found install configuration...")
        return config
    else:
        fail("Could not find configuration at {}".format(file_path))


def link(source, target, sudo=False):
    target_path = path.dirname(target)
    info("Creating path '{}'...".format(target_path))
    __cmd("mkdir -p {}".format(target_path))
    info("Linking '{}' to '{}'...".format(source, target))
    if sudo:
        __cmd(['sudo', 'ln', '-sfn', source, target])
    else:
        __cmd(['ln', '-sfn', source, target])


def set_data_directory(line):
    dir = "/mnt/data"
    info("Setting data directory at {}, using partition {}...".format(dir, line.split()[0]))
    __cmd("sudo mkdir -p {}".format(dir))
    __cmd("sudo sed -i '$ a\\{}' /etc/fstab".format(line))


def install_applications(applications, package_manager, install_command, install_args):
    info("Applications to install: {}".format(applications))
    for app in applications:
        info("Installing {}...".format(app))
        __cmd("sudo {} {} {} {}".format(package_manager, install_command, app, install_args), interactive=True)
