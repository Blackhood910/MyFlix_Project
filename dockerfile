FROM python:3.12

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /Myflix_project/netflixproj/

RUN apt-get update
RUN pip install --no-cache-dir --upgrade pip
COPY . /Myflix_project
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["../../entrypoint.sh"]

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


