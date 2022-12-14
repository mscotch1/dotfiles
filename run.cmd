@echo off
rmdir /S /Q %LOCALAPPDATA%\nvim
mklink /D %LOCALAPPDATA%\nvim %CD%\nvim
rmdir /S /Q %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
mklink /D %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState %CD%\windows-terminal
