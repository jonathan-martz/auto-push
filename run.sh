#!/usr/bin/zsh

for d in */ ; do
    if [ -d "$d/.git" ]; then
      echo "$d git folder"
      cd "$d" && git push origin
      cd ..
    else
      echo "$d"
      for dd in */ ; do
          if [ -d "$dd/.git" ]; then
            cd "$dd" && git push origin
            cd ..
          fi
      done
    fi
done
