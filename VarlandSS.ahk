#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

Version := "3.0.12"
Directory := "\\192.168.2.7\Screenshots\"
AlarmOnFile := "\\192.168.2.7\Screenshots\alarm_on.txt"
SubDirectory := A_ComputerName "\"
if (A_ComputerName = "PCA")
{
    SubDirectory := "FLEXTIME\"
}
DirectoryPath := Directory SubDirectory
VersionFile := DirectoryPath "version.txt"

Menu, Tray, Icon, C:\Users\Public\VarlandSS.ico
Menu, Tray, Tip, Screenshots v%Version%

FileDelete, C:\Users\Public\ss_vers.txt
FileAppend, %Version%, C:\Users\Public\ss_vers.txt
FileDelete, %VersionFile%
FileAppend, %Version%, %VersionFile%

Loop
{
    if (!FileExist(AlarmOnFile))
    {
        FormatTime, CurrentDate,, yyyy-MM-dd
        FormatTime, CurrentTime,, HH_mm_ss
        FullDirectoryPath := DirectoryPath CurrentDate "\"
        FileCreateDir, %FullDirectoryPath%
        FullPath := FullDirectoryPath CurrentTime ".jpg"
        Menu, Tray, Icon, C:\Users\Public\VarlandSS_Active.ico
        Run C:\Users\Public\nircmd.exe savescreenshotfull "%FullPath%"
        Sleep, 250
        Menu, Tray, Icon, C:\Users\Public\VarlandSS.ico
    }
    Sleep, 1550
}