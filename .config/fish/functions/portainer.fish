function portainer
    set -l portainer_created (docker ps -q -f name=portainer)
    if not test -d portainer_created
        set -l portainer_exited (docker ps -aq -f status=exited -f name=portainer)
        if test -d portainer_exited
            echo "Starting portainer"
            docker start portainer
        else
            echo "Portainer already running"
        end
    else
        echo "Creating portainer container"
        docker run --name=portainer -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
    end
end

