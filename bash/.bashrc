export PATH=$HOME/bin:$HOME/pear/bin:$PATH

#---------------------------------------------------------
# Big Mobile
#---------------------------------------------------------
export BMROOT=$HOME"/bm"
export OPS_PATH=$BMROOT"/process/ops"
export STORY_PATH=$BMROOT"/process/story"
export BIG=$BMROOT"/big"
export DEV=$HOME"/dev"

function opst {
    name=$1
    find $OPS_PATH/tasks -maxdepth 1 -name "*$name*" | head -n 1
}
function story {
    name=$1
    find $STORY_PATH -maxdepth 1 -name "*$name*" | head -n 1
}
function storyt {
    story=$1
    task=$2
    if [ -z "$story" ] || [ -z "$task" ]; then
        echo `story "$story"`
    else
        find $STORY_PATH -maxdepth 3 -wholename "*$story*/tasks/*$task*" | head -n 1
    fi
}

#oath
#PATH=$PATH:/home/danny/bin
#export PATH

#handy tools
alias sagi='sudo apt-get install'
alias cc='xclip -sel clip'
alias pp='xclip -sel clip -o'
alias n='notify-send "Script Completed"'
alias dp='php $HOME/bin/dp.php | while read line; do notify-send -t 8000000 "DPs Playlist" "$line"; done'


alias dom='dig @ns1.bmsrv.net axfr bmsrv.net'
alias vpn='sudo openvpn --config /home/danny/bm/bash/openvpn/client.ovpn --script-security 2'


#servers
alias web1='ssh custadmin@web1.psa.bmsrv.net'
alias web2='ssh custadmin@web2.psa.bmsrv.net'
alias webutil='ssh custadmin@webutil1.psa.bmsrv.net'
alias db1="ssh -t -L 3308:localhost:3306 custadmin@db1.psa.bmsrv.net"
alias db2="ssh -t -L 3308:localhost:3306 custadmin@db2.psa.bmsrv.net"
alias stagingdb="ssh -t -L 3309:localhost:3306 custadmin@staging.bmdev.net"

alias dp1='php /home/danny/bin/dp.php 1'


#directory shortcuts
alias ds="cd $DEV"
alias b="cd $BIG"
alias w='cd $BIG/web/wap'
alias l='cd $BIG/lib/php/Code'
alias p='cd $BIG/web/picture'
alias c='cd $BIG/web/customad'
alias doc='cd $BIG/doc/dev'
alias ops="cd $OPS_PATH"
alias h='thg log .'
alias db='cd $BIG/db'
alias s='cd $STORY_PATH'

#for local env, not needed now dev app is around..


alias fixwlan='sudo iw dev wlan0 set power_save off'
export PROCESS_PATH='/home/danny/bm/process'



PATH="$PATH:/home/danny/apps/flow/"
