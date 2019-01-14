FROM numeconcopenhagen/jupyterlab-docker:f1a3abd475ba08339c56b878fc443796a834df13

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
