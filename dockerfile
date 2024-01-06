FROM python:3.12

WORKDIR /Myflix_project/netflixproj/

RUN apt-get update
RUN pip install --no-cache-dir --upgrade pip
COPY . /Myflix_project
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


