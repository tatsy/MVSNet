FROM nvidia/cuda:9.0-cudnn7-devel

# Envrinment settings
ENV SETUSER root
ENV MVSNET_ROOT /home/$SETUSER/MVSNet
SHELL ["/bin/bash", "-c"]

# Apt
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y git wget bzip2 unzip vim build-essential
RUN apt-get install -y mesa-utils mesa-common-dev libglib2.0-dev

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -q -O miniconda.sh
RUN chmod +x miniconda.sh && ./miniconda.sh -b -p /opt/conda
ENV PATH /opt/conda/bin:$PATH
RUN conda init bash
RUN conda install python=3.7

# MVSNet
RUN git clone https://github.com/tatsy/MVSNet.git --depth 1 $MVSNET_ROOT
RUN cd $MVSNET_ROOT && conda install --yes --file requirements.txt

WORKDIR $MVSNET_ROOT
CMD ["/bin/bash"]

