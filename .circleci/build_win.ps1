cd $PSScriptRoot\..
mkdir build
cd build
$boost_dir=(Resolve-Path $PSScriptRoot\..\deps\boost\lib\cmake\Boost-*)
..\deps\cmake\bin\cmake -G "Visual Studio 16 2019" -DBoost_DIR="$boost_dir\" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded -DCMAKE_INSTALL_PREFIX="$PSScriptRoot\..\upload" ..
msbuild solidity.sln /p:Configuration=Release /m:5 /v:minimal
#..\deps\cmake\bin\cmake --build . -j 6 --config Release
..\deps\cmake\bin\cmake --build . -j 6 --target install --config Release
