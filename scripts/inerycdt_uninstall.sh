#! /bin/bash

OPT_LOCATION=$HOME/opt

binaries=(
   inery-ranlib
   inery-ar
   inery-objdump
   inery-readelf
   inery-abigen
   inery-wasm2wast
   inery-wast2wasm
   inery-pp
   inery-cc
   inery-cpp
   inery-ld
   inery-abidiff
   inery-init
   llvm-readelf
   llvm-objdump
   llvm-ar
   llvm-ranlib
)

if [ -d "/usr/local/inery.cdt" ]; then
   printf "Do you wish to remove this install? (requires sudo)\n"
   select yn in "Yes" "No"; do
      case $yn in
         [Yy]* )
            if [ "$(id -u)" -ne 0 ]; then
               printf "\nThis requires sudo, please run ./uninstall.sh with sudo\n\n"
               exit -1
            fi
            pushd /usr/local &> /dev/null
            rm -rf inery.cdt
            pushd bin &> /dev/null
            for binary in ${binaries[@]}; do
               rm ${binary}
            done
            popd &> /dev/null
            pushd lib/cmake &> /dev/null
            rm -rf inery.cdt
            popd &> /dev/null
            break;;
         [Nn]* ) 
            printf "Aborting uninstall\n\n"
            exit -1;;
      esac
   done
fi

if [ -d "/usr/local/inery.wasmsdk" ]; then
   printf "Do you wish to remove this install? (requires sudo)\n"
   select yn in "Yes" "No"; do
      case $yn in
         [Yy]* )
            if [ "$(id -u)" -ne 0 ]; then
               printf "\nThis requires sudo, please run ./uninstall.sh with sudo\n\n"
               exit -1
            fi
            pushd /usr/local &> /dev/null
            rm -rf inery.wasmsdk
            pushd bin &> /dev/null
            for binary in ${binaries[@]}; do
               rm ${binary}
            done
            popd &> /dev/null
            break;;

         [Nn]* ) 
            printf "Aborting uninstall\n\n"
            exit -1;;
      esac
   done
fi

if [ -d $OPT_LOCATION/inery.cdt ] || [[ $1 == "force-new" ]]; then
   printf "Do you wish to remove this install?\n"
   select yn in "Yes" "No"; do
      case $yn in
         [Yy]* )
            pushd $HOME &> /dev/null
            pushd opt &> /dev/null
            rm -rf inery.cdt
            popd &> /dev/null
            pushd bin &> /dev/null
            for binary in ${binaries[@]}; do
               rm ${binary}
            done
            popd &> /dev/null
            pushd lib/cmake &> /dev/null
            rm -rf inery.cdt
            popd &> /dev/null
            break;;
         [Nn]* )
            printf "\tAborting uninstall\n\n"
            exit -1;;
      esac
   done
fi