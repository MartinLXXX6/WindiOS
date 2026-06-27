# Overview
A custom shell for windows. Aims to reduce distractions, and improve overall system performance. Especially useful in low-end PCs.
<img width="1920" height="581" alt="Image" src="https://github.com/user-attachments/assets/5cad6021-741c-4be8-9277-04cfb23b1372" />

TIP: Use CTRL + MOUSE WHEEL UP/DOWN to zoom in/out the window.

WARINING: By adding WindiOS as shell you are replacing the Windows Taskbar, Start Menu, Desktop and so on. Make sure you know what you are doing.

# Intended use
Set WindiOS as shell so it opens at startup replacing the native windows shell (explorer.exe). Once it starts never close the window. Programs can be pinned in the Programs Menu within WindiOS. Switch between opened windows with ALT + TAB. Access network settings and change the keyboard language with the CTRL + ALT + DEL menu. Everything else should be managed from within WindiOS.

# Why use WindiOS as shell?
- Saves a lot of RAM as explorer.exe is not running.
- Faster startup and shutdown times as explorer.exe is not running.

# How to add as shell
Simply run the batch file located in the WindiOS folder named "Add_as_Shell.bat".

IMPORTANT: Once added WindiOS as shell you should not move the WindiOS folder or delete anything inside of it.

# How to remove as shell
Simply run the batch file located in the WindiOS folder named "Remove_as_Shell.bat".

# Possible issues
If WindiOS is not running and you do not have explorer as shell you need to press CTRL + SHIFT + ESC to open Task Manager. Once there you might want to open back WindiOS. To achieve this, the simplest way is to open explorer temporarily. Firstly locate & press the "Run new Task" Button on Windows 11's Task Manager and type "explorer" or go to "File" > "Run new Task" for Windows 10's Task Manager and type "explorer".

# More about this app
This app is divided into four different batch files and one INI file.

- WindiOS.bat: The actual app.
- Run_WindiOS.bat: A one-line batch file that runs the main app in fullscreen mode.
- Add_as_Shell.bat: A simple batch file to quickly add WindiOS as the startup shell.
- Remove_as_Shell.bat: A simple batch file to quickly remove WindiOS as the startup shell.
- PinnedPrograms.ini: A file to persist pinned programs by the user so they are loaded to the main app once the main app is closed and reopened.

# Thanks
Thanks for trying it out! if you found issues or missing features dont hesitate to contact me via the issues tab or the pull requests tab here on github.
