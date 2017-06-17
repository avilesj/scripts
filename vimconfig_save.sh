#!/bin/bash
vimPath=$HOME/.vimrc
vimRepoPath=$HOME/Dev/Other/dotfiles/
vimftplugin=$HOME/.vim/ftplugin
vimPathogenPlugins=$HOME/.vim/
execrsync="rsync -av"
datetime="date  +%Y-%m-%d_%H:%M:%S%P"
if [ -f $vimPath ]; then
  echo "Found .vimrc at $vimPath"
else
  echo ".vimrc NOT FOUND"
  exit $?
fi

if [ -d $vimRepoPath ]; then
  echo "Found $vimRepoPath to be a valid path"
else
  echo "$vimRepoPath is not a valid path"
  exit $?
fi

echo "Copying .vimrc.."
$execrsync $vimPath $vimRepoPath
echo "Copying ftplugin folder.."
$execrsync $vimftplugin $vimRepoPath/.vim/
echo "Copying pathogen-installed plugins"
$execrsync $vimPathogenPlugins $vimRepoPath/.vim/ --exclude ftplugin
echo "Now uploading it to git!"
cd $vimRepoPath
git add .
git commit -m "Backup `$datetime`"
git push
