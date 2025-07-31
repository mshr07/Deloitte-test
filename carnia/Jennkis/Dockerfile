FROM jenkins/jenkins:lts

USER root

# Install Docker
RUN apt update && apt install -y docker.io

# Add Jenkins user to the existing Docker group
RUN usermod -aG docker jenkins

# Ensure Jenkins has access to Docker
RUN chown jenkins:docker /var/run/docker.sock || true

# Install jq
RUN apt-get update && apt-get install -y jq

# Install dependencies and Google Chrome
RUN apt-get update && \
apt-get install -y wget gnupg && \
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
apt-get update && \
apt-get install -y google-chrome-stable || (echo "Google Chrome installation failed" && exit 1) && \
echo "Google Chrome installed successfully" && \
find / -name "google-chrome" 2>/dev/null && \
which google-chrome && google-chrome --version \
    rm -rf /var/lib/apt/lists/*

# Verify Google Chrome installation
RUN which google-chrome && google-chrome --version

# Verify Google Chrome installation and print its path
RUN echo "Google Chrome path:" && which google-chrome && google-chrome --version

# Set the CHROME_BIN environment variable
ENV CHROME_BIN=/usr/bin/google-chrome

USER jenkins

