#!/usr/bin/zsh

for d in */ ; do
    if [ -d "$d/.git" ]; then
      echo "$d git folder"
      cd "$d" && git push origin
      cd ..
    else
      #echo "$d"
    fi
done
