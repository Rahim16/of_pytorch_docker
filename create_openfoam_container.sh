username="$USER"
user="$(id -u)"
default_image="rahimn/of_pytorch:of2012-py1.8.1-gpu"
image="${1:-$default_image}"
default_container_name="of2012-py1.8.1-gpu"
container_name="${2:-$default_container_name}"

docker container run -it -d --name $container_name        \
  --user=${user}                                          \
  -e USER=${username}                                     \
  -v="$PWD/test":"/home/$username"                        \
  --workdir="/home/$username"                             \
  --volume="/etc/group:/etc/group:ro"                     \
  --volume="/etc/passwd:/etc/passwd:ro"                   \
  --volume="/etc/shadow:/etc/shadow:ro"                   \
  --volume="/etc/sudoers.d:/etc/sudoers.d:ro"             \
  --gpus all \
    $image
