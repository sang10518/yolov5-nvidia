# FROM python:3.8-slim-buster
FROM nvcr.io/nvidia/l4t-pytorch:r35.2.1-pth2.0-py3
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get install gcc python3-dev -y

WORKDIR /app
ADD . /app
RUN pip install --upgrade pip
RUN python3 -m pip install psutil
RUN pip install -r requirements.txt
EXPOSE 10518

COPY . .

CMD [ "flask", "run", "--host=0.0.0.0", "--port=10518"]