# install tool chain

$Packages = '7zip', 'android-sdk', 'androidstudio', 'ConEmu', 'coretemp', 'cpu-z', 'cue', 'curl', 'dart-sdk', 'dep', 'docker-compose', 'docker-desktop', 'ffmpeg', 'flutter', 'fluxctl', 'gimp', 'git', 'git-credential-manager-for-windows', 'github-desktop', 'golang', 'gpu-z', 'graphviz', 'greenshot', 'habitat', 'hub', 'hugo', 'hxd', 'inspec', 'jdk8', 'keepass', 'keepass-plugin-keeagent', 'keepass-plugin-keeanywhere', 'kubernetes-cli', 'kubernetes-helm', 'love', 'make', 'minikube', 'mobaxterm', 'neovim', 'netcat', 'nodejs', 'protoc', 'qbittorrent', 'screentogif', 'skaffold', 'slack', 'terraform', 'Terragrunt', 'tflint', 'tiled', 'upx', 'vault', 'vlc', 'vlc-skins', 'vscode', 'vscode-docker', 'vscode-gitignore', 'vscode-icons', 'vscode-markdownlint', 'vscode-settingssync', 'vscode-yaml', 'yarn', 'zip'

ForEach ($PackageName in $Packages)
{
    choco install $PackageName -y

}
