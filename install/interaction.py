from time import sleep
import sys
from os import walk
import os


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    GREY = '\033[2m'
    ITALIC = '\033[3m'
    WHITE_BACKGROUND = '\033[7m'
    BLACK_BACKGROUND = '\033[8m'
    EXP = '\033[12m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def prompt(text):
    answer = input(question(text + ' (press Enter to continue / y/n)') + ': ')
    reply = str(answer).lower().strip()
    if not reply:
        return True
    if reply[0] == 'y':
        return True
    if reply[0] == 'n':
        return False
    if reply[0] == 'e':
        exit_program()
    else:
        return prompt("Invalid answer.")


def prompt_options(text, options):
    options_string = '/'.join([str(i) for i in options])
    reply = input(question(text + ' (' + options_string + ')') + ': ')

    if not reply:
        pass
    elif type(options[0]) is int:
        if not reply.isdigit():
            pass
        if int(reply) in options:
            return int(reply)
    elif type(options[0]) is str:
        if reply in options:
            return reply

    return prompt_options("Invalid answer '{}'.".format(reply), options)


def prompt_file_options(text, file_path):
    file_names = []
    for (dir_path, dir_names, file_names) in walk(file_path):
        file_names.extend(file_names)

    if len(file_names) > 1:
        for idx, d in enumerate(file_names):
            print(idx, d)
    elif len(file_names) == 1:
        return file_names[0]
    else:
        print('Found no file options for path ' + file_path + ', exiting program.')
        exit_program()

    chosen = prompt_options(text, range(len(file_names)))

    return os.path.join(file_path, file_names[chosen])


def question(message):
    return "\n{color_start}{symbol} : {message}{color_end} \n{newline_symbol} ".format(
        symbol=u'\U0001F984', message=message, color_start=bcolors.OKBLUE, color_end=bcolors.ENDC,
        newline_symbol=u'\u2937'
    )


def invert(text):
    return bcolors.WHITE_BACKGROUND + text + bcolors.ENDC


def header(text):
    print("\n\n{color_start}{message}{color_end}".format(color_start=bcolors.BOLD,
                                                         color_end=bcolors.ENDC, message=f.renderText(text), ),
          # delay=0)
          delay=0.001)


def description(message, symbol=True):
    if symbol:
        print("{symbol} : {message}".format(symbol=u'\u2192', message=message, ))
    else:
        print("{color_start}{message}{color_end}".format(message=message, color_start=bcolors.BOLD,
                                                         color_end=bcolors.ENDC, ))


def info(message):
    print("{color_start}{symbol} : {message}{color_end}".format(
        symbol=u'\u2192', message=message, color_start=bcolors.BOLD, color_end=bcolors.ENDC,
    ))


def ok(message):
    print(invert("{color_start}{symbol} : {message}{color_end}".format(
        symbol=u'\u2713', message=message, color_start=bcolors.OKGREEN, color_end=bcolors.ENDC,
    )))


def warn(message):
    print(invert("{color_start}{symbol} : {message}{color_end}".format(
        symbol=u'\u26A0', message=message, color_start=bcolors.WARNING, color_end=bcolors.ENDC,
    )))


def fail(message):
    print(invert("{color_start}{symbol} : {message}{color_end}".format(
        symbol=u'\u2717', message=message, color_start=bcolors.FAIL, color_end=bcolors.ENDC,
    )))
    exit_program()


def exit_program():
    info("Exiting program...")
    raise SystemExit
