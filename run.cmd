@echo off
del %LOCALAPPDATA%\nvim
mklink /D %LOCALAPPDATA%\nvim %CD%\nvim
