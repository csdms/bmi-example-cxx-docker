# Build the C++ BMI example from a condaforge/miniforge3 (Linux/Ubuntu) base.
FROM csdms/bmi:0.2.1

LABEL org.opencontainers.image.authors="Mark Piper <mark.piper@colorado.edu>"
LABEL org.opencontainers.image.url="https://hub.docker.com/r/csdms/bmi-example-cxx"
LABEL org.opencontainers.image.source="https://github.com/csdms/bmi-example-cxx-docker"
LABEL org.opencontainers.image.vendor="CSDMS"

ENV base_url=https://github.com/csdms
ENV project=bmi-example-cxx
ENV version="2.1.3"
ENV prefix=/opt/${project}

RUN git clone --branch v${version} ${base_url}/${project} ${prefix}
WORKDIR ${prefix}/_build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=${CONDA_DIR} && \
    make && \
    make test && \
    make install && \
    make clean

WORKDIR /opt
