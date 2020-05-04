#! /bin/bash

makepkg -s -c -C --noconfirm --noprogressbar | tee ~/build.log
