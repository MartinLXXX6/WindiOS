# Overview
A custom shell for windows. Aims to reduce distractions, and improve overall system performance. Especially useful in low-end PCs.

IMPORTANT: By adding WindiOS as shell you are replacing the Windows Taskbar, Start Menu, Desktop and so on. Make sure you know what you are doing.

# Intended use
Set WindiOS as shell so it opens at startup replacing the native windows shell (explorer.exe). Once it starts never close the window. Programs can be pinned in the Programs Menu withing WindiOS. Switch between opened windows with ALT + TAB. Access network settings and change the keyboard language with the CTRL + ALT + DEL menu. Everything else should be managed from within WindiOS.

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

# Thanks
Thanks for trying it out! if you found issues or missing features dont hesitate to contact me via the issues tab or the pull requests tab here on github.
