if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" = "ubuntu" ]; then
                echo "Detected Ubuntu"
                curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
                sudo apt-get install speedtest -y
                speedtest --accept-gdpr
        fi
elif [ -f /etc/centos-release ]; then
        curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
        sudo yum -y install speedtest
        speedtest --accept-gdpr
else
        echo "Unsupported OS"
fi
