function fish_greeting

set COLS (tput cols)
set LINES (tput lines)
set SHOW_LARGE 0
set SHOW_SMALL 0

if [ $COLS -ge 80 ] ; and [ $LINES -ge 30 ]
        set SHOW_LARGE 1
else
	set SHOW_SMALL 1
end

if [ $SHOW_LARGE = 1 ]
# Source: https://manytools.org/hacker-tools/ascii-banner/ (DOS Rebel font)
echo ' █████   ███   █████       ████                                            '
echo '░░███   ░███  ░░███       ░░███                                            '
echo ' ░███   ░███   ░███ ██████ ░███   ██████   ██████  █████████████    ██████ '
echo ' ░███   ░███   ░██████░░███░███  ███░░███ ███░░███░░███░░███░░███  ███░░███'
echo ' ░░███  █████  ███░███████ ░███ ░███ ░░░ ░███ ░███ ░███ ░███ ░███ ░███████ '
echo '  ░░░█████░█████░ ░███░░░  ░███ ░███  ███░███ ░███ ░███ ░███ ░███ ░███░░░  '
echo '    ░░███ ░░███   ░░██████ █████░░██████ ░░██████  █████░███ █████░░██████ '
echo '     ░░░   ░░░     ░░░░░░ ░░░░░  ░░░░░░   ░░░░░░  ░░░░░ ░░░ ░░░░░  ░░░░░░  '
echo ''

set -l line_1
set -l line_2
set -l line_3
set -l line_4

echo -s " ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
echo -s " ░▓"
end

set line_1 (set_color cyan)(whoami)(set_color normal) at (set_color cyan)(hostname)(set_color normal) \r\n
set line_2 (set_color purple)(date "+%d-%m-%y")(set_color normal)\r\n
set line_3 (date "+%B %d")\r\n
set line_4 (set_color green)(date "+%A")(set_color normal)\r\n

echo -n -s " ░▓  $line_1"
echo -n -s " ░▓  $line_2"
echo -n -s " ░▓  $line_3"
echo -n -s " ░▓  $line_4"
echo -s ""

echo -ne "\e[2 q" # Sets the cursor to a non-blinking block.
end
