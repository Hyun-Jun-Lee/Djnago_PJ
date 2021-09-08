FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/Hyun-Jun-Lee/Django_PJ

WORKDIR /home/Django_PJ/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN echo "SECRET_KEY=django-insecure-%p3cl8#2q3%1!khrkg!ksr)@g#f1nfi@*^zn)8bg+@rz*k+*=0" > .env

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn","stay.wsgi","--bind","0.0.0.0:8000"]