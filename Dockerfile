#base image
FROM python:3.9-alpine3.13

#set enironment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#set the working directory within the container
WORKDIR /django-server

#copy the requirements.txt file to the workdir
COPY ./requirements.txt requirements.txt

#install app dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

#copy from this directory to the workdir
COPY . .