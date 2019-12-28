#!/usr/bin/zsh

for d in */ ; do
    if [ -d "$d/.git" ]; then
      echo "$d git folder"
      cd "$d" && git push origin
      cd ..
    else
      cd "$d"
      for dd in */ ; do
          if [ -d "$dd/.git" ]; then
            echo "$dd"
            cd "$dd" && git push origin
            cd ..
          fi
      done
      cd ..
    fi
done
