@echo on
@setlocal EnableDelayedExpansion

cmake -S . -B build -G Ninja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_VERBOSE_MAKEFILE=ON ^
    -Wno-dev ^
    -DBUILD_TESTING=OFF ^
    %CMAKE_ARGS% || goto :error

cmake --build build --config Release -j%CPU_COUNT% || goto :error
cmake --install build --config Release || goto :error

goto :eof

:error
echo Failed with error #%errorlevel%.
exit 1
