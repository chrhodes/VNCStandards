
function delimitmsg($msg)
{
    $delimitS = "********** "
    $delimitE = " **********"

    Write-Host -ForegroundColor Red $delimitS ("{0,-30}" -f $msg) $delimitE
}

#$RepoHome = "P:\git\chrhodes"
$RepoHome = "C:\vnc\git\chrhodes"

$repos = @(
    "Applications"
    ,"AZDORestApiExplorer"
    ,"CustomPoolAndSpa",
    ,"Explore"
    ,"EyeOnLife"
#    ,"GitTraining"
#    ,"GitTrainingContent"
    ,"Office"
    ,"SMARTS"
    ,"VisualStudio"
    ,"VNC"
    ,"VNC Tracking System"
    ,"VNCCodeCommandConsole"
    ,"VNCLogViewer"
    )

    cd $RepoHome

    foreach ($repo in $repos)
    {
        cd "$RepoHome\$repo"
        delimitmsg "$RepoHome\$repo - git pull --progress -v --no-rebase ""origin"" master"
        git.exe pull --progress -v --no-rebase "origin" master
        
        cd ..
    }
    
    Read-Host -Prompt "Press Enter to Exit"