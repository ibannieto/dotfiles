# install tool chain

$Packages = '7zip', 'awscli', 'conemu', 'coretemp', 'cpu-z', 'cue', 'curl', 'dep', 'docker-compose', 'docker-desktop', 'faas-cli', 'git', 'git-credential-manager-for-windows', 'github-desktop', 'golang', 'gpu-z', 'graphviz', 'greenshot', 'habitat', 'inspec', 'keepass', 'keepass-plugin-keeagent', 'keepass-plugin-keeanywhere', 'kubernetes-cli', 'kubernetes-helm', 'make', 'neovim', 'nodejs', 'qbittorrent', 'skaffold', 'slack', 'terraform', 'terragrunt', 'tflint', 'tiled', 'vlc', 'vlc-skins', 'vscode', 'vscode-docker', 'vscode-gitignore', 'vscode-icons', 'vscode-markdownlint', 'vscode-settingssync', 'vscode-yaml', 'zip', 'hugo'

ForEach ($PackageName in $Packages)
{
    choco install $PackageName -y

}
