# output colors
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
light_blue='\e[0;36m'
gray='\e[0;37m'
end_color='\e[0m'
colors=($red $green $yellow $blue $purple $light_blue $gray)

# Set some variables
the_date=`date`
date_length=`echo ${#the_date}`
if [[ "$COLUMNS" -eq "" ]]; then COLUMNS=90; fi
left_count=0
right_count=`expr "$COLUMNS" - "$date_length" - "$left_count" - 2`

# Override clear
clear () {
  go_up () {
    left_side=${1}"<"
    right_side=${2#">"}
  }

  go_down () {
    left_side=${1#"<"}
    right_side=${2}">"
  }

  left_to_right () {
    count=0
    while [[ $count -lt $right_count ]];do
      count=$((count + 1))
      go_up $left_side $right_side
      for color in ${colors[@]}; do
        printf "${color}${left_side}`date`${right_side}${end_color}\n"
      done
    done
  }

  right_to_left () {
    count=0
    while [[ $count -lt $right_count ]];do
      count=$((count + 1))
      go_down $left_side $right_side
      for color in ${colors[@]}; do
        printf "${color}${left_side}`date`${right_side}${end_color}\n"
      done
    done
    right_count=`expr "$COLUMNS" - "$date_length" - "$left_count" - 2`
  }

  for i in $(eval echo "{0..$right_count}"); do
    right_side=${right_side}">"
  done

  for i in $(eval echo "{0..$left_count}"); do
    left_side=${left_side}"<"
  done

  left_to_right
  right_to_left
  left_side=""
  right_side=""
}
