#!/bin/sh
# Base16 Gruvbox - Shell color setup script
# Gordon Chiam (https://github.com/gchiam)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="28/28/28" # Base 00 - Black
color01="cc/24/1d" # Base 08 - Red
color02="98/97/1a" # Base 0B - Green
color03="d7/99/21" # Base 0A - Yellow
color04="45/85/88" # Base 0D - Blue
color05="b1/62/86" # Base 0E - Magenta
color06="68/9d/6a" # Base 0C - Cyan
color07="d5/c4/a1" # Base 05 - White
color08="eb/db/b2" # Base 03 - Bright Black
color09="fb/49/34" # Base 08 - Bright Red
color10="b8/bb/26" # Base 0B - Bright Green
color11="fa/bd/2f" # Base 0A - Bright Yellow
color12="83/a5/98" # Base 0D - Bright Blue
color13="d3/86/9b" # Base 0E - Bright Magenta
color14="8e/c0/7c" # Base 0C - Bright Cyan
color15="fb/f1/c7" # Base 07 - Bright White
color16="d5/c4/a1" # Base 09
color17="a8/99/84" # Base 0F
color18="50/49/45" # Base 01
color19="7c/6f/64" # Base 02
color20="bd/ae/93" # Base 04
color21="eb/db/b2" # Base 06
color22="32/30/2f" # Dark Soft
color23="1d/20/21" # Dark Hard
color24="3c/38/36" # Dark 1
color25="50/49/45" # Dark 2
color26="66/5c/54" # Dark 3
color27="7c/6f/64" # Dark 4
color28="92/83/74" # Gray
color29="f2/e5/bc" # Light Soft
color30="f9/f5/d7" # Light Hard
color31="fe/80/19" # Bright Orange
color32="af/3a/03" # Orange
color_foreground="eb/db/b2" # Base 05
#color_background="1d/20/21" # Base 00
color_cursor="d6/5d/0e" # Base 05

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

printf $printf_template 236 $color22
printf $printf_template 234 $color23

printf $printf_template 235 $color00
printf $printf_template 237 $color24
printf $printf_template 239 $color25
printf $printf_template 241 $color26
printf $printf_template 243 $color27

printf $printf_template 244 $color28
printf $printf_template 245 $color28

printf $printf_template 228 $color29
printf $printf_template 230 $color30

printf $printf_template 229 $color15
printf $printf_template 223 $color08
printf $printf_template 250 $color05
printf $printf_template 248 $color20
printf $printf_template 246 $color17

printf $printf_template 167 $color09
printf $printf_template 142 $color10
printf $printf_template 214 $color11
printf $printf_template 109 $color12
printf $printf_template 175 $color13
printf $printf_template 108 $color14
printf $printf_template 208 $color31

printf $printf_template 88 $color01
printf $printf_template 100 $color02
printf $printf_template 136 $color03
printf $printf_template 24 $color04
printf $printf_template 96 $color05
printf $printf_template 65 $color06
printf $printf_template 130 $color32

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg d5c4a1 # forground
  printf $printf_template_custom Ph 282828 # background
  printf $printf_template_custom Pi d5c4a1 # bold color
  printf $printf_template_custom Pj 7c6f54 # selection color
  printf $printf_template_custom Pk d5c4a1 # selected text color
  printf $printf_template_custom Pl d5c4a1 # cursor
  printf $printf_template_custom Pm 282828 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  #printf $printf_template_var 11 $color_background
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color22
unset color23
unset color24
unset color25
unset color26
unset color27
unset color28
unset color29
unset color30
unset color31
unset color32
unset color_foreground
#unset color_background
unset color_cursor
