FROM python:3.6
LABEL maintainer="config"

ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV "dev"
ENV DJANGO_SETTINGS_MODULE "config.settings.dev"

WORKDIR /code/

COPY ./requirements.txt /code/requirements.txt
RUN pip install --upgrade pip && \
    pip install -r /code/requirements.txt

COPY . /code/

RUN useradd coderedcms
RUN chown -R coderedcms /code
USER coderedcms
