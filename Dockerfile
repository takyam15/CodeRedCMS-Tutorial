FROM python:3.6
LABEL maintainer="config"

ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev

COPY ./requirements.txt /code/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /code/requirements.txt

COPY . /code/
WORKDIR /code/

RUN python manage.py migrate

RUN useradd coderedcms
RUN chown -R coderedcms /code
USER coderedcms
