function wait
    while true
        set -l has_jobs
        set -l all_jobs (get_jobs)
        or break

        for j in $argv
            if contains -- $j $all_jobs
                set -e has_jobs
                break
            end
        end

        if set -q has_jobs
            break
        end
    end
end

set -l urls "https://"{google,twitter,youtube,facebook,github}".com"

for url in $urls
    fish -c "curl -Lw \"$url: %{time_total}s\n\" -o /dev/null -s $url" &
end

wait (get_jobs)
