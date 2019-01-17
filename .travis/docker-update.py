import re
import requests

REGEX = "(?<=FROM numeconcopenhagen/jupyterlab-docker:)([0-9a-f]{5,40})"

def get_dockerfile_sha():
    with open("Dockerfile", "r") as f:
        return re.search(REGEX, f.read()).group()

def get_latest_jupyterlabdockerfile_sha():
    r = requests.get("https://api.github.com/repos/numeconcopenhagen/jupyterlab-docker/commits")
    return r.json()[0]['sha']

if __name__ == "__main__":
    jupyterlab_sha = get_latest_jupyterlabdockerfile_sha()
    docker_sha = get_dockerfile_sha()
    if jupyterlab_sha != docker_sha:
        with open('Dockerfile', 'r') as f1:
            content = f1.read()
        with open('Dockerfile', 'w') as f2:
            f2.write(content.replace(docker_sha, jupyterlab_sha))
        print(f"The new tag is: {jupyterlab_sha}")
    else:
        print("The tag is update to date")
