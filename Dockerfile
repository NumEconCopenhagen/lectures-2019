FROM numeconcopenhagen/jupyterlab-docker:89e98872713cc26d86b93f9a1c97208c188bb1a3
# The tag is the last commit tag in jupyterlab-docker

# Make sure the contents of our repo are in ${HOME} 
COPY . ${HOME}

# Install conda deps
RUN if [ -e environment.yml ]; then \
      conda env update -f environment.yml; \
    fi

# Run script if present
RUN if [ -e script.sh ]; then \
      bash script.sh; \
    fi
