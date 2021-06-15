default_container_name="of2012-py1.8.1-gpu-cuda102"
container_name="${1:-$default_container_name}"
docker start $container_name
docker exec -it $container_name /bin/bash
