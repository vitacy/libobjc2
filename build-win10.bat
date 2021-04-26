

set CC=clang.exe   
set CXX=clang++.exe  
set RUNTIME_VERSION=gnustep-2.0 

set Install_prefix=%cd%\build\install
MD %Install_prefix%
cmake -B build .  -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=%CC% -DCMAKE_CXX_COMPILER=%CXX% -DCMAKE_MODULE_LINKER_FLAGS=%LDFLAGS% -DTESTS=0 -G Ninja  -DCMAKE_INSTALL_PREFIX=%Install_prefix% 
ninja -C build
ninja -C build install
