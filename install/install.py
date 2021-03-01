#!/usr/bin/env python3
from commands import install_applications, link, git_ssh_setup, get_disks, set_data_directory, set_fish_shell, \
    set_locale_keyboard, get_config, cmd_literal, __cmd
from interaction import prompt, prompt_options, ok, exit_program, prompt_file_options


def main():
    __cmd("clear")
    print('\n')
    print('██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗██╗')
    print('██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝██║')
    print('██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ██║')
    print('██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ╚═╝')
    print('╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██╗')
    print('╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝')
    hostname = cmd_literal("whoami")
    print('Hello ' + hostname + ', this is my dotfiles repo.')
    print('All programs will now safely install on your system.')
    if not prompt('Continue?'):
        exit_program()

    # Choose config
    file_path = prompt_file_options("Which config would you like to use?", 'install/configs')
    config = get_config(file_path)

    # Initialize data disk(s)
    if not config["is_wsl"]:
        setup_data_partition_interactively()

    # Setup symlinks
    if prompt('Execute symlinks from ' + file_path +'?'):
        for source, target in config["symlinks"].items():
            link(source, target, hostname)

    # Install software using package manager
    if prompt('Install config-specified software using package manager?'):
        install_applications(
            config["applications"],
            package_manager=config["package_manager"],
            install_command=config["install_command"],
            install_args=config["install_args"]
        )

    if prompt('Setup Fish as default shell?'):
        set_fish_shell(hostname)

    if prompt('Generate SSH keys?'):
        git_ssh_setup(config["email"])

    # Setup key mapping
    if not config["is_wsl"]:
        print('Locale keyboard')
        if prompt('Modify locale keyboard to set dvorak? (login uses this)'):
            set_locale_keyboard()


def setup_data_partition_interactively():
    print('Data')
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


if __name__ == "__main__":
    """This is executed when run from the command line."""
    main()
