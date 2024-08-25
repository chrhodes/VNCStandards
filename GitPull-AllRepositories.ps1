
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
        delimitmsg "git pull --progress -v --no-rebase ""origin"" master - $RepoHome\$repo"
        Write-Host
        git.exe pull --progress -v --no-rebase "origin" master
        Write-Host
    }
    
    $RepoHome
    
    Read-Host -Prompt "Press Enter to Exit"