FROM numeconcopenhagen/jupyterlab-docker:e35bd732fd8763fd08db26b54d5df9ba4d456257

# Make sure the contents of our repo are in ${HOME} 
COPY . ${HOME}

# Install conda deps
RUN if [ -e environment.yml ]; then \
      conda env update -f environment.yml; \
    fi
