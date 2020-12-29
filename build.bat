cd D:\
mkdir .\Qt\build\5.6.3

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64
set _ROOT=D:\Qt\build\5.6.3
set PATH=%_ROOT%\qtrepotools\bin;%_ROOT%\qtbase\bin;%_ROOT%\gnuwin32\bin;%PATH%
set QMAKESPEC=win32-msvc2015
set _ROOT=

cd .\Qt\build\5.6.3
D:\Qt\src\5.6.3\configure.bat -release -nomake tests -nomake examples -qtnamespace QT -confirm-license -accessibility -opensource -platform win32-msvc2015 -opengl desktop -prefix .\
D:\jom\jom.exe -j%NUMBER_OF_PROCESSORS%
nmake install

cd D:\
mkdir artifacts

cd D:\GammaRay\
mkdir .\build
cd .\build
cmake -G "NMake Makefiles" "-DCMAKE_BUILD_TYPE=Release" "-DCMAKE_PREFIX_PATH=D:\Qt\build\5.6.3" "-DCMAKE_INSTALL_PREFIX=D:\artifacts" ..
nmake
nmake install
