FROM python:3.6.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD Pipfile /code/
ADD Pipfile.lock /code/
RUN pip install pipenv
RUN pipenv install \ 
 --deploy --system --dev --ignore-pipfile
 # $(test "$DJANGO_ENV" == production || echo "--dev")
ADD . /code/
