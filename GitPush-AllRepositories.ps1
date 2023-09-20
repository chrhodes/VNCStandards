
function delimitmsg($msg)
{
    # $delimitS = "**********> "
    # $delimitE = " <**********"
    $delimitS = ""
    $delimitE = ""

    Write-Host -ForegroundColor Red $delimitS ("{0,-30}" -f $msg) $delimitE
}

$RepoHome = (get-item $PSScriptRoot).parent.fullname

# if ($Env:COMPUTERNAME -eq "VNCDEV2020" -or $Env:COMPUTERNAME -eq "INFINITYRHODES")
# {
    # $RepoHome = "P:\git\chrhodes"
# }
# else
# {
    # $RepoHome = "C:\vnc\git\chrhodes"
# }
# #
# $RepoHome 

$repos = @(
    "Applications"
    ,"AZDORestApiExplorer"
    ,"Compilers\Minsk"
    ,"Compilers\Roslyn" 
    ,"CustomPoolAndSpa"
    ,"DevOps"
    ,"Explore"
    ,"EyeOnLife"
    ,"GitTraining"
    ,"GitTrainingContent"
    ,"JediOrder"
    ,"JSONConsoleApp"
    ,"MSPowerShell"
    ,"Office"
    ,"OfficeLegacy"
    ,"Phidgets"
    ,"Power-Platform"
    ,"SMARTS"
    ,"VisualStudio"
    ,"VNC"
    ,"VNCCodeCommandConsole"
    ,"VNCCodeCommandConsoleLegacy"
    ,"VNCLogViewer"
    ,"VNCStandards"
    ,"VNC-Tracking-System" 
    )

    cd $RepoHome

    foreach ($repo in $repos)
    {
        cd "$RepoHome\$repo"
        delimitmsg "$git.exe push --progress ""origin"" master:master - $RepoHome\$repo"
        Write-Host
        git.exe push --progress "origin" master:master
        Write-Host
    }
    
    cd $PSScriptRoot   

    Read-Host -Prompt "Press Enter to Exit"