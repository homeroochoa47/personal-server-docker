FROM python:3.8.3-alpine

ENV SERVER=/home/app/server
#RUN adduser --disabled-password --no-create-home app
# set work directory


RUN mkdir -p $SERVER
RUN mkdir -p $SERVER/staticfiles

# where the code lives
WORKDIR $SERVER

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev gcc python3-dev musl-dev \
    && apk del build-deps \
    && apk --no-cache add musl-dev linux-headers g++
# install dependencies
RUN pip install --upgrade pip
# copy project
COPY . $SERVER
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
RUN pip install -r requirements.txt