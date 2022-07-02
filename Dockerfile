FROM python:3.8.10-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 8000
CMD [ "python", "manage.py", "runserver" ]