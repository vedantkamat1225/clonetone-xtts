FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y python3-pip ffmpeg git unzip

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

COPY . .

ENV COQUI_TOS_AGREED=true
ENV PORT=7860

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]
