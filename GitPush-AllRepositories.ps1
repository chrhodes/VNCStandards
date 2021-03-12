
function delimitmsg($msg)
{
    $delimitS = "********** "
    $delimitE = " **********"

    Write-Host -ForegroundColor Red $delimitS ("{0,-30}" -f $msg) $delimitE
}

if ($Env:COMPUTERNAME -eq "VNCDEV2020" -or $Env:COMPUTERNAME -eq "INFINITYRHODES")
{
    $RepoHome = "P:\git\chrhodes"
}
else
{
    $RepoHome = "C:\vnc\git\chrhodes"
}

$repos = @(
    "Applications"
    ,"AZDORestApiExplorer"
    ,"CustomPoolAndSpa"
    ,"Explore"
    ,"EyeOnLife"
    ,"GitTraining"
    ,"GitTrainingContent"
    ,JediOrder"
    ,"LegacyVNCCodeCommandConsole"
    ,"Office"
    ,"OfficeLegacy"
    ,"SMARTS"
    ,"Utilities"
    ,"VisualStudio"
    ,"VNC"
    ,"VNC-Tracking-System"
    ,"VNCCodeCommandConsole"
    ,"VNCLogViewer"
    )

    cd $RepoHome

    foreach ($repo in $repos)
    {
        cd "$RepoHome\$repo"
        delimitmsg "$RepoHome\$repo - git.exe push --progress ""origin"" master:master"
        git.exe push --progress "origin" master:master
        
        cd ..
    }
    
    Read-Host -Prompt "Press Enter to Exit"