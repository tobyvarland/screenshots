#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

Loop
{
    FileRead, CurrentVersion, C:\Users\Public\ss_vers.txt
    UrlDownloadToFile, http://apps.varland.com/screenshots.txt, C:\Users\Public\ss_online_vers.txt
    FileRead, VersionInfo, C:\Users\Public\ss_online_vers.txt
    VersionPosition := RegExMatch(VersionInfo, "^\d+\.\d+\.\d+$", OnlineVersion)
    if (VersionPosition == 1 && CurrentVersion != OnlineVersion)
    {
        Process, Close, VarlandSS.exe
        Sleep, 3000
        FileDelete, C:\Users\Public\VarlandSS.exe
        Sleep, 3000
        UrlDownloadToFile, http://apps.varland.com/ahk/VarlandSS.exe, C:\Users\Public\VarlandSS.exe
        Sleep, 10000
        Run, C:\Users\Public\VarlandSS.exe
    }
    Sleep, 300000
}