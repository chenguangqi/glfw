#! /bin/bash

function callback() {
    :
}


case $2 in
    constant)
	cat <<EOF
(library (glfw constants)
  (export
$(sed -n -e '/^#define GLFW_/p' $1 | sed 's/^#define *\(GLFW_[^ ]*\).*/    \1/g')
  )
  (import (scheme))

  ;; start define
$(sed -n -e '/^#define GLFW_/p' $1 | sed 's/\/\*.*//g' | sed 's/0x/#x/g' | sed -e 's/^#\(.*\) *$/  (\1)/g')
)
EOF
	;;
    callback)
	cat <<EOF
$(sed -n -e '/GLFW.\+fun/p' $1 | sed -n -e '/^\(typedef\|GLFWAPI\)/p')
EOF
	;;
    set-callback)
	cat <<EOF
$(sed -n -e '/^typedef/p' $1 | sed -n -e '/GLFW.\+fun/p')
EOF
	;;
    
esac

