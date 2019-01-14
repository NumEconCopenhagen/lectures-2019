FROM numeconcopenhagen/jupyterlab-docker:f4dff96de62b01d3768e280bf609cfa25c8584c3
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
