
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
    ,"AZDORestApiExplorer"
    ,"Compilers\Minsk"
    ,"Compilers\MinskOLD"
    ,"Compilers\Roslyn" 
    ,"CustomPoolAndSpa"
    ,"DevOps"
    ,"GitTraining"
    ,"GitTrainingContent"
    ,"JiraRESTApiExplorer"
    ,"JSONConsoleApp"
    ,"Power-Platform"
    ,"Prism-Problems-Solutions"
    ,"Python"
     ,"VNCCodeCommandConsole"
    ,"VNCCodeCommandConsoleLegacy"
    ,"VNCDevelopment"
    ,"VNCExplore"
    ,"VNCLogViewer"
    ,"VNCOffice"
    ,"VNCPhidgets"
    ,"VNCPowerShell"
    ,"VNCStandards"
    ,"VNCVisualStudio" 
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