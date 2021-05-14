From tiangolo/uwsgi-nginx-flask:python3.6
COPY . /app/
WORKDIR /app/

COPY requirements.txt /app/
RUN pip install -r ./requirements.txt
COPY model_test.py __init__.py /app/
