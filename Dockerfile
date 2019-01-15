FROM numeconcopenhagen/jupyterlab-docker:605469bcf8fcb84bd42e044e1a91e6b475a03f17
# The tag is the last commit tag in jupyterlab-docker

# Make sure the contents of our repo are in ${HOME} 
COPY . ${HOME}

USER root

RUN fix-permissions ${HOME}

# Install conda deps
RUN if [ -e environment.yml ]; then \
      conda env update -f environment.yml; \
    fi

# Run script if present
RUN if [ -e script.sh ]; then \
      bash script.sh; \
    fi
