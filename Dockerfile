FROM python:3.9

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /app
RUN pip install --no-cache-dir pipenv==2023.4.29
COPY Pipfile Pipfile.lock /app/
RUN pipenv install --dev --system --deploy
COPY ./chat_server/ /app/

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
