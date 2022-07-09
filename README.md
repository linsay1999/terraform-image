# terraform-image
docker build -t terraform .
docker run --rm -it --workdir "/home/$USER" -v "$PWD":"/home/$USER" terraform bash
