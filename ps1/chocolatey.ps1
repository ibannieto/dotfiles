# install tool chain

$Packages = '7zip', 'android-sdk', 'androidstudio', 'awscli', 'chefdk', 'conemu', 'coretemp', 'cpu-z', 'cue', 'curl', 'dart-sdk', 'dep', 'docker-compose', 'docker-desktop', 'flutter', 'git', 'git-credential-manager-for-windows', 'github-desktop', 'golang', 'gpu-z', 'graphviz', 'hugo', 'inspec', 'jq', 'keepass', 'keepass-plugin-keeagent', 'keepass-plugin-keeanywhere', 'kubernetes-cli', 'kubernetes-helm', 'love', 'make', 'minikube', 'neovim', 'nodejs', 'protoc', 'qbittorrent', 'skaffold', 'slack', 'terraform', 'terragrunt', 'tflint', 'tiled', 'vlc', 'vlc-skins', 'vscode', 'vscode-docker', 'vscode-gitignore', 'vscode-icons', 'vscode-markdownlint', 'vscode-settingssync', 'vscode-yaml', 'yarn', 'zip'

ForEach ($PackageName in $Packages)
{
    choco install $PackageName -y

}
