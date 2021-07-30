FROM python:3.9-slim-buster

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -y update && apt-get -y install gcc musl-dev postgresql-dev 
  

RUN mkdir /myportfolio
COPY requirements.txt /myportfolio
WORKDIR /myportfolio
RUN pip3 install -r requirements.txt

COPY . /myportfolio

RUN chmod u+x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]