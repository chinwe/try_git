#!/bin/bash

#在当前文件夹下执行ctags
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
