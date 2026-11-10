#!/bin/bash

#!/bin/bash

check_and_run() {
    local cmd="$1"
    local status

    # Check if command exists
    #if ! command -v "$cmd" >/dev/null 2>&1; then
    #    echo "ERROR: Command '$cmd' not found"
    #    return 127
    #fi

    # Run the command and capture status
    bash -c "$cmd"
    status=$?

    if [ $status -eq 0 ]; then
        echo "'$cmd' succeeded"
    else
        echo "'$cmd' failed with code $status"
    fi

    return $status
}

branch=$(git rev-parse --abbrev-ref HEAD)
for remote in $(git remote) ; do
  check_and_run "git push $remote $branch"
done
