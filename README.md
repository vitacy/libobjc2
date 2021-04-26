GNUstep Objective-C Runtime
===========================

Build on win10 with clang

install visual studio 2019 with c++ clang cmake support via visual studio installer

open a cmd shell "x64 Native Tools Command Prompt for VS 2019" from start menu

cd to the source code dir

run build-win10.bat
it will install to build/install dir
```bash
set CC=clang.exe
set CXX=clang++.exe
set RUNTIME_VERSION=gnustep-2.0

set Install_prefix=%cd%\build\install
MD %Install_prefix%
cmake -B build .  -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=%CC% -DCMAKE_CXX_COMPILER=%CXX% -DCMAKE_MODULE_LINKER_FLAGS=%LDFLAGS% -DTESTS=0 -G Ninja  -DCMAKE_INSTALL_PREFIX=%Install_prefix%
ninja -C build
ninja -C build install
```


test objc using clang

```bash
clang test.m -o test.exe -fblocks -fobjc-runtime=gnustep-2.0 -fuse-ld=lld-link -l objc
```

```objc
//test.m
//OBJCFLAGS=-fblocks -fobjc-runtime=gnustep-2.0 -fuse-ld=lld-link -l objc
#include <stdio.h>
__attribute__((objc_root_class)) @interface Test
  + (void) test;
@end
@implementation Test
  + (void) test {
    printf("Hello World!\n");
  }
@end
int main() {
  [Test test];
  return 0;
}
```
