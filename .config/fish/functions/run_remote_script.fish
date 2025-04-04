function run_remote_script
    if test count $argv -ne 2
        echo "Usage: run_remote_script <local_script> <remote_host>"
        return 1
    end

    set local_script $argv[1]
    set remote_host $argv[2]

    if not test -e $local_script
        echo "Local script does not exist: $local_script"
        return 1
    end

    # Use cat to send the script content over SSH and execute it on the remote host
    ssh $remote_host 'bash -s' < $local_script
end
