FROM python:3.8.3-alpine

#where the code lives
ENV SERVER=/home/app/server

#create the 
RUN mkdir -p $SERVER
RUN mkdir -p $SERVER/staticfiles

#create the app user
RUN addgroup -S app && adduser -S app -G app

# set the work directory
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

#copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g'  $SERVER/entrypoint.sh
RUN chmod +x $SERVER/entrypoint.sh

# copy project
COPY . $SERVER
RUN pip install -r requirements.txt

#chown all files to the app user
RUN chown -R app:app $SERVER

#change to the app user
USER app

#run entrypoint.sh
ENTRYPOINT ["/home/app/server/entrypoint.sh"]
