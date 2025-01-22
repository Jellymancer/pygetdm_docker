FROM ubuntu:jammy

LABEL Author="Jedrzej Jawor" \
      Email="jjawor@mpifr-bonn.mpg.de"

# Suppress debconf warnings
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN echo 'deb http://us.archive.ubuntu.com/ubuntu jammy main multiverse' >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get --no-install-recommends -y install \
    build-essential \
    autoconf \
    bc \
    autotools-dev \
    automake \
    autogen \
    libtool \
    pkg-config \
    csh \
    gcc \
    gfortran \
    wget \
    git \
    libcfitsio-dev \
    pgplot5 \
    swig3.0 \
    python3 \
    python3-pip \
    python3-dev \
    libglib2.0-dev \
    f2c \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y clean

# Install python3 packages
RUN pip3 install setuptools -U && \
    pip3 install "numpy==1.22.2" -U && \
    pip3 install scipy -U && \
    pip3 install watchdog && \
    pip3 install matplotlib -U && \
    pip3 install bilby -U && \
    pip3 install -U setuptools setuptools_scm pep517 && \
    pip3 install -U emcee && \
    pip3 install jupyterlab -U && \
    pip3 install git+https://github.com/FRBs/sigpyproc3 && \
    pip3 install astropy -U && \
    pip3 install pygedm -U
