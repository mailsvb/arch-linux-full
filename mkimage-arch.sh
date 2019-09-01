#!/bin/zsh
echo "Creating initial Docker image"
docker build --force-rm=true -t mailsvb/archlinuxfullbuild -f DockerBuildFile .
docker run -it -d --name container_full_build mailsvb/archlinuxfullbuild
docker export container_full_build | docker import - mailsvb/archlinuxfull
docker stop container_full_build
docker rm container_full_build
echo "Saving Docker image to tar file"
docker save mailsvb/archlinuxfull:latest > ./arch-linux-full-latest.tar
echo "Deleting Docker images locally"
docker rmi mailsvb/archlinuxfullbuild:latest
docker rmi mailsvb/archlinuxfull:latest
if [ -f "arch-linux-full-latest.tar.xz" ] ; then
  echo "Deleting old tar.xz file"
  rm arch-linux-full-latest.tar.xz
  git rm -f arch-linux-full-latest.tar.xz
fi

echo "Compressing tar file"
xz -z arch-linux-full-latest.tar

echo "Uploading to github"
chmod -v 644 arch-linux-full-latest.tar.xz
git add arch-linux-full-latest.tar.xz
git checkout --orphan new-master master
git commit -m "Auto Update"
git branch -M new-master master
git push -f origin master
