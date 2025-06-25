#!/bin/bash

# List of services to monitor
containers=("service1" "service2")

# Alert function (customize as needed)
send_alert() {
  local container=$1
  local status=$2

  {
    echo "Subject: $status alert"
    echo "To: your@mail.com"
    echo "From: your@mail.com"
  }
  

  echo "[ALERT] $container is $status at $(date)" >> docker_health_alerts.log  | msmtp "your@mail.com"
  # You can replace this with a webhook call, email, etc.
}


# Loop through containers and check health
for container in "${containers[@]}"; do
  status=$(docker inspect --format='{{.State.Health.Status}}' "$container" 2>/dev/null)

  if [[ "$status" == "unhealthy" ]]; then
    send_alert "$container" "$status"
  elif [[ "$status" == "starting" ]]; then
    echo "[INFO] $container is still starting..." >> docker_health_alerts.log
  else
    echo "[OK] $container is healthy at $(date)" >> docker_health_alerts.log
  fi
done
