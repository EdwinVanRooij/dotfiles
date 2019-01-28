import os
from lib import backgrounds_directory, queue_directory, history_directory


def main():
    create_backgrounds_structure()


def create_backgrounds_structure():
    if not os.path.exists(backgrounds_directory):
        os.makedirs(backgrounds_directory)

    if not os.path.exists(queue_directory):
        os.makedirs(queue_directory)

    if not os.path.exists(history_directory):
        os.makedirs(history_directory)


if __name__ == "__main__":
    main()
