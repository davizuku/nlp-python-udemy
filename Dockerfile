FROM tensorflow/tensorflow:1.12.0-py3

RUN apt-get update
RUN apt-get install -y git

# wp2txt installation

RUN apt update
RUN apt install -y ruby-full
RUN gem install wp2txt

# python packages

RUN pip install --upgrade pip
RUN pip install git+git://github.com/davidadamojr/TextRank.git
RUN pip install sumy
RUN pip install newsapi-python
RUN pip install rouge
RUN pip install future
RUN pip install gensim

RUN apt-get install texlive-xetex

# course materials

RUN mkdir /vendor && \
    cd /vendor && \
    git clone https://github.com/lazyprogrammer/machine_learning_examples

# locale set up

RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# links management

RUN rm -rf /notebooks/*
RUN ln -s /notebooks/large_files /vendor/machine_learning_examples/large_files
RUN ln -s /vendor /notebooks/vendor
