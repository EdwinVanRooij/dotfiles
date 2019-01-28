import os

from lib import backgrounds_directory, history_directory, queue_directory, parse_txt_to_info


def main():
    # Move old backgrounds to history
    old_backgrounds = get_filenames(backgrounds_directory)
    old_backgrounds_info = get_filenames(backgrounds_directory, txt=True)
    # move_to_old(old_backgrounds)
    # move_info_to_old(old_backgrounds_info)
    move_backgrounds_to_old(old_backgrounds_info)

    # Move 31 backgrounds to current directory
    new_backgrounds = get_filenames(queue_directory)
    new_backgrounds_info = get_filenames(queue_directory, txt=True)
    move_to_current(new_backgrounds)
    move_to_current(new_backgrounds_info)


def move_to_current(filenames):
    for i, fn in enumerate(filenames, start=1):
        if i > 31:
            break

        extension = os.path.splitext(fn)[1]
        old = "{}/{}".format(queue_directory, fn)
        new = "{}/{}{}".format(backgrounds_directory, i, extension)
        os.rename(old, new)


def move_backgrounds_to_old(filenames):
    """
    Moves the whole background to history directory.
    :param filenames: background info filepath
    """
    for fn in filenames:
        background_info = parse_txt_to_info(backgrounds_directory + "/" + fn)

        # Move the info file
        old = backgrounds_directory + "/" + fn
        new = history_directory + "/" + background_info.id + ".txt"
        os.rename(old, new)

        # Move the image file
        old = backgrounds_directory + "/" + fn
        old = os.path.splitext(old)[0] + ".jpg"
        new = history_directory + "/" + background_info.id + ".jpg"
        os.rename(old, new)


def move_info_to_old(filenames):
    for fn in filenames:
        background_info = parse_txt_to_info(backgrounds_directory + "/" + fn)

        old = backgrounds_directory + "/" + fn
        new = history_directory + "/" + background_info.id + ".txt"
        os.rename(old, new)


def move_to_old(filenames):
    for fn in filenames:
        old = backgrounds_directory + "/" + fn
        new = history_directory + "/" + fn
        os.rename(old, new)


def get_filenames(dir, txt=False):
    results = []

    for fn in os.listdir(dir):
        full_filename = dir + '/' + fn
        if os.path.isfile(full_filename):

            if txt:
                if fn.endswith('.txt'):
                    results.append(fn)
            else:
                if not fn.endswith('.txt'):
                    results.append(fn)

    return results


if __name__ == "__main__":
    main()
