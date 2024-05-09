@echo off
echo Please choose from the following options:
echo [1] Premake
echo [2] CMake
set /p choice=Please enter your choice (1 or 2):
if "%choice%"=="1" (
    echo You chose 1, Premake related code will be executed...
    pushd %~dp0\..\
    call vendor-ex\premake\bin\premake5.exe vs2022
    popd
    PAUSE
) else if "%choice%"=="2" (
    echo You chose 2, CMake related code will be executed...
    cd %~dp0\..\
    mkdir build
    cd build
    cmake ..
    :: cmake --build . --config Debug
    PAUSE
) else (
    echo Invalid input! Please rerun the script and enter 1 or 2.
    PAUSE
)
