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

              git pull --dry-run > /dev/null 2>&1 | grep -q -v 'Already up-to-date.' && changed=1

              if [ "$changed" != 1 ] ; then
                  git pull origin
              fi

            git push origin
            cd ..
          fi
      done
      cd ..
    fi
done
