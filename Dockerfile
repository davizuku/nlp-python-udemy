FROM tensorflow/tensorflow:latest

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
RUN easy_install hashlib
RUN pip install hashlib
RUN pip install newsapi-python
RUN pip install rouge
RUN pip install future

# course materials

RUN mkdir /vendor && \
    cd /vendor && \
    git clone https://github.com/lazyprogrammer/machine_learning_examples

RUN ln -s /data /vendor/machine_learning_examples/nlp_class2/large_files
RUN ln -s /notebooks/machine_learning_examples /vendor/machine_learning_examples
