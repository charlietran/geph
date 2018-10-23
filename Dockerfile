FROM python:3.6.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD Pipfile /code/
ADD Pipfile.lock /code/
RUN pip install pipenv
RUN pipenv install \
 --deploy --system --ignore-pipfile \
  $([ "$DJANGO_ENV" = production ] || echo "--dev")
RUN apt-get update && apt-get -y install firefox-esr
ADD . /code/
ENV PATH="${PATH}:/code/bin"
