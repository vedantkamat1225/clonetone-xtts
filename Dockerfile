FROM python:3.10

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENV PORT=8080
ENV COQUI_TOS_AGREED=true

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
