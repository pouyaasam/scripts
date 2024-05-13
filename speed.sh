#!/bin/bash
# Function to check the OS distribution
get_os_distribution() {
  if [[ -f /etc/os-release ]]; then
    # For systems using /etc/os-release
    . /etc/os-release
    echo "$ID"
  elif [[ -f /etc/lsb-release ]]; then
    # For systems using /etc/lsb-release
    . /etc/lsb-release
    echo "$DISTRIB_ID"
  else
    # Fallback to uname
    uname -s
  fi
}

# Get the OS distribution
os_distro=$(get_os_distribution)

# Execute commands based on the OS distribution
case "$os_distro" in
  ubuntu|debian)
    curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
    sudo apt-get install speedtest -y
    speedtest --accept-gdpr
    ;;
  arch)
    echo "Installing on Debian..."
    sudo apt-get update
    sudo apt-get install -y <package_name>
    ;;
  centos|rhel|fedora)
    curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
    sudo yum -y install speedtest
    speedtest --accept-gdpr
    ;;
  *)
    echo "Unsupported OS distribution: $os_distro"
    exit 1
    ;;
esac
