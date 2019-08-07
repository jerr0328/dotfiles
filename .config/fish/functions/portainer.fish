function portainer
    if test (docker ps -aq -f name=portainer)
        if test (docker ps -aq -f status=exited -f name=portainer)
            echo "Starting portainer"
            docker start portainer
        else
            echo "Portainer already running"
        end
    else
        echo "Creating portainer container"
        docker run --name=portainer -d -p 9000:9000 -v $HOME/.portainer:/data -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
    end
end

