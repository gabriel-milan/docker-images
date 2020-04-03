# Inherit from Debian stable image
FROM debian

# Copy bashrc file
COPY .bashrc /root/.bashrc

# Change user
USER root
SHELL ["/bin/bash", "-c"]

# Copy install script
COPY install.sh /usr/install.sh
RUN chmod 755 /usr/install.sh
RUN cd /usr && ./install.sh
