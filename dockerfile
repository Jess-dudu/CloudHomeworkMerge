FROM python:3.11-slim-bullseye

# set teh working directory
WORKDIR /app

# install dependencies
COPY ./requirements.txt /app
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# copy the scripts to the folder
COPY . /app

# start the server
EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app"]
