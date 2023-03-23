#!/bin/bash
# TODO: fix static addressing by having arrays of commands



start-on-workspace() {
    # get the target ns
    target=$(($1))
    shift

    # get the current ns
    current=$(wmctrl -d | grep '*' | cut -d' ' -f1)
    if [ $current != target ]; then
        # switch to target ns
        wmctrl -s $target
    fi

    # get a checksum of currently running windows
    a=$(wmctrl -l | cut -d' ' -f1 | sha1sum | cut -d' ' -f1)
    b=$a

    # start the app
    $@ &

    # wait until there is a change on the window list
    while [ $a = "$b" ]; do
        a=$(wmctrl -l | cut -d' ' -f1 | sha1sum | cut -d' ' -f1)
        sleep 0.1
    done

    # switch back to the origin namespace if needed
    if [ $current != target ]; then
        wmctrl -s $current
    fi
    sleep 0.1



}

close-all(){
    # close all open windows gracefully without closing the Desktop environment
    WIN_IDs=$(wmctrl -l | grep -vwE "Desktop$|xfce4-panel$" | cut -f1 -d' ')
    for i in $WIN_IDs; do wmctrl -ic "$i"; done
    # Keep checking and waiting until all windows are closed (you probably don't need this section)
    while test $WIN_IDs; do 
        sleep 0.1; 
        WIN_IDs=$(wmctrl -l | grep -vwE "Desktop$|xfce4-panel$" | cut -f1 -d' ')
    done 
    sleep 0.1

}

close-all 

wmctrl -s 0

start-on-workspace 0 "gnome-terminal -- mpv /home/chilldude/Videos/study/brownnoise.m4a"

start-on-workspace 1 "nautilus /home/$(whoami)/Documents/iztech/IZTECH6/"

start-on-workspace 2 "firefox --new-window https://www.notion.so/chilldude/University-ad664e8db2f04b3db10b1fcc9360096a"

start-on-workspace 1 "firefox --new-window https://teams.microsoft.com"

start-on-workspace 0 "vlc -f /home/chilldude/Videos/study/3x50.mp4 "

wmctrl -s 1

exit

