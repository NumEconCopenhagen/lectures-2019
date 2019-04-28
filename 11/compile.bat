cd "C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Auxiliary/Build/"
call vcvarsall.bat x64
cd "C:\Users\gmf123\Dropbox\NumEconCopenhagen\lectures-2019\11"
cl /LD /EHsc /Ox /openmp example.cpp
