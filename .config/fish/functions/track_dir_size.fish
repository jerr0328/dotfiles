function track_dir_size
    while true
        du -s | awk '{print $1}' | tee -a $argv[1]
        sleep 1
    end
end

