# Build the C++ BMI example from a condaforge/miniforge3 (Linux/Ubuntu) base.
FROM csdms/bmi:0.2.1

LABEL author="Mark Piper"
LABEL email="mark.piper@colorado.edu"

ENV base_url=https://github.com/csdms
ENV project=bmi-example-cxx
ENV version="2.1.3"
ENV prefix=/opt/${project}

RUN git clone --branch v${version} ${base_url}/${project} ${prefix}
WORKDIR ${prefix}/_build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=${CONDA_DIR} && \
    make && \
    make test && \
    make install

WORKDIR /opt
