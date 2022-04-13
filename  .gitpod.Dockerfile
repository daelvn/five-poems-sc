FROM gitpod/workspace-full

# Create dirs
RUN mkdir /home/gitpod/bin
RUN mkdir /home/gitpod/dl

# Change PATH
ENV PATH "$PATH:/home/gitpod/bin/"

# Install custom tools, runtime, etc.
RUN sudo apt update && sudo apt install -y

# Install butler
RUN curl -L -o /home/gitpod/dl/butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default \
    && unzip /home/gitpod/dl/butler.zip -d /home/gitpod/bin \
    && chmod +x /home/gitpod/bin/butler

# Install tweego
RUN curl -L -o /home/gitpod/dl/tweego.zip https://github.com/tmedwards/tweego/releases/download/v2.1.1/tweego-2.1.1-linux-x64.zip \
    && unzip /home/gitpod/dl/tweego.zip -d /home/gitpod/bin \
    && chmod +x /home/gitpod/bin/tweego

# Install latest SugarCube (2.36.1)
RUN curl -L -o /home/gitpod/dl/sugarcube.zip https://github.com/tmedwards/sugarcube-2/releases/download/v2.36.1/sugarcube-2.36.1-for-twine-2.1-local.zip \
    && unzip /home/gitpod/dl/sugarcube.zip -d /home/gitpod/dl \
    && cp -rf /home/gitpod/dl/sugarcube-2/* /home/gitpod/bin/storyformats/sugarcube-2

# Install Hererocks
RUN sudo pip install hererocks \
    && hererocks /home/gitpod/lua51 -l5.1 -rlatest