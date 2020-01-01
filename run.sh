#!/usr/bin/zsh

for d in */ ; do
    if [ -d "$d/.git" ]; then
      cd "$d" && git push origin
      cd ..
    else
      cd "$d"
      for dd in */ ; do
          if [ -d "$dd/.git" ]; then
            cd "$dd"

            upSeconds="$(cat /proc/uptime | grep -o '^[0-9]\+')"
            upMins=$((${upSeconds} / 60))

            if [ "${upMins}" -lt "5" ]
            then
                git pull --dry-run > /dev/null 2>&1 | grep -q -v 'Already up-to-date.' && changed=1

                if [ "$changed" != 1 ] ; then
                    git pull origin
                else
                    notify-send "Repo: $d$dd" "Changes detect, you need to update it manualy."
                fi
            fi

            git push origin
            cd ..
          fi
      done
      cd ..
    fi
done
