# INERY.CDT (Contract Development Toolkit)
## Version : 1.7.0

## Guided Installation or Building from Scratch
```sh
git clone --recursive https://github.com/inery/inery.cdt
cd inery.cdt
mkdir build
cd build
cmake ..
make -j8
```

From here onward you can build your contracts code by simply exporting the `build` directory to your path, so you don't have to install globally (makes things cleaner).
Or you can install globally by running this command:

```sh
sudo make install
```

### Uninstall after manual installation

```sh
sudo rm -fr /usr/local/inery.cdt
sudo rm -fr /usr/local/lib/cmake/inery.cdt
sudo rm /usr/local/bin/inery-*
```

## Installed Tools

* inery-cpp
* inery-cc
* inery-ld
* inery-init
* inery-abidiff
* inery-wasm2wast
* inery-wast2wasm
* inery-ranlib
* inery-ar
* inery-objdump
* inery-readelf

inery-abidiff
inery-ranlib
inery-ar
inery-objdump
inery-readelf


