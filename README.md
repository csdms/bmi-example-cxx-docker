# bmi-example-cxx-docker

The [C++ example](https://github.com/csdms/bmi-example-cxx)
for the [Basic Model Interface](https://bmi.readthedocs.io),
dockerized.

## Build the image

Build this example locally with:
```
docker build --tag bmi-example-cxx .
```
The image is based on the [csdms/bmi](https://hub.docker.com/r/csdms/bmi) image.
The OS is Linux/Ubuntu.
`conda` and `mamba` are installed in `CONDA_DIR=/opt/conda`,
and the *base* environment is activated.
The C++ BMI specification and example, including the `run_bmiheatc` executable, are installed into it.

## Run a container

Run a container from this image interactively:
```
docker run -it bmi-example-cxx
```
This starts a bash shell in the container.
Run the example program `run_bmiheatcxx` with a configuration file:
```bash
cd /tmp
echo "1.5, 8.0, 6, 5" > config.txt
run_bmiheatcxx config.txt
```
View the program's output with:
```bash
cat bmiheatcxx.out
```

## Developer notes

A versioned, multiplatform image built from this repository is hosted on Docker Hub
at [csdms/bmi-example-cxx](https://hub.docker.com/r/csdms/bmi-example-cxx/).
When this repository is tagged,
an image is automatically built and pushed to Docker Hub
by the [release](./.github/workflows/release.yml) CI workflow.
To manually build and push an update, run:
```
docker buildx build --platform linux/amd64,linux/arm64 -t csdms/bmi-example-cxx:latest --push .
```
A user can pull this image from Docker Hub with:
```
docker pull csdms/bmi-example-cxx
```
optionally with the `latest` tag or with a version tag.
