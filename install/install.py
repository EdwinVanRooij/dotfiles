#!/usr/bin/env python3
"""
This script installs my dotfiles on a new machine.
"""

__author__ = "Edwin van Rooij"

from commands import install_applications, link, git_ssh_setup, get_disks, \
    set_data_directory
from commands import set_fish_shell, set_locale_keyboard, get_config
from interaction import header, description, prompt, prompt_options, ok, exit_program


def main():
    config = get_config()
    email = config["email"]
    symlinks = config["symlinks"]
    applications = config["applications"]

    header('Welcome!')
    description('This is my dotfiles repo.\n All programs will now safely install on your system.\n', symbol=False)
    description('Author: ' + __author__)
    if not prompt('Continue?'):
        exit_program()

    # Initialize data disk(s)
    header('Data')
    # 1; Setup disks?
    if prompt('Setup data partition?'):
        disks = get_disks()

        # 2; Multiple disks available?
        if len(disks) > 1:
            for idx, d in enumerate(disks):
                print(idx, d)
            chosen = prompt_options("Which disk would you like to use?", range(len(disks)))
            disk_to_use = disks[chosen]
        else:
            disk_to_use = disks[0]
        ok("Using disk '{}'.".format(str(disk_to_use)))

        # 3; Partition
        for p in disk_to_use.partitions:
            print(p.number, p)
        chosen = prompt_options("Which partition would you like to use?", disk_to_use.get_partition_numbers())
        partition_to_use = disk_to_use.get_partition_by_number(chosen)
        ok("Using partition '{}'.".format(partition_to_use))
        partition_location = disk_to_use.location
        if 'nvme' in disk_to_use.location:
            partition_location += 'p'
        partition_location += partition_to_use.number
        path = "/mnt/data"
        fstab_line = "{} {} auto nosuid,nodev,nofail,x-gvfs-show,uid=1000,gid=1000,dmask=027,fmask=137 0 0".format(
            partition_location,
            path,
        )
        set_data_directory(fstab_line)
        link(path, "~/Data")

    # Install software using package manager
    header('Software installation')
    if prompt('Install config-specified software using package manager?'):
        install_applications(
            applications,
            package_manager="eopkg",
            install_command="install"
        )

    # Setup symlinks
    header('Symbolic links')
    if prompt('Execute symlinks from config.json?'):
        for source, target in symlinks.items():
            link(source, target)

    header('Shell')
    if prompt('Setup Fish as default shell?'):
        set_fish_shell()

    # Setup git ssh key
    header('Git')
    if prompt('Generate SSH keys?'):
        git_ssh_setup(email)

    # Setup key mapping
    header('Locale keyboard')
    if prompt('Modify locale keyboard to set dvorak? (login uses this)'):
        set_locale_keyboard()


if __name__ == "__main__":
    """This is executed when run from the command line."""
    main()
