# install tool chain

$Packages = 'googlechrome', 'git', 'notepadplusplus', 'vscode', 'docker'

ForEach ($PackageName in $Packages)
{
    choco install $PackageName -y
}